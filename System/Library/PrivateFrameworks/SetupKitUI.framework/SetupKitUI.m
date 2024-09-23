uint64_t sub_245DE100C()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_25751F998);
  __swift_project_value_buffer(v0, (uint64_t)qword_25751F998);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUIStepHomeKitSetupClient.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepHomeKitSetupClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  return v3;
}

uint64_t SKUIStepHomeKitSetupClient.init(client:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = 0;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  v4 = v2 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  return v2;
}

uint64_t SKUIStepHomeKitSetupClient.perform(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v3 + 344) = a1;
  *(_QWORD *)(v3 + 352) = v2;
  v5 = sub_245E0662C();
  *(_QWORD *)(v3 + 360) = v5;
  *(_QWORD *)(v3 + 368) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 376) = swift_task_alloc();
  v6 = sub_245E062A8();
  *(_QWORD *)(v3 + 384) = v6;
  *(_QWORD *)(v3 + 392) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 400) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EA20);
  *(_QWORD *)(v3 + 408) = v7;
  *(_QWORD *)(v3 + 416) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 424) = swift_task_alloc();
  v8 = sub_245E06404();
  *(_QWORD *)(v3 + 432) = v8;
  *(_QWORD *)(v3 + 440) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v3 + 448) = swift_task_alloc();
  *(_QWORD *)(v3 + 456) = swift_task_alloc();
  v9 = sub_245E06308();
  *(_QWORD *)(v3 + 464) = v9;
  *(_QWORD *)(v3 + 472) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v3 + 480) = swift_task_alloc();
  v10 = sub_245E062FC();
  *(_QWORD *)(v3 + 488) = v10;
  *(_QWORD *)(v3 + 496) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v3 + 504) = swift_task_alloc();
  *(_QWORD *)(v3 + 512) = swift_task_alloc();
  *(_QWORD *)(v3 + 520) = *(_QWORD *)a2;
  *(_BYTE *)(v3 + 233) = *(_BYTE *)(a2 + 8);
  sub_245DE38DC(&qword_25751EA28, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupClient, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupClient);
  *(_QWORD *)(v3 + 528) = sub_245E0680C();
  *(_QWORD *)(v3 + 536) = v11;
  return swift_task_switch();
}

uint64_t sub_245DE135C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  char v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t Strong;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;

  if (qword_25751F990 != -1)
    swift_once();
  v1 = sub_245E0632C();
  *(_QWORD *)(v0 + 544) = __swift_project_value_buffer(v1, (uint64_t)qword_25751F998);
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_BYTE *)(v0 + 233);
    v5 = *(_QWORD *)(v0 + 520);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v31 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 280) = v5;
    *(_BYTE *)(v0 + 288) = v4;
    sub_245DE37FC();
    v8 = sub_245E06A4C();
    *(_QWORD *)(v0 + 336) = sub_245DE3004(v8, v9, &v31);
    sub_245E06914();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245DDF000, v2, v3, "HomeKitSetup start: configuration=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
  }

  v10 = *(_QWORD *)(v0 + 472);
  v11 = *(_QWORD *)(v0 + 480);
  v12 = *(_QWORD *)(v0 + 464);
  *(_QWORD *)(v0 + 552) = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  sub_245E06650();
  sub_245E062E4();
  v13 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  *(_QWORD *)(v0 + 560) = v13;
  v13(v11, v12);
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 568) = Strong;
  if (Strong)
  {
    v15 = *(_BYTE *)(v0 + 233);
    v31 = *(_QWORD *)(v0 + 520);
    v32 = v15;
    sub_245DF41FC((uint64_t)&v31, (uint64_t)&v29);
    *(_QWORD *)(v0 + 576) = v29;
    *(_BYTE *)(v0 + 234) = v30;
    sub_245E06770();
    sub_245DE38DC(&qword_25751EA30, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C08], MEMORY[0x24BE85C18]);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 512);
    v19 = *(_QWORD *)(v0 + 488);
    v18 = *(_QWORD *)(v0 + 496);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 368) + 104))(*(_QWORD *)(v0 + 376), *MEMORY[0x24BE85A48], *(_QWORD *)(v0 + 360));
    sub_245E0671C();
    v20 = (void *)sub_245E06728();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    v21 = v20;
    v22 = v20;
    v23 = sub_245E06314();
    v24 = sub_245E068D8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_getErrorValue();
      v27 = sub_245E06A94();
      *(_QWORD *)(v0 + 328) = sub_245DE3004(v27, v28, &v31);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v23, v24, "### HomeKitSetup failed: error=%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v26, -1, -1);
      MEMORY[0x24954972C](v25, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
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
}

uint64_t sub_245DE182C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_BYTE *)(v0 + 234);
  v2 = *(_QWORD *)(v0 + 576);
  *(_QWORD *)(v0 + 584) = sub_245E06734();
  *(_QWORD *)(v0 + 264) = v2;
  *(_BYTE *)(v0 + 272) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 592) = v3;
  sub_245DE3644();
  *v3 = v0;
  v3[1] = sub_245DE18BC;
  return sub_245E0650C();
}

uint64_t sub_245DE18BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 600) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[57];
    v4 = v2[54];
    v5 = *(void (**)(uint64_t, uint64_t))(v2[55] + 8);
    v2[76] = v5;
    v5(v3, v4);
  }
  return swift_task_switch();
}

uint64_t sub_245DE193C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  char v4;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_245E06314();
  v2 = sub_245E068E4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_245DDF000, v1, v2, "HomeKitSetup perform start", v3, 2u);
    MEMORY[0x24954972C](v3, -1, -1);
  }
  v4 = *(_BYTE *)(v0 + 233);

  if ((v4 & 1) != 0)
  {
    sub_245E0653C();
    sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD7310]), sel_init);
    *(_QWORD *)(v0 + 648) = v6;
    v7 = v6;
    v8 = sub_245E06314();
    v9 = sub_245E068E4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_QWORD *)(v0 + 400);
      v18 = *(_QWORD *)(v0 + 392);
      v11 = *(_QWORD *)(v0 + 384);
      v12 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v20 = v19;
      *(_DWORD *)v12 = 136315138;
      v13 = objc_msgSend(v7, sel_uniqueIdentifier);
      sub_245E0629C();

      sub_245DE38DC(&qword_25751EA68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v14 = sub_245E06A4C();
      v16 = v15;
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v10, v11);
      *(_QWORD *)(v0 + 320) = sub_245DE3004(v14, v16, &v20);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v8, v9, "HomeKitSetup performed: accessory=%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v19, -1, -1);
      MEMORY[0x24954972C](v12, -1, -1);
    }
    else
    {

    }
    nullsub_1();
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 656) = v17;
    sub_245DE3774();
    *v17 = v0;
    v17[1] = sub_245DE20C8;
    return sub_245E0650C();
  }
}

uint64_t sub_245DE1C58()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[75];
  v0[77] = sub_245E064E8();
  v0[78] = v1;
  return swift_task_switch();
}

uint64_t sub_245DE1CB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0[77];
  v3 = v0[52];
  v2 = v0[53];
  v4 = v0[51];
  v5 = (void *)sub_245E06644();
  v6 = objc_msgSend(objc_allocWithZone((Class)SKUIHMDeviceSetupOperation), sel_initWithDispatchQueue_messageSessionTemplate_, v5, v1);
  v0[79] = v6;

  v0[7] = v0 + 38;
  v0[2] = v0;
  v0[3] = sub_245DE1E20;
  swift_continuation_init();
  v0[17] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  sub_245DE36C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EA50);
  sub_245E06818();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_0, v2, v4);
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 1107296256;
  v0[12] = sub_245DE2D84;
  v0[13] = &block_descriptor;
  objc_msgSend(v6, sel_performWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_245DE1E20()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 640) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245DE1E80()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 632);
  v2 = *(_QWORD *)(v0 + 352);

  v3 = *(void **)(v0 + 304);
  v4 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v3;
  v5 = v3;

  *(_QWORD *)(v0 + 648) = v5;
  v6 = v5;
  v7 = sub_245E06314();
  v8 = sub_245E068E4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v0 + 400);
    v18 = *(_QWORD *)(v0 + 392);
    v10 = *(_QWORD *)(v0 + 384);
    v11 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v11 = 136315138;
    v12 = objc_msgSend(v6, sel_uniqueIdentifier);
    sub_245E0629C();

    sub_245DE38DC(&qword_25751EA68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v13 = sub_245E06A4C();
    v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v9, v10);
    *(_QWORD *)(v0 + 320) = sub_245DE3004(v13, v15, &v20);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v7, v8, "HomeKitSetup performed: accessory=%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v19, -1, -1);
    MEMORY[0x24954972C](v11, -1, -1);
  }
  else
  {

  }
  nullsub_1();
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 656) = v16;
  sub_245DE3774();
  *v16 = v0;
  v16[1] = sub_245DE20C8;
  return sub_245E0650C();
}

uint64_t sub_245DE20C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 664) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2 + 608))(*(_QWORD *)(v2 + 448), *(_QWORD *)(v2 + 432));
  return swift_task_switch();
}

uint64_t sub_245DE2144()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;

  v1 = *(void **)(v0 + 648);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 560);
  v3 = *(_QWORD *)(v0 + 504);
  v4 = *(_QWORD *)(v0 + 496);
  v26 = *(_QWORD *)(v0 + 488);
  v5 = *(_QWORD *)(v0 + 480);
  v6 = *(_QWORD *)(v0 + 464);
  SKUIStepHomeKitSetupReport.init()(v0 + 240);
  v7 = *(void **)(v0 + 240);
  *(_QWORD *)(v0 + 240) = v1;
  v8 = v1;

  sub_245E06650();
  sub_245E062E4();
  v2(v5, v6);
  sub_245E062F0();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v3, v26);
  sub_245E06AF4();
  *(_QWORD *)(v0 + 248) = v10;
  v27 = (_BYTE *)(v0 + 256);
  *(_BYTE *)(v0 + 256) = 0;
  v11 = sub_245E06314();
  v12 = sub_245E068E4();
  if (os_log_type_enabled(v11, v12))
  {
    v24 = *(_QWORD *)(v0 + 512);
    v25 = *(void **)(v0 + 648);
    v23 = *(_QWORD *)(v0 + 488);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_beginAccess();
    *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 240);
    *(_BYTE *)(v0 + 232) = *v27;
    sub_245DE37B8();
    v15 = sub_245E06A4C();
    *(_QWORD *)(v0 + 312) = sub_245DE3004(v15, v16, &v28);
    sub_245E06914();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245DDF000, v11, v12, "HomeKitSetup success: report=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
    swift_release();
    swift_release();

    v9(v24, v23);
  }
  else
  {
    v17 = *(void **)(v0 + 648);
    v18 = *(_QWORD *)(v0 + 512);
    v19 = *(_QWORD *)(v0 + 488);
    swift_release();
    swift_release();

    v9(v18, v19);
  }
  v20 = *(_QWORD *)(v0 + 344);
  swift_beginAccess();
  v21 = *v27;
  *(_OWORD *)v20 = *(_OWORD *)(v0 + 240);
  *(_BYTE *)(v20 + 16) = v21;
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

uint64_t sub_245DE2470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 488);
  v3 = *(_QWORD *)(v0 + 496);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(void **)(v0 + 600);
  v5 = v4;
  v6 = v4;
  v7 = sub_245E06314();
  v8 = sub_245E068D8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245E06A94();
    *(_QWORD *)(v0 + 328) = sub_245DE3004(v11, v12, &v14);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v7, v8, "### HomeKitSetup failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v10, -1, -1);
    MEMORY[0x24954972C](v9, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
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

uint64_t sub_245DE26AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 488);
  v3 = *(_QWORD *)(v0 + 496);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(void **)(v0 + 624);
  v5 = v4;
  v6 = v4;
  v7 = sub_245E06314();
  v8 = sub_245E068D8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245E06A94();
    *(_QWORD *)(v0 + 328) = sub_245DE3004(v11, v12, &v14);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v7, v8, "### HomeKitSetup failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v10, -1, -1);
    MEMORY[0x24954972C](v9, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
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

uint64_t sub_245DE28E8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v1 = *(void **)(v0 + 632);
  v2 = *(void **)(v0 + 616);
  v3 = *(_QWORD *)(v0 + 512);
  v4 = *(_QWORD *)(v0 + 488);
  v5 = *(_QWORD *)(v0 + 496);
  swift_willThrow();

  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v6 = *(void **)(v0 + 640);
  v7 = v6;
  v8 = v6;
  v9 = sub_245E06314();
  v10 = sub_245E068D8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v16 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_getErrorValue();
    v13 = sub_245E06A94();
    *(_QWORD *)(v0 + 328) = sub_245DE3004(v13, v14, &v16);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v9, v10, "### HomeKitSetup failed: error=%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v12, -1, -1);
    MEMORY[0x24954972C](v11, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
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

uint64_t sub_245DE2B40()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v1 = *(void **)(v0 + 648);
  v2 = *(_QWORD *)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 496);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v5 = *(void **)(v0 + 664);
  v6 = v5;
  v7 = v5;
  v8 = sub_245E06314();
  v9 = sub_245E068D8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v15 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue();
    v12 = sub_245E06A94();
    *(_QWORD *)(v0 + 328) = sub_245DE3004(v12, v13, &v15);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v8, v9, "### HomeKitSetup failed: error=%s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v11, -1, -1);
    MEMORY[0x24954972C](v10, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
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

void sub_245DE2D84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  __swift_project_boxed_opaque_existential_0((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a3)
  {
    v5 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751EA20);
    sub_245E06824();

  }
  else if (a2)
  {
    v6 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751EA20);
    sub_245E06830();
  }
  else
  {
    __break(1u);
  }
}

uint64_t SKUIStepHomeKitSetupClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_weakDestroy();
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SKUIStepHomeKitSetupClient.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_weakDestroy();
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_245DE2ED8()
{
  sub_245DE38DC(&qword_25751EB28, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupClient, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupClient);
  return sub_245E06638();
}

uint64_t sub_245DE2F28@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249549690]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SKUIStepHomeKitSetupClient()
{
  uint64_t result;

  result = qword_25751FAB0;
  if (!qword_25751FAB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_245DE3004(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245DE30D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245DE3710((uint64_t)v12, *a3);
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
      sub_245DE3710((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_245DE30D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_245E06920();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245DE328C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_245E06968();
  if (!v8)
  {
    sub_245E06980();
    __break(1u);
LABEL_17:
    result = sub_245E069B0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_245DE328C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245DE3320(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245DE34F8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245DE34F8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245DE3320(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_245DE3494(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245E06944();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245E06980();
      __break(1u);
LABEL_10:
      v2 = sub_245E06800();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245E069B0();
    __break(1u);
LABEL_14:
    result = sub_245E06980();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245DE3494(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245DE34F8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB30);
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
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_245E069B0();
  __break(1u);
  return result;
}

unint64_t sub_245DE3644()
{
  unint64_t result;

  result = qword_25751EA38;
  if (!qword_25751EA38)
  {
    result = MEMORY[0x24954969C](&unk_245E080BC, &type metadata for SKUIStepHomeKitSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EA38);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

unint64_t sub_245DE36C4()
{
  unint64_t result;

  result = qword_25751EA48;
  if (!qword_25751EA48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25751EA48);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_245DE3710(a2 + 32, a1 + 32);
}

uint64_t sub_245DE3710(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
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

unint64_t sub_245DE3774()
{
  unint64_t result;

  result = qword_25751EA58;
  if (!qword_25751EA58)
  {
    result = MEMORY[0x24954969C](&unk_245E081BC, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EA58);
  }
  return result;
}

unint64_t sub_245DE37B8()
{
  unint64_t result;

  result = qword_25751EA60;
  if (!qword_25751EA60)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepHomeKitSetupReport, &type metadata for SKUIStepHomeKitSetupReport);
    atomic_store(result, (unint64_t *)&qword_25751EA60);
  }
  return result;
}

unint64_t sub_245DE37FC()
{
  unint64_t result;

  result = qword_25751EA70;
  if (!qword_25751EA70)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepHomeKitSetupConfiguration, &type metadata for SKUIStepHomeKitSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751EA70);
  }
  return result;
}

uint64_t sub_245DE3840()
{
  return type metadata accessor for SKUIStepHomeKitSetupClient();
}

uint64_t sub_245DE3848()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245E0665C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SKUIStepHomeKitSetupClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUIStepHomeKitSetupClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_245DE38DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24954969C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t sub_245DE3984()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_25751FAC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25751FAC8);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUISetupGenericServer.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUISetupGenericServer.server.getter()
{
  return swift_retain();
}

uint64_t SKUISetupGenericServerConfiguration.init(serverConfiguration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;

  v4 = (int *)type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(a2 + v4[5]) = 1;
  *(_BYTE *)(a2 + v4[6]) = 0;
  *(_BYTE *)(a2 + v4[7]) = 1;
  *(_BYTE *)(a2 + v4[8]) = 0;
  *(_BYTE *)(a2 + v4[9]) = 1;
  v5 = sub_245E06674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
}

uint64_t type metadata accessor for SKUISetupGenericServerConfiguration(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_25751FED0);
}

uint64_t SKUISetupGenericServer.__allocating_init(configuration:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SKUISetupGenericServer.init(configuration:environment:)(a1, a2);
  return v4;
}

uint64_t SKUISetupGenericServer.init(configuration:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v6 = sub_245E0665C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_245E06674();
  v10 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__serverEventTask) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__eventContinuations) = MEMORY[0x24BEE4B00];
  sub_245DE98EC(a1, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration, type metadata accessor for SKUISetupGenericServerConfiguration);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, a2, v6);
  sub_245E067B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v17);
  v13((uint64_t)v9, a2, v6);
  v14 = sub_245E06788();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_245DE9930(a1, type metadata accessor for SKUISetupGenericServerConfiguration);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_server) = v14;
  return v3;
}

uint64_t SKUISetupGenericServer.start()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[3] = v0;
  v2 = sub_245E0665C();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB40);
  v1[7] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB48);
  v1[8] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[9] = v4;
  v1[10] = *(_QWORD *)(v4 + 64);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  sub_245DE38DC(&qword_25751EB50, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
  v1[13] = sub_245E0680C();
  v1[14] = v5;
  return swift_task_switch();
}

uint64_t sub_245DE3DD4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;

  if (qword_25751FAC0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25751FAC8);
  swift_retain_n();
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v45 = v5;
    *(_DWORD *)v4 = 136315138;
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v6 = SKUISetupGenericServerConfiguration.description.getter();
    *(_QWORD *)(v0 + 16) = sub_245DE3004(v6, v7, &v45);
    sub_245E06914();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_245DDF000, v2, v3, "start: configuration=%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v5, -1, -1);
    MEMORY[0x24954972C](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v8 = *(_QWORD *)(v0 + 24);
  v9 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__serverEventTask;
  *(_QWORD *)(v0 + 120) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__serverEventTask;
  if (*(_QWORD *)(v8 + v9))
  {
    v10 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration;
    *(_QWORD *)(v0 + 144) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration;
    v11 = v8 + v10;
    v12 = (int *)type metadata accessor for SKUISetupGenericServerConfiguration(0);
    *(_QWORD *)(v0 + 152) = v12;
    if (*(_BYTE *)(v11 + v12[5]) == 1
      && (v13 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation,
          !*(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation)))
    {
      v20 = *(_QWORD *)(v0 + 40);
      v19 = *(_QWORD *)(v0 + 48);
      v21 = *(_QWORD *)(v0 + 32);
      sub_245E066D4();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v21);
      swift_retain();
      v22 = sub_245E066C8();
      *(_QWORD *)(v0 + 160) = v22;
      *(_QWORD *)(v8 + v13) = v22;
      swift_retain();
      swift_release();
      v23 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 168) = v23;
      *v23 = v0;
      v23[1] = sub_245DE4B20;
      return sub_245E066B0();
    }
    else if (*(_BYTE *)(v11 + v12[6]) == 1
           && (v14 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup,
               !*(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup)))
    {
      v25 = *(_QWORD *)(v0 + 40);
      v24 = *(_QWORD *)(v0 + 48);
      v26 = *(_QWORD *)(v0 + 32);
      sub_245E06614();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v26);
      swift_retain();
      v27 = sub_245E06608();
      *(_QWORD *)(v0 + 184) = v27;
      *(_QWORD *)(v8 + v14) = v27;
      swift_retain();
      swift_release();
      v28 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 192) = v28;
      *v28 = v0;
      v28[1] = sub_245DE4F2C;
      return sub_245E065F0();
    }
    else if (*(_BYTE *)(v11 + v12[7]) == 1
           && (v15 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup,
               !*(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup)))
    {
      v30 = *(_QWORD *)(v0 + 40);
      v29 = *(_QWORD *)(v0 + 48);
      v31 = *(_QWORD *)(v0 + 32);
      type metadata accessor for SKUIStepAutoUnlockSetupServer();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v29, v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v31);
      v32 = swift_retain();
      v33 = SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)(v32, v29);
      *(_QWORD *)(v0 + 208) = v33;
      *(_QWORD *)(v8 + v15) = v33;
      swift_retain();
      swift_release();
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v34;
      *v34 = v0;
      v34[1] = sub_245DE526C;
      return SKUIStepAutoUnlockSetupServer.start()();
    }
    else if (*(_BYTE *)(v11 + v12[8]) == 1
           && (v16 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup,
               !*(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup)))
    {
      v36 = *(_QWORD *)(v0 + 40);
      v35 = *(_QWORD *)(v0 + 48);
      v37 = *(_QWORD *)(v0 + 32);
      sub_245E06704();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v37);
      swift_retain();
      v38 = sub_245E066F8();
      *(_QWORD *)(v0 + 232) = v38;
      *(_QWORD *)(v8 + v16) = v38;
      swift_retain();
      swift_release();
      v39 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 240) = v39;
      *v39 = v0;
      v39[1] = sub_245DE54E0;
      return sub_245E066E0();
    }
    else if (*(_BYTE *)(v11 + v12[9]) == 1
           && (v17 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
               !*(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
    {
      v41 = *(_QWORD *)(v0 + 40);
      v40 = *(_QWORD *)(v0 + 48);
      v42 = *(_QWORD *)(v0 + 32);
      sub_245E065A8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v42);
      swift_retain();
      v43 = sub_245E0659C();
      *(_QWORD *)(v0 + 256) = v43;
      *(_QWORD *)(v8 + v17) = v43;
      swift_retain();
      swift_release();
      v44 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 264) = v44;
      *v44 = v0;
      v44[1] = sub_245DE5688;
      return sub_245E06584();
    }
    else
    {
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 128) = *(_QWORD *)(v8 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_server);
    sub_245E067B8();
    sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
    sub_245E0680C();
    return swift_task_switch();
  }
}

uint64_t sub_245DE44A0()
{
  sub_245E067AC();
  return swift_task_switch();
}

uint64_t sub_245DE44DC()
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
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v14 = v0[15];
  v1 = v0[11];
  v2 = v0[12];
  v4 = v0[9];
  v3 = v0[10];
  v5 = v0[7];
  v6 = v0[8];
  v7 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB60);
  v8 = sub_245E06848();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v6);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v11 + v10, v1, v6);
  *(_QWORD *)(v11 + ((v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(_QWORD *)(v7 + v14) = sub_245E062D8();
  swift_release();
  v12 = (_QWORD *)swift_task_alloc();
  v0[17] = v12;
  *v12 = v0;
  v12[1] = sub_245DE4640;
  return sub_245E067A0();
}

uint64_t sub_245DE4640()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE468C()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 64));
  v1 = *(_QWORD *)(v0 + 24);
  v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration;
  *(_QWORD *)(v0 + 144) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration;
  v3 = v1 + v2;
  v4 = (int *)type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_QWORD *)(v0 + 152) = v4;
  if (*(_BYTE *)(v3 + v4[5]) == 1
    && (v5 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation,
        !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation)))
  {
    v12 = *(_QWORD *)(v0 + 40);
    v11 = *(_QWORD *)(v0 + 48);
    v13 = *(_QWORD *)(v0 + 32);
    sub_245E066D4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v13);
    swift_retain();
    v14 = sub_245E066C8();
    *(_QWORD *)(v0 + 160) = v14;
    *(_QWORD *)(v1 + v5) = v14;
    swift_retain();
    swift_release();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v15;
    *v15 = v0;
    v15[1] = sub_245DE4B20;
    return sub_245E066B0();
  }
  else if (*(_BYTE *)(v3 + v4[6]) == 1
         && (v6 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup,
             !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup)))
  {
    v17 = *(_QWORD *)(v0 + 40);
    v16 = *(_QWORD *)(v0 + 48);
    v18 = *(_QWORD *)(v0 + 32);
    sub_245E06614();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v18);
    swift_retain();
    v19 = sub_245E06608();
    *(_QWORD *)(v0 + 184) = v19;
    *(_QWORD *)(v1 + v6) = v19;
    swift_retain();
    swift_release();
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v20;
    *v20 = v0;
    v20[1] = sub_245DE4F2C;
    return sub_245E065F0();
  }
  else if (*(_BYTE *)(v3 + v4[7]) == 1
         && (v7 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup,
             !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup)))
  {
    v22 = *(_QWORD *)(v0 + 40);
    v21 = *(_QWORD *)(v0 + 48);
    v23 = *(_QWORD *)(v0 + 32);
    type metadata accessor for SKUIStepAutoUnlockSetupServer();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v23);
    v24 = swift_retain();
    v25 = SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)(v24, v21);
    *(_QWORD *)(v0 + 208) = v25;
    *(_QWORD *)(v1 + v7) = v25;
    swift_retain();
    swift_release();
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v26;
    *v26 = v0;
    v26[1] = sub_245DE526C;
    return SKUIStepAutoUnlockSetupServer.start()();
  }
  else if (*(_BYTE *)(v3 + v4[8]) == 1
         && (v8 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup,
             !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup)))
  {
    v28 = *(_QWORD *)(v0 + 40);
    v27 = *(_QWORD *)(v0 + 48);
    v29 = *(_QWORD *)(v0 + 32);
    sub_245E06704();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v29);
    swift_retain();
    v30 = sub_245E066F8();
    *(_QWORD *)(v0 + 232) = v30;
    *(_QWORD *)(v1 + v8) = v30;
    swift_retain();
    swift_release();
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v31;
    *v31 = v0;
    v31[1] = sub_245DE54E0;
    return sub_245E066E0();
  }
  else if (*(_BYTE *)(v3 + v4[9]) == 1
         && (v9 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
             !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
  {
    v33 = *(_QWORD *)(v0 + 40);
    v32 = *(_QWORD *)(v0 + 48);
    v34 = *(_QWORD *)(v0 + 32);
    sub_245E065A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v34);
    swift_retain();
    v35 = sub_245E0659C();
    *(_QWORD *)(v0 + 256) = v35;
    *(_QWORD *)(v1 + v9) = v35;
    swift_retain();
    swift_release();
    v36 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v36;
    *v36 = v0;
    v36[1] = sub_245DE5688;
    return sub_245E06584();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE4B20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE4B80()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  swift_release();
  v1 = *(int **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v2 + *(_QWORD *)(v0 + 144);
  if (*(_BYTE *)(v3 + v1[6]) == 1
    && (v4 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup,
        !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup)))
  {
    v10 = *(_QWORD *)(v0 + 40);
    v9 = *(_QWORD *)(v0 + 48);
    v11 = *(_QWORD *)(v0 + 32);
    sub_245E06614();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v11);
    swift_retain();
    v12 = sub_245E06608();
    *(_QWORD *)(v0 + 184) = v12;
    *(_QWORD *)(v2 + v4) = v12;
    swift_retain();
    swift_release();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v13;
    *v13 = v0;
    v13[1] = sub_245DE4F2C;
    return sub_245E065F0();
  }
  else if (*(_BYTE *)(v3 + v1[7]) == 1
         && (v5 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup)))
  {
    v15 = *(_QWORD *)(v0 + 40);
    v14 = *(_QWORD *)(v0 + 48);
    v16 = *(_QWORD *)(v0 + 32);
    type metadata accessor for SKUIStepAutoUnlockSetupServer();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v16);
    v17 = swift_retain();
    v18 = SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)(v17, v14);
    *(_QWORD *)(v0 + 208) = v18;
    *(_QWORD *)(v2 + v5) = v18;
    swift_retain();
    swift_release();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v19;
    *v19 = v0;
    v19[1] = sub_245DE526C;
    return SKUIStepAutoUnlockSetupServer.start()();
  }
  else if (*(_BYTE *)(v3 + v1[8]) == 1
         && (v6 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup)))
  {
    v21 = *(_QWORD *)(v0 + 40);
    v20 = *(_QWORD *)(v0 + 48);
    v22 = *(_QWORD *)(v0 + 32);
    sub_245E06704();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v22);
    swift_retain();
    v23 = sub_245E066F8();
    *(_QWORD *)(v0 + 232) = v23;
    *(_QWORD *)(v2 + v6) = v23;
    swift_retain();
    swift_release();
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v24;
    *v24 = v0;
    v24[1] = sub_245DE54E0;
    return sub_245E066E0();
  }
  else if (*(_BYTE *)(v3 + v1[9]) == 1
         && (v7 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
  {
    v26 = *(_QWORD *)(v0 + 40);
    v25 = *(_QWORD *)(v0 + 48);
    v27 = *(_QWORD *)(v0 + 32);
    sub_245E065A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v25, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v27);
    swift_retain();
    v28 = sub_245E0659C();
    *(_QWORD *)(v0 + 256) = v28;
    *(_QWORD *)(v2 + v7) = v28;
    swift_retain();
    swift_release();
    v29 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v29;
    *v29 = v0;
    v29[1] = sub_245DE5688;
    return sub_245E06584();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE4F2C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE4F8C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  swift_release();
  v1 = *(int **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v2 + *(_QWORD *)(v0 + 144);
  if (*(_BYTE *)(v3 + v1[7]) == 1
    && (v4 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup,
        !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup)))
  {
    v9 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    type metadata accessor for SKUIStepAutoUnlockSetupServer();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v10);
    v11 = swift_retain();
    v12 = SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)(v11, v8);
    *(_QWORD *)(v0 + 208) = v12;
    *(_QWORD *)(v2 + v4) = v12;
    swift_retain();
    swift_release();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v13;
    *v13 = v0;
    v13[1] = sub_245DE526C;
    return SKUIStepAutoUnlockSetupServer.start()();
  }
  else if (*(_BYTE *)(v3 + v1[8]) == 1
         && (v5 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup)))
  {
    v15 = *(_QWORD *)(v0 + 40);
    v14 = *(_QWORD *)(v0 + 48);
    v16 = *(_QWORD *)(v0 + 32);
    sub_245E06704();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v16);
    swift_retain();
    v17 = sub_245E066F8();
    *(_QWORD *)(v0 + 232) = v17;
    *(_QWORD *)(v2 + v5) = v17;
    swift_retain();
    swift_release();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v18;
    *v18 = v0;
    v18[1] = sub_245DE54E0;
    return sub_245E066E0();
  }
  else if (*(_BYTE *)(v3 + v1[9]) == 1
         && (v6 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
  {
    v20 = *(_QWORD *)(v0 + 40);
    v19 = *(_QWORD *)(v0 + 48);
    v21 = *(_QWORD *)(v0 + 32);
    sub_245E065A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v21);
    swift_retain();
    v22 = sub_245E0659C();
    *(_QWORD *)(v0 + 256) = v22;
    *(_QWORD *)(v2 + v6) = v22;
    swift_retain();
    swift_release();
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v23;
    *v23 = v0;
    v23[1] = sub_245DE5688;
    return sub_245E06584();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE526C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE52CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  swift_release();
  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v2 + *(_QWORD *)(v0 + 144);
  if (*(_BYTE *)(v3 + *(int *)(v1 + 32)) == 1
    && (v4 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup,
        !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup)))
  {
    v8 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 32);
    sub_245E06704();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v9);
    swift_retain();
    v10 = sub_245E066F8();
    *(_QWORD *)(v0 + 232) = v10;
    *(_QWORD *)(v2 + v4) = v10;
    swift_retain();
    swift_release();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v11;
    *v11 = v0;
    v11[1] = sub_245DE54E0;
    return sub_245E066E0();
  }
  else if (*(_BYTE *)(v3 + *(int *)(v1 + 36)) == 1
         && (v5 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
             !*(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
  {
    v13 = *(_QWORD *)(v0 + 40);
    v12 = *(_QWORD *)(v0 + 48);
    v14 = *(_QWORD *)(v0 + 32);
    sub_245E065A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v2 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v14);
    swift_retain();
    v15 = sub_245E0659C();
    *(_QWORD *)(v0 + 256) = v15;
    *(_QWORD *)(v2 + v5) = v15;
    swift_retain();
    swift_release();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v16;
    *v16 = v0;
    v16[1] = sub_245DE5688;
    return sub_245E06584();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE54E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE5540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  swift_release();
  v1 = *(_QWORD *)(v0 + 24);
  if (*(_BYTE *)(v1 + *(_QWORD *)(v0 + 144) + *(int *)(*(_QWORD *)(v0 + 152) + 36)) == 1
    && (v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup,
        !*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup)))
  {
    v5 = *(_QWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 32);
    sub_245E065A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment, v6);
    swift_retain();
    v7 = sub_245E0659C();
    *(_QWORD *)(v0 + 256) = v7;
    *(_QWORD *)(v1 + v2) = v7;
    swift_retain();
    swift_release();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v8;
    *v8 = v0;
    v8[1] = sub_245DE5688;
    return sub_245E06584();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE5688()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE56E8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE5748()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE57B4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE5820()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE588C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE58F8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE5964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v4 = sub_245E06518();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v5 = sub_245E06794();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EEB0);
  v3[15] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EEB8);
  v3[16] = v6;
  v3[17] = *(_QWORD *)(v6 - 8);
  v3[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DE5A58()
{
  uint64_t v0;
  int v1;
  int v2;
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB48);
  sub_245E06884();
  swift_beginAccess();
  v1 = *MEMORY[0x24BE85C30];
  *(_DWORD *)(v0 + 176) = *MEMORY[0x24BE85C38];
  *(_DWORD *)(v0 + 180) = v1;
  v2 = *MEMORY[0x24BE85C48];
  *(_DWORD *)(v0 + 184) = *MEMORY[0x24BE85C40];
  *(_DWORD *)(v0 + 188) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v3;
  *v3 = v0;
  v3[1] = sub_245DE5B2C;
  return sub_245E06890();
}

uint64_t sub_245DE5B2C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DE5B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 112), v1, v2);
    Strong = swift_weakLoadStrong();
    *(_QWORD *)(v0 + 160) = Strong;
    if (Strong)
    {
      type metadata accessor for SKUISetupGenericServer(0);
      sub_245DE38DC(&qword_25751EB50, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
      sub_245E0680C();
      return swift_task_switch();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 80));
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE5CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  if (qword_25751FAC0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = sub_245E0632C();
  __swift_project_value_buffer(v5, (uint64_t)qword_25751FAC8);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v1, v2, v3);
  v7 = sub_245E06314();
  v8 = sub_245E068E4();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  v12 = *(_QWORD *)(v0 + 88);
  if (v9)
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v29 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_245DE38DC(&qword_25751EEC0, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C50], MEMORY[0x24BE85C60]);
    v15 = sub_245E06A4C();
    *(_QWORD *)(v13 + 4) = sub_245DE3004(v15, v16, &v29);
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v11);
    _os_log_impl(&dword_245DDF000, v7, v8, "server event: %s", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  }

  *(_QWORD *)(v0 + 168) = v17;
  v18 = *(_DWORD *)(v0 + 176);
  v20 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 96);
  v21 = *(_QWORD *)(v0 + 80);
  v6(v19, *(_QWORD *)(v0 + 112), v21);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 88))(v19, v21);
  if (v22 == v18)
  {
    v23 = *(id **)(v0 + 96);
    (*(void (**)(id *, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v23, *(_QWORD *)(v0 + 80));

  }
  else if (v22 == *(_DWORD *)(v0 + 180))
  {
    v24 = *(_QWORD *)(v0 + 96);
    v25 = *(char **)(v0 + 72);
    v26 = *(_QWORD *)(v0 + 56);
    v27 = *(_QWORD *)(v0 + 64);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v24, *(_QWORD *)(v0 + 80));
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v25, v24, v26);
    sub_245DE6D68(v25);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v26);
  }
  else if (v22 != *(_DWORD *)(v0 + 184) && v22 != *(_DWORD *)(v0 + 188))
  {
    v17(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  }
  return swift_task_switch();
}

uint64_t sub_245DE5F7C()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void (*)(uint64_t, uint64_t))v0[21];
  v2 = v0[14];
  v3 = v0[10];
  swift_release();
  v1(v2, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[19] = v4;
  *v4 = v0;
  v4[1] = sub_245DE5B2C;
  return sub_245E06890();
}

uint64_t SKUISetupGenericServer.cancel()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  sub_245DE38DC(&qword_25751EB50, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
  v1[3] = sub_245E0680C();
  v1[4] = v2;
  return swift_task_switch();
}

uint64_t sub_245DE6068()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  if (qword_25751FAC0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25751FAC8);
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245DDF000, v2, v3, "cancel", v4, 2u);
    MEMORY[0x24954972C](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 16);

  sub_245DE6A10();
  v6 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__serverEventTask;
  if (*(_QWORD *)(v5 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__serverEventTask))
  {
    swift_retain();
    sub_245E062CC();
    swift_release();
  }
  v7 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v5 + v6) = 0;
  swift_release();
  v8 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation;
  *(_QWORD *)(v0 + 40) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepActivation;
  v9 = *(_QWORD *)(v7 + v8);
  *(_QWORD *)(v0 + 48) = v9;
  if (v9)
  {
    swift_retain();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v10;
    *v10 = v0;
    v10[1] = sub_245DE6380;
    return sub_245E066BC();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v12 + v8) = 0;
    v13 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup;
    *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup;
    v14 = *(_QWORD *)(v12 + v13);
    *(_QWORD *)(v0 + 72) = v14;
    if (v14)
    {
      swift_retain();
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v15;
      *v15 = v0;
      v15[1] = sub_245DE6590;
      return sub_245E065FC();
    }
    else
    {
      v16 = *(_QWORD *)(v0 + 16);
      *(_QWORD *)(v16 + v13) = 0;
      v17 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
      *(_QWORD *)(v0 + 88) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
      v18 = *(_QWORD *)(v16 + v17);
      *(_QWORD *)(v0 + 96) = v18;
      if (v18)
      {
        swift_retain();
        v19 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 104) = v19;
        *v19 = v0;
        v19[1] = sub_245DE6740;
        return SKUIStepAutoUnlockSetupServer.cancel()();
      }
      else
      {
        v20 = *(_QWORD *)(v0 + 16);
        *(_QWORD *)(v20 + v17) = 0;
        v21 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
        *(_QWORD *)(v0 + 112) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
        v22 = *(_QWORD *)(v20 + v21);
        *(_QWORD *)(v0 + 120) = v22;
        if (v22)
        {
          swift_retain();
          v23 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 128) = v23;
          *v23 = v0;
          v23[1] = sub_245DE6890;
          return sub_245E066EC();
        }
        else
        {
          v24 = *(_QWORD *)(v0 + 16);
          *(_QWORD *)(v24 + v21) = 0;
          v25 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
          *(_QWORD *)(v0 + 136) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
          v26 = *(_QWORD *)(v24 + v25);
          *(_QWORD *)(v0 + 144) = v26;
          if (v26)
          {
            swift_retain();
            v27 = (_QWORD *)swift_task_alloc();
            *(_QWORD *)(v0 + 152) = v27;
            *v27 = v0;
            v27[1] = sub_245DE6980;
            return sub_245E06590();
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)(v0 + 16) + v25) = 0;
            return (*(uint64_t (**)(void))(v0 + 8))();
          }
        }
      }
    }
  }
}

uint64_t sub_245DE6380()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE63D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + *(_QWORD *)(v0 + 40)) = 0;
  swift_release();
  v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup;
  *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAppleAccountSetup;
  v3 = *(_QWORD *)(v1 + v2);
  *(_QWORD *)(v0 + 72) = v3;
  if (v3)
  {
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v4;
    *v4 = v0;
    v4[1] = sub_245DE6590;
    return sub_245E065FC();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v6 + v2) = 0;
    v7 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
    *(_QWORD *)(v0 + 88) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
    v8 = *(_QWORD *)(v6 + v7);
    *(_QWORD *)(v0 + 96) = v8;
    if (v8)
    {
      swift_retain();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v9;
      *v9 = v0;
      v9[1] = sub_245DE6740;
      return SKUIStepAutoUnlockSetupServer.cancel()();
    }
    else
    {
      v10 = *(_QWORD *)(v0 + 16);
      *(_QWORD *)(v10 + v7) = 0;
      v11 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
      *(_QWORD *)(v0 + 112) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
      v12 = *(_QWORD *)(v10 + v11);
      *(_QWORD *)(v0 + 120) = v12;
      if (v12)
      {
        swift_retain();
        v13 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 128) = v13;
        *v13 = v0;
        v13[1] = sub_245DE6890;
        return sub_245E066EC();
      }
      else
      {
        v14 = *(_QWORD *)(v0 + 16);
        *(_QWORD *)(v14 + v11) = 0;
        v15 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
        *(_QWORD *)(v0 + 136) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
        v16 = *(_QWORD *)(v14 + v15);
        *(_QWORD *)(v0 + 144) = v16;
        if (v16)
        {
          swift_retain();
          v17 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 152) = v17;
          *v17 = v0;
          v17[1] = sub_245DE6980;
          return sub_245E06590();
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(v0 + 16) + v15) = 0;
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
      }
    }
  }
}

uint64_t sub_245DE6590()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE65E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + *(_QWORD *)(v0 + 64)) = 0;
  swift_release();
  v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
  *(_QWORD *)(v0 + 88) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepAutoUnlockSetup;
  v3 = *(_QWORD *)(v1 + v2);
  *(_QWORD *)(v0 + 96) = v3;
  if (v3)
  {
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v4;
    *v4 = v0;
    v4[1] = sub_245DE6740;
    return SKUIStepAutoUnlockSetupServer.cancel()();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v6 + v2) = 0;
    v7 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
    *(_QWORD *)(v0 + 112) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
    v8 = *(_QWORD *)(v6 + v7);
    *(_QWORD *)(v0 + 120) = v8;
    if (v8)
    {
      swift_retain();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v9;
      *v9 = v0;
      v9[1] = sub_245DE6890;
      return sub_245E066EC();
    }
    else
    {
      v10 = *(_QWORD *)(v0 + 16);
      *(_QWORD *)(v10 + v7) = 0;
      v11 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
      *(_QWORD *)(v0 + 136) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
      v12 = *(_QWORD *)(v10 + v11);
      *(_QWORD *)(v0 + 144) = v12;
      if (v12)
      {
        swift_retain();
        v13 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 152) = v13;
        *v13 = v0;
        v13[1] = sub_245DE6980;
        return sub_245E06590();
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(v0 + 16) + v11) = 0;
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
    }
  }
}

uint64_t sub_245DE6740()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE6794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + *(_QWORD *)(v0 + 88)) = 0;
  swift_release();
  v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
  *(_QWORD *)(v0 + 112) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepPhotoPickerSetup;
  v3 = *(_QWORD *)(v1 + v2);
  *(_QWORD *)(v0 + 120) = v3;
  if (v3)
  {
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v4;
    *v4 = v0;
    v4[1] = sub_245DE6890;
    return sub_245E066EC();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v6 + v2) = 0;
    v7 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
    *(_QWORD *)(v0 + 136) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
    v8 = *(_QWORD *)(v6 + v7);
    *(_QWORD *)(v0 + 144) = v8;
    if (v8)
    {
      swift_retain();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 152) = v9;
      *v9 = v0;
      v9[1] = sub_245DE6980;
      return sub_245E06590();
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(v0 + 16) + v7) = 0;
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_245DE6890()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE68E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + *(_QWORD *)(v0 + 112)) = 0;
  swift_release();
  v2 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
  *(_QWORD *)(v0 + 136) = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__stepWiFiSetup;
  v3 = *(_QWORD *)(v1 + v2);
  *(_QWORD *)(v0 + 144) = v3;
  if (v3)
  {
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v4;
    *v4 = v0;
    v4[1] = sub_245DE6980;
    return sub_245E06590();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 16) + v2) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE6980()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE69D4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + *(_QWORD *)(v0 + 136)) = 0;
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE6A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  int64_t v33;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB90);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  v10 = (_QWORD *)(v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__eventContinuations);
  swift_beginAccess();
  v11 = *v10;
  v13 = (_QWORD *)(*v10 + 64);
  v12 = *v13;
  v31 = v10;
  v32 = v13;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v12;
  v33 = (unint64_t)(v14 + 63) >> 6;
  v30 = v33 - 1;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  while (1)
  {
    if (v16)
    {
      v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v20 = v19 | (v18 << 6);
LABEL_6:
      v21 = *(_QWORD *)(v11 + 56);
      *(_QWORD *)v7 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v20);
      v22 = v21 + *(_QWORD *)(v2 + 72) * v20;
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB98);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(&v7[*(int *)(v23 + 48)], v22, v1);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v7, 0, 1, v23);
      goto LABEL_25;
    }
    v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v24 < v33)
    {
      v25 = v32[v24];
      if (v25)
        goto LABEL_10;
      v26 = v18 + 2;
      ++v18;
      if (v24 + 1 < v33)
      {
        v25 = v32[v26];
        if (v25)
          goto LABEL_13;
        v18 = v24 + 1;
        if (v24 + 2 < v33)
        {
          v25 = v32[v24 + 2];
          if (v25)
          {
            v24 += 2;
            goto LABEL_10;
          }
          v26 = v24 + 3;
          v18 = v24 + 2;
          if (v24 + 3 < v33)
            break;
        }
      }
    }
LABEL_24:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB98);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v7, 1, 1, v27);
    v16 = 0;
LABEL_25:
    sub_245DE98A4((uint64_t)v7, (uint64_t)v9);
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB98);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v9, 1, v28) == 1)
    {
      swift_release();
      *v31 = MEMORY[0x24BEE4B00];
      return swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, &v9[*(int *)(v28 + 48)], v1);
    sub_245E06878();
    result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v25 = v32[v26];
  if (v25)
  {
LABEL_13:
    v24 = v26;
LABEL_10:
    v16 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v24 << 6);
    v18 = v24;
    goto LABEL_6;
  }
  while (1)
  {
    v24 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v24 >= v33)
    {
      v18 = v30;
      goto LABEL_24;
    }
    v25 = v32[v24];
    ++v26;
    if (v25)
      goto LABEL_10;
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_245DE6D68(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;

  v43 = a1;
  v39 = sub_245E06470();
  v42 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_245E06440();
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E06344();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  v12 = type metadata accessor for SKUISetupGenericServer.Event(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_245E06518();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (id *)((char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, char *, uint64_t))(v16 + 16))(v18, v43, v15);
  v19 = (*(uint64_t (**)(id *, uint64_t))(v16 + 88))(v18, v15);
  if (v19 == *MEMORY[0x24BE6DC00])
  {
    (*(void (**)(id *, uint64_t))(v16 + 96))(v18, v15);

    return;
  }
  v36 = v4;
  v37 = v12;
  v20 = v40;
  v21 = v41;
  v43 = v14;
  v22 = v42;
  if (v19 == *MEMORY[0x24BE6DBE8] || v19 == *MEMORY[0x24BE6DBF0])
  {
    (*(void (**)(id *, uint64_t))(v16 + 96))(v18, v15);
    swift_release();
    return;
  }
  if (v19 == *MEMORY[0x24BE6DBD8])
  {
    (*(void (**)(id *, uint64_t))(v16 + 96))(v18, v15);
    swift_release();
    v23 = (char *)v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751EEC8) + 48);
    v24 = v6;
    v25 = v11;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v23, v5);
    v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v27 = v9;
    v26(v9, v11, v5);
    v28 = (*(uint64_t (**)(char *, uint64_t))(v24 + 88))(v9, v5);
    if (v28 == *MEMORY[0x24BE6D488])
    {
      (*(void (**)(char *, uint64_t))(v24 + 96))(v9, v5);
      v29 = v36;
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v36, v27, v21);
      v30 = (uint64_t)v43;
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v43, v29, v21);
      swift_storeEnumTagMultiPayload();
      SKUISetupGenericServer._report(event:)(v30);
      sub_245DE9930(v30, type metadata accessor for SKUISetupGenericServer.Event);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v29, v21);
    }
    else
    {
      if (v28 != *MEMORY[0x24BE6D490])
      {
        if (v28 == *MEMORY[0x24BE6D498])
        {
          (*(void (**)(char *, uint64_t))(v24 + 96))(v9, v5);
          v32 = v38;
          v33 = v39;
          (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v38, v9, v39);
          v34 = (uint64_t)v43;
          (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v43, v32, v33);
          swift_storeEnumTagMultiPayload();
          SKUISetupGenericServer._report(event:)(v34);
          sub_245DE9930(v34, type metadata accessor for SKUISetupGenericServer.Event);
          (*(void (**)(char *, uint64_t))(v22 + 8))(v32, v33);
          goto LABEL_17;
        }
        if (v28 != *MEMORY[0x24BE6D480] && v28 != *MEMORY[0x24BE6D4A0] && v28 == *MEMORY[0x24BE6D4A8])
          goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v5);
    }
LABEL_17:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v5);
    return;
  }
  if (v19 == *MEMORY[0x24BE6DBE0])
  {
    v31 = (uint64_t)v43;
    swift_storeEnumTagMultiPayload();
    SKUISetupGenericServer._report(event:)(v31);
    sub_245DE9930(v31, type metadata accessor for SKUISetupGenericServer.Event);
  }
  else
  {
    (*(void (**)(id *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t SKUISetupGenericServer._report(event:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t *v24;
  __int128 v25;
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int64_t v65;
  unint64_t v66;
  char *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;

  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB80);
  v63 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SKUISetupGenericServer.Event(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v53 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v69 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB90);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (int64_t *)((char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v64 = (char *)&v53 - v16;
  v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__eventContinuations);
  swift_beginAccess();
  v18 = *v17;
  v19 = *(_QWORD *)(*v17 + 64);
  v54 = *v17 + 64;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v55 = (unint64_t)(v20 + 63) >> 6;
  v53 = v55 - 1;
  v59 = v18;
  result = swift_bridgeObjectRetain();
  v65 = 0;
  v24 = &qword_25751EB98;
  *(_QWORD *)&v25 = 134218242;
  v57 = v25;
  v56 = MEMORY[0x24BEE4AD8] + 8;
  v68 = v15;
  v58 = a1;
  v62 = v10;
  while (1)
  {
    if (v22)
    {
      v28 = __clz(__rbit64(v22));
      v29 = (v22 - 1) & v22;
      v30 = v28 | (v65 << 6);
LABEL_8:
      v31 = *(_QWORD *)(v59 + 56);
      *v15 = *(_QWORD *)(*(_QWORD *)(v59 + 48) + 8 * v30);
      v32 = v69;
      v33 = v31 + *(_QWORD *)(v69 + 72) * v30;
      v34 = __swift_instantiateConcreteTypeFromMangledName(v24);
      v35 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
      v15 = v68;
      v35((char *)v68 + *(int *)(v34 + 48), v33, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v15, 0, 1, v34);
      v36 = v64;
      goto LABEL_27;
    }
    v37 = v65 + 1;
    if (__OFADD__(v65, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    v36 = v64;
    if (v37 < v55)
    {
      v38 = *(_QWORD *)(v54 + 8 * v37);
      if (v38)
        goto LABEL_12;
      v39 = v65 + 2;
      ++v65;
      if (v37 + 1 < v55)
      {
        v38 = *(_QWORD *)(v54 + 8 * v39);
        if (v38)
          goto LABEL_15;
        v65 = v37 + 1;
        if (v37 + 2 < v55)
        {
          v38 = *(_QWORD *)(v54 + 8 * (v37 + 2));
          if (v38)
          {
            v37 += 2;
            goto LABEL_12;
          }
          v39 = v37 + 3;
          v65 = v37 + 2;
          if (v37 + 3 < v55)
            break;
        }
      }
    }
LABEL_26:
    v40 = __swift_instantiateConcreteTypeFromMangledName(v24);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v15, 1, 1, v40);
    v29 = 0;
LABEL_27:
    sub_245DE98A4((uint64_t)v15, (uint64_t)v36);
    v41 = v24;
    v42 = __swift_instantiateConcreteTypeFromMangledName(v24);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 48))(v36, 1, v42) == 1)
      return swift_release();
    v66 = v29;
    v43 = *(_QWORD *)v36;
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v67, &v36[*(int *)(v42 + 48)], v10);
    if (qword_25751FAC0 != -1)
      swift_once();
    v44 = sub_245E0632C();
    __swift_project_value_buffer(v44, (uint64_t)qword_25751FAC8);
    sub_245DE98EC(a1, (uint64_t)v9, type metadata accessor for SKUISetupGenericServer.Event);
    v45 = sub_245E06314();
    v46 = (uint64_t)v9;
    v47 = sub_245E068E4();
    if (os_log_type_enabled(v45, v47))
    {
      v48 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v70 = v49;
      *(_DWORD *)v48 = v57;
      *(_QWORD *)(v48 + 4) = v43;
      *(_WORD *)(v48 + 12) = 2080;
      v50 = SKUISetupGenericServer.Event.description.getter();
      *(_QWORD *)(v48 + 14) = sub_245DE3004(v50, v51, &v70);
      swift_bridgeObjectRelease();
      sub_245DE9930(v46, type metadata accessor for SKUISetupGenericServer.Event);
      _os_log_impl(&dword_245DDF000, v45, v47, "event monitor report: id=%llu, event={%s}", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v49, -1, -1);
      v52 = v48;
      a1 = v58;
      MEMORY[0x24954972C](v52, -1, -1);
    }
    else
    {
      sub_245DE9930(v46, type metadata accessor for SKUISetupGenericServer.Event);
    }

    v9 = (char *)v46;
    v15 = v68;
    sub_245DE98EC(a1, (uint64_t)v7, type metadata accessor for SKUISetupGenericServer.Event);
    v26 = v60;
    v10 = v62;
    v27 = v67;
    sub_245E0686C();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v26, v61);
    result = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v27, v10);
    v24 = v41;
    v22 = v66;
  }
  v38 = *(_QWORD *)(v54 + 8 * v39);
  if (v38)
  {
LABEL_15:
    v37 = v39;
LABEL_12:
    v29 = (v38 - 1) & v38;
    v30 = __clz(__rbit64(v38)) + (v37 << 6);
    v65 = v37;
    goto LABEL_8;
  }
  while (1)
  {
    v37 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v37 >= v55)
    {
      v65 = v53;
      goto LABEL_26;
    }
    v38 = *(_QWORD *)(v54 + 8 * v37);
    ++v39;
    if (v38)
      goto LABEL_12;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t SKUISetupGenericServer.perform(command:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_245E06524();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_245E06488();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  type metadata accessor for SKUISetupGenericServer.Command(0);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  sub_245DE38DC(&qword_25751EB50, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
  v2[13] = sub_245E0680C();
  v2[14] = v5;
  return swift_task_switch();
}

uint64_t sub_245DE78E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  if (qword_25751FAC0 != -1)
    swift_once();
  v1 = v0[3];
  v2 = v0[12];
  v3 = sub_245E0632C();
  __swift_project_value_buffer(v3, (uint64_t)qword_25751FAC8);
  sub_245DE98EC(v1, v2, type metadata accessor for SKUISetupGenericServer.Command);
  v4 = sub_245E06314();
  v5 = sub_245E068E4();
  v6 = os_log_type_enabled(v4, v5);
  v7 = v0[12];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = SKUISetupGenericServer.Command.description.getter();
    v0[2] = sub_245DE3004(v10, v11, &v18);
    sub_245E06914();
    swift_bridgeObjectRelease();
    sub_245DE9930(v7, type metadata accessor for SKUISetupGenericServer.Command);
    _os_log_impl(&dword_245DDF000, v4, v5, "perform command: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v9, -1, -1);
    MEMORY[0x24954972C](v8, -1, -1);
  }
  else
  {
    sub_245DE9930(v0[12], type metadata accessor for SKUISetupGenericServer.Command);
  }

  v12 = v0[10];
  v13 = v0[11];
  v14 = v0[8];
  v15 = v0[9];
  v16 = v0[4];
  sub_245DE98EC(v0[3], v13, type metadata accessor for SKUISetupGenericServer.Command);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v12, v13, v14);
  v0[15] = *(_QWORD *)(v16 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_server);
  sub_245E067B8();
  sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DE7B3C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = sub_245E0677C();
  return swift_task_switch();
}

uint64_t sub_245DE7B78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[7];
  v2 = v0[5];
  v3 = v0[6];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[9] + 16))(v1, v0[10], v0[8]);
  v4 = *MEMORY[0x24BE6D4C8];
  v5 = sub_245E06350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v1, v4, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x24BE6DC48], v2);
  v6 = (_QWORD *)swift_task_alloc();
  v0[17] = v6;
  *v6 = v0;
  v6[1] = sub_245DE7C34;
  return sub_245E06530();
}

uint64_t sub_245DE7C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_245DE7CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE7D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t SKUISetupGenericServer.Command.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;

  v1 = sub_245E06488();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6D990];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SKUISetupGenericServer.Command(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DE98EC(v0, (uint64_t)v8, v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v12 = 0xD00000000000001ALL;
  v13 = 0x8000000245E09F10;
  sub_245DE38DC(&qword_25751EBA8, v2, MEMORY[0x24BE6D9B0]);
  sub_245E06A4C();
  sub_245E067F4();
  swift_bridgeObjectRelease();
  v10 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  return v10;
}

uint64_t static SKUISetupGenericServer.Command.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_245E06488();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBB0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_245DE98EC(a1, (uint64_t)v11, type metadata accessor for SKUISetupGenericServer.Command);
  sub_245DE98EC(a2, v12, type metadata accessor for SKUISetupGenericServer.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_245E0647C();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t sub_245DE803C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_245E06488();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBB0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_245DE98EC(a1, (uint64_t)v11, type metadata accessor for SKUISetupGenericServer.Command);
  sub_245DE98EC(a2, v12, type metadata accessor for SKUISetupGenericServer.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_245E0647C();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t SKUISetupGenericServer.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v23[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBB8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBC0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = CUNextID64();
  if (qword_25751FAC0 != -1)
    swift_once();
  v14 = sub_245E0632C();
  __swift_project_value_buffer(v14, (uint64_t)qword_25751FAC8);
  v15 = sub_245E06314();
  v16 = sub_245E068CC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = v2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v25 = v13;
    sub_245E06914();
    _os_log_impl(&dword_245DDF000, v15, v16, "event monitor start: id=%llu", v18, 0xCu);
    MEMORY[0x24954972C](v18, -1, -1);
  }

  type metadata accessor for SKUISetupGenericServer.Event(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6A10], v6);
  sub_245E06854();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v12, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_245DE8454((uint64_t)v5, v13);
  swift_endAccess();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v13;
  sub_245E06860();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_245DE8454(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBB8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_245DEB574(a1, &qword_25751EBB8);
    v13 = sub_245DE99E0(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_245DEA164();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_245DE9D44(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_245DEB574((uint64_t)v8, &qword_25751EBB8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_245DE9F10((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_245DE8630(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E06848();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v8[5] = a2;
  sub_245DE8A9C((uint64_t)v5, (uint64_t)&unk_25751EE80, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_245DE874C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_245DE8768()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_245DE8804;
    return sub_245DE887C(*(_QWORD *)(v0 + 56));
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DE8804()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_245DE8860()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 64) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE887C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = a1;
  v2[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EBB8);
  v2[8] = swift_task_alloc();
  sub_245DE38DC(&qword_25751EB50, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DE890C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_25751FAC0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25751FAC8);
  v2 = sub_245E06314();
  v3 = sub_245E068CC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    *(_QWORD *)(v0 + 40) = v4;
    sub_245E06914();
    _os_log_impl(&dword_245DDF000, v2, v3, "event monitor cancel: id=%llu", v5, 0xCu);
    MEMORY[0x24954972C](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  swift_beginAccess();
  sub_245DE8454(v6, v7);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DE8A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E06848();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245E0683C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245DEB574(a1, &qword_25751EB40);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245E0680C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EE98);
  return swift_task_create();
}

uint64_t SKUISetupGenericServer.Event.description.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(_QWORD);
  int EnumCaseMultiPayload;
  unint64_t v15;
  unint64_t v17;
  unint64_t v18;

  v1 = v0;
  v2 = sub_245E06470();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E06440();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SKUISetupGenericServer.Event(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DE98EC(v1, (uint64_t)v12, v13);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v12, v2);
      v17 = 0;
      v18 = 0xE000000000000000;
      sub_245E06938();
      swift_bridgeObjectRelease();
      v17 = 0xD00000000000001ALL;
      v18 = 0x8000000245E09F30;
      sub_245DE38DC(&qword_25751EBC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D970], MEMORY[0x24BE6D980]);
      sub_245E06A4C();
      sub_245E067F4();
      swift_bridgeObjectRelease();
      v15 = v17;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      return 0x6552726576726573;
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v17 = 0xD000000000000018;
    v18 = 0x8000000245E09F50;
    sub_245DE38DC(&qword_25751EBD0, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D8F8], MEMORY[0x24BE6D918]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    v15 = v17;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v15;
}

uint64_t SKUISetupGenericServer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_245DE9930(v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer__configuration, type metadata accessor for SKUISetupGenericServerConfiguration);
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKUISetupGenericServer.__deallocating_deinit()
{
  SKUISetupGenericServer.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_245DE8F80()
{
  sub_245DE38DC(&qword_25751EE68, type metadata accessor for SKUISetupGenericServer, (uint64_t)&protocol conformance descriptor for SKUISetupGenericServer);
  return sub_245E06638();
}

uint64_t sub_245DE8FD0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUISetupGenericServerConfiguration.serverConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245E06674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SKUISetupGenericServerConfiguration.serverConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245E06674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*SKUISetupGenericServerConfiguration.serverConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.activationEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SKUISetupGenericServerConfiguration(0) + 20));
}

uint64_t SKUISetupGenericServerConfiguration.activationEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*SKUISetupGenericServerConfiguration.activationEnabled.modify())(void)
{
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.appleAccountSetupEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SKUISetupGenericServerConfiguration(0) + 24));
}

uint64_t SKUISetupGenericServerConfiguration.appleAccountSetupEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SKUISetupGenericServerConfiguration.appleAccountSetupEnabled.modify())(void)
{
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.autoUnlockSetupEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SKUISetupGenericServerConfiguration(0) + 28));
}

uint64_t SKUISetupGenericServerConfiguration.autoUnlockSetupEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*SKUISetupGenericServerConfiguration.autoUnlockSetupEnabled.modify())(void)
{
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.photoPickerEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SKUISetupGenericServerConfiguration(0) + 32));
}

uint64_t SKUISetupGenericServerConfiguration.photoPickerEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*SKUISetupGenericServerConfiguration.photoPickerEnabled.modify())(void)
{
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.wifiSetupEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SKUISetupGenericServerConfiguration(0) + 36));
}

uint64_t SKUISetupGenericServerConfiguration.wifiSetupEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(0);
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*SKUISetupGenericServerConfiguration.wifiSetupEnabled.modify())(void)
{
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericServerConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v0 = sub_245E062C0();
  v4 = *(_QWORD *)(v0 - 8);
  v5 = v0;
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_245E062B4();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000012;
  v7 = 0x8000000245E09F70;
  type metadata accessor for SKUISetupGenericServerConfiguration(0);
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000019;
  v7 = 0x8000000245E09F90;
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000017;
  v7 = 0x8000000245E09FB0;
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000013;
  v7 = 0x8000000245E09FD0;
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000015;
  v7 = 0x8000000245E09FF0;
  sub_245E06674();
  sub_245DE38DC(&qword_25751EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85AA0], MEMORY[0x24BE85AB0]);
  sub_245E06A4C();
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067F4();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000011;
  v7 = 0x8000000245E0A010;
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v5);
  return v8;
}

uint64_t type metadata accessor for SKUISetupGenericServer(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_25751FEA0);
}

uint64_t sub_245DE972C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245DE9750()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB48);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DE97C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751EB48) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_245DE9848;
  return sub_245DE5964((uint64_t)v6, v4, v5);
}

uint64_t sub_245DE9848()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for SKUISetupGenericServer.Event(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_25751FEC0);
}

uint64_t sub_245DE98A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DE98EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_245DE9930(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for SKUISetupGenericServer.Command(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_25751FEB0);
}

uint64_t sub_245DE9980(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245DE99B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DE99D8()
{
  uint64_t v0;

  return sub_245DE8630(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_245DE99E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245E06AA0();
  return sub_245DEA0C8(a1, v2);
}

uint64_t sub_245DE9A10(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EEA8);
  result = sub_245E06998();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_245E06AA0();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_245DE9D44(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245E0692C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_245E06AA0();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_245DE9F10(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_245DE99E0(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_245DEA038(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_245DEA164();
      goto LABEL_7;
    }
    sub_245DE9A10(v13, a3 & 1);
    v20 = sub_245DE99E0(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_245DEA038(v10, a2, a1, v16);
    }
  }
  result = sub_245E06A70();
  __break(1u);
  return result;
}

uint64_t sub_245DEA038(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

unint64_t sub_245DEA0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_245DEA164()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB88);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EEA8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_245E0698C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_245DEA38C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_245DEA3F4;
  return v5(v2 + 32);
}

uint64_t sub_245DEA3F4()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t _s10SetupKitUI22SKUISetupGenericServerC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  int EnumCaseMultiPayload;
  uint64_t v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a2;
  v3 = sub_245E06470();
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v27 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E06440();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SKUISetupGenericServer.Event(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EE70);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_245DE98EC(a1, (uint64_t)v18, type metadata accessor for SKUISetupGenericServer.Event);
  sub_245DE98EC(v30, v19, type metadata accessor for SKUISetupGenericServer.Event);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v14, type metadata accessor for SKUISetupGenericServer.Event);
    if (!swift_getEnumCaseMultiPayload())
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v19, v5);
      v23 = sub_245E06434();
      v24 = *(void (**)(char *, uint64_t))(v6 + 8);
      v24(v8, v5);
      v25 = v14;
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    goto LABEL_10;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v12, type metadata accessor for SKUISetupGenericServer.Event);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = v27;
      v21 = v28;
      v5 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v27, v19, v29);
      v23 = sub_245E06464();
      v24 = *(void (**)(char *, uint64_t))(v21 + 8);
      v24(v22, v5);
      v25 = v12;
LABEL_12:
      v24(v25, v5);
      sub_245DE9930((uint64_t)v18, type metadata accessor for SKUISetupGenericServer.Event);
      return v23 & 1;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
    goto LABEL_10;
  }
  if (swift_getEnumCaseMultiPayload() != 2)
  {
LABEL_10:
    sub_245DEB574((uint64_t)v18, &qword_25751EE70);
    v23 = 0;
    return v23 & 1;
  }
  sub_245DE9930((uint64_t)v18, type metadata accessor for SKUISetupGenericServer.Event);
  v23 = 1;
  return v23 & 1;
}

uint64_t sub_245DEA71C()
{
  return type metadata accessor for SKUISetupGenericServer(0);
}

uint64_t sub_245DEA724()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for SKUISetupGenericServerConfiguration(319);
  if (v1 <= 0x3F)
  {
    result = sub_245E0665C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SKUISetupGenericServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUISetupGenericServer.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericServer.Command(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_245E06488();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  return sub_245DEB064(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t initializeWithCopy for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E06488();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E06488();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E06488();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E06488();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E06488();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericServer.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245E06488();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_245DEAA10()
{
  return 0;
}

uint64_t sub_245DEAA18(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_245E06488();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericServer.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v10 = sub_245E06470();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_245E06440();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericServer.Event(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_245E06470();
  }
  else
  {
    if ((_DWORD)result)
      return result;
    v3 = sub_245E06440();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

void *initializeWithCopy for SKUISetupGenericServer.Event(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = sub_245E06470();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_245E06440();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for SKUISetupGenericServer.Event(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_245DE9930((uint64_t)a1, type metadata accessor for SKUISetupGenericServer.Event);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v8 = sub_245E06470();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_245E06440();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for SKUISetupGenericServer.Event(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = sub_245E06470();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_245E06440();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for SKUISetupGenericServer.Event(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_245DE9930((uint64_t)a1, type metadata accessor for SKUISetupGenericServer.Event);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v8 = sub_245E06470();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_245E06440();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericServer.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericServer.Event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_245DEAF18()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_245DEAF28()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_245E06440();
  if (v1 <= 0x3F)
  {
    result = sub_245E06470();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SKUISetupGenericServerConfiguration(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245E06674();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericServerConfiguration(uint64_t a1, uint64_t a2)
{
  return sub_245DEB064(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE85AA0]);
}

uint64_t sub_245DEB064(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t initializeWithCopy for SKUISetupGenericServerConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E06674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithCopy for SKUISetupGenericServerConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;

  v6 = sub_245E06674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for SKUISetupGenericServerConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E06674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for SKUISetupGenericServerConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E06674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericServerConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DEB2BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_245E06674();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericServerConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DEB354(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_245E06674();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_245DEB3CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245E06674();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_245DEB444()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DEB470(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_245DE9848;
  v6[6] = v5;
  v6[7] = v4;
  v6[5] = a1;
  return swift_task_switch();
}

uint64_t sub_245DEB4E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DEB504(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245DEB5B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25751EE88 + dword_25751EE88))(a1, v4);
}

uint64_t sub_245DEB574(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245DEB5B4()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_25751FEE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25751FEE8);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUIStepAutoUnlockSetupServer.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_245E07460;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_QWORD *)(v3 + 64) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started) = 0;
  v4 = v3 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKUIStepAutoUnlockSetupServer.init(server:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(v2 + 16) = xmmword_245E07460;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_QWORD *)(v2 + 64) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started) = 0;
  v4 = v2 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKUIStepAutoUnlockSetupServer.start()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[12] = v0;
  v2 = sub_245E0662C();
  v1[13] = v2;
  v1[14] = *(_QWORD *)(v2 - 8);
  v1[15] = swift_task_alloc();
  sub_245DE38DC(&qword_25751EED8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  v1[16] = sub_245E0680C();
  v1[17] = v3;
  return swift_task_switch();
}

uint64_t sub_245DEB868()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t Strong;

  v1 = v0[12];
  v2 = OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started;
  v0[18] = OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started;
  if ((*(_BYTE *)(v1 + v2) & 1) != 0)
  {
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[19] = Strong;
    if (Strong)
    {
      sub_245E067B8();
      sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
      sub_245E0680C();
      return swift_task_switch();
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[14] + 104))(v0[15], *MEMORY[0x24BE85A48], v0[13]);
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t sub_245DEB9AC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 160) = sub_245E0677C();
  return swift_task_switch();
}

uint64_t sub_245DEB9E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = swift_allocObject();
  swift_weakInit();
  v0[5] = &type metadata for SKUIStepAutoUnlockSetupStartRequestHandler;
  v0[6] = sub_245DECC44();
  v0[2] = &unk_25751EEE8;
  v0[3] = v1;
  sub_245E0653C();
  sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
  v0[21] = sub_245E0680C();
  v0[22] = v2;
  return swift_task_switch();
}

uint64_t sub_245DEBAAC()
{
  uint64_t v0;

  sub_245E064DC();
  *(_QWORD *)(v0 + 184) = 0;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_245DEBB18()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = swift_allocObject();
  swift_weakInit();
  v0[10] = &type metadata for SKUIStepAutoUnlockSetupFinishRequestHandler;
  v0[11] = sub_245DED7BC();
  v0[7] = &unk_25751EF00;
  v0[8] = v1;
  return swift_task_switch();
}

uint64_t sub_245DEBB90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 184);
  sub_245E064DC();
  *(_QWORD *)(v0 + 192) = v1;
  if (!v1)
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  return swift_task_switch();
}

uint64_t sub_245DEBBFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 96);
  swift_release();
  swift_release();
  *(_BYTE *)(v2 + v1) = 1;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DEBC58()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DEBCA8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SKUIStepAutoUnlockSetupServer()
{
  uint64_t result;

  result = qword_2575209C0;
  if (!qword_2575209C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245DEBD34()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245DEBD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)(v4 + 96) = a1;
  *(_QWORD *)(v4 + 104) = a4;
  v6 = sub_245E0662C();
  *(_QWORD *)(v4 + 112) = v6;
  *(_QWORD *)(v4 + 120) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 136) = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 152) = v7;
  *(_OWORD *)(v4 + 168) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v4 + 184) = *(_QWORD *)(a2 + 48);
  return swift_task_switch();
}

uint64_t sub_245DEBDD8()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 192) = Strong;
  if (Strong)
  {
    v3 = *(void **)(v0 + 176);
    v2 = *(void **)(v0 + 184);
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(void **)(v0 + 168);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 136);
    *(_OWORD *)(v0 + 24) = *(_OWORD *)(v0 + 144);
    *(_QWORD *)(v0 + 40) = v4;
    *(_QWORD *)(v0 + 48) = v5;
    *(_QWORD *)(v0 + 56) = v3;
    *(_QWORD *)(v0 + 64) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = v5;
    v7 = v3;
    v8 = v2;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v9;
    *v9 = v0;
    v9[1] = sub_245DEBF38;
    return sub_245DEC0E0(v0 + 16);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 104))(*(_QWORD *)(v0 + 128), *MEMORY[0x24BE85A50], *(_QWORD *)(v0 + 112));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DEBF38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(*v1 + 208) = v0;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 176);
  v4 = *(void **)(v2 + 168);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_245DEBFF4()
{
  uint64_t v0;

  sub_245E063F8();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DEC040()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DEC07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_245DEB5B0;
  return sub_245DEBD58(a1, a2, v7, v2);
}

uint64_t sub_245DEC0E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  *(_QWORD *)(v2 + 80) = v1;
  v4 = sub_245E0662C();
  *(_QWORD *)(v2 + 88) = v4;
  *(_QWORD *)(v2 + 96) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 104) = swift_task_alloc();
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 112) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 128) = v5;
  *(_OWORD *)(v2 + 144) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 160) = *(_QWORD *)(a1 + 48);
  sub_245DE38DC(&qword_25751EED8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DEC198()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t (*v71)(void);
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  NSObject *log;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  void *v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  __int128 v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  void *v101;

  v1 = *(_QWORD **)(v0 + 80);
  if (v1[3] == 1)
  {
    if (qword_25751FEE0 != -1)
      swift_once();
    v3 = *(void **)(v0 + 152);
    v2 = *(void **)(v0 + 160);
    v4 = *(void **)(v0 + 144);
    v5 = sub_245E0632C();
    __swift_project_value_buffer(v5, (uint64_t)qword_25751FEE8);
    v6 = v2;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v7 = v4;
    v8 = v3;
    v9 = v6;
    v93 = v7;
    v90 = v8;
    v10 = sub_245E06314();
    v11 = sub_245E068E4();
    v87 = v9;
    if (os_log_type_enabled(v10, v11))
    {
      v12 = *(void **)(v0 + 160);
      v82 = *(_OWORD *)(v0 + 128);
      v84 = *(_OWORD *)(v0 + 144);
      v81 = *(_OWORD *)(v0 + 112);
      v13 = (uint8_t *)swift_slowAlloc();
      v85 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      v97 = v85;
      v98 = v81;
      v99 = v82;
      v100 = v84;
      v101 = v12;
      v14 = SKUIStepAutoUnlockSetupConfiguration.description.getter();
      *(_QWORD *)(v0 + 56) = sub_245DE3004(v14, v15, &v97);
      sub_245E06914();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      _os_log_impl(&dword_245DDF000, v10, v11, "AutoUnlockSetup start: configuration=%s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v85, -1, -1);
      MEMORY[0x24954972C](v13, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

    }
  }
  else
  {
    v86 = v1[4];
    v16 = v1[2];
    v18 = v1[5];
    v17 = (void *)v1[6];
    v19 = (void *)v1[7];
    v20 = (void *)v1[8];
    v21 = qword_25751FEE0;
    v80 = v1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v83 = v17;
    v22 = v17;
    v23 = v19;
    v24 = v20;
    if (v21 != -1)
      swift_once();
    v96 = *(void **)(v0 + 152);
    v91 = *(void **)(v0 + 160);
    v94 = *(void **)(v0 + 144);
    v79 = v0;
    v25 = sub_245E0632C();
    __swift_project_value_buffer(v25, (uint64_t)qword_25751FEE8);
    sub_245DF1814(v16, v80, v86, v18, v17, v19, v20);
    v88 = v91;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v95 = v94;
    v92 = v96;
    v78 = v20;
    sub_245DF1814(v16, v80, v86, v18, v17, v19, v20);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v93 = v95;
    v90 = v92;
    v26 = v88;
    v27 = sub_245E06314();
    v28 = sub_245E068E4();
    log = v27;
    v87 = v26;
    if (os_log_type_enabled(v27, v28))
    {
      v29 = *(void **)(v79 + 160);
      v74 = *(_OWORD *)(v79 + 128);
      v75 = *(_OWORD *)(v79 + 144);
      v73 = *(_OWORD *)(v79 + 112);
      v30 = swift_slowAlloc();
      v76 = swift_slowAlloc();
      v97 = v76;
      *(_DWORD *)v30 = 136315394;
      v98 = v73;
      v99 = v74;
      v100 = v75;
      v101 = v29;
      v31 = SKUIStepAutoUnlockSetupConfiguration.description.getter();
      *(_QWORD *)(v79 + 64) = sub_245DE3004(v31, v32, &v97);
      sub_245E06914();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      *(_WORD *)(v30 + 12) = 2080;
      *(_QWORD *)&v98 = v16;
      *((_QWORD *)&v98 + 1) = v80;
      *(_QWORD *)&v99 = v86;
      *((_QWORD *)&v99 + 1) = v18;
      *(_QWORD *)&v100 = v83;
      *((_QWORD *)&v100 + 1) = v19;
      v101 = v78;
      v33 = SKUIStepAutoUnlockSetupConfiguration.description.getter();
      *(_QWORD *)(v79 + 72) = sub_245DE3004(v33, v34, &v97);
      sub_245E06914();
      swift_bridgeObjectRelease();
      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v78);
      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v78);
      _os_log_impl(&dword_245DDF000, log, v28, "AutoUnlockSetup start: configuration=%s, oldConfiguration=%s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v76, -1, -1);
      MEMORY[0x24954972C](v30, -1, -1);

      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v78);
    }
    else
    {
      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v20);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v20);
      sub_245DEDCD8(v16, v80, v86, v18, v83, v19, v20);

    }
    v0 = v79;
  }
  v35 = *(_QWORD *)(v0 + 144);
  v36 = v1[2];
  v37 = v1[3];
  v38 = v1[4];
  v39 = v1[5];
  v40 = (void *)v1[6];
  v41 = (void *)v1[7];
  v42 = (void *)v1[8];
  v43 = *(_OWORD *)(v0 + 128);
  v89 = *(_OWORD *)(v0 + 152);
  *((_OWORD *)v1 + 1) = *(_OWORD *)(v0 + 112);
  *((_OWORD *)v1 + 2) = v43;
  v1[6] = v35;
  *(_OWORD *)(v1 + 7) = v89;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v44 = v93;
  v45 = v90;
  v46 = v87;
  sub_245DEDCD8(v36, v37, v38, v39, v40, v41, v42);
  if ((_QWORD)v89)
  {
    v48 = *(_QWORD *)(v0 + 96);
    v47 = *(_QWORD *)(v0 + 104);
    v49 = *(_QWORD *)(v0 + 88);
    sub_245E0671C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x24BE85A50], v49);
    v50 = v45;
    v51 = (void *)sub_245E06728();
    swift_willThrow();

    v52 = v1[2];
    v53 = v1[3];
    v54 = v1[4];
    v55 = v1[5];
    v56 = (void *)v1[6];
    v57 = (void *)v1[7];
    v58 = (void *)v1[8];
    *((_OWORD *)v1 + 1) = xmmword_245E07460;
    *((_OWORD *)v1 + 2) = 0u;
    *((_OWORD *)v1 + 3) = 0u;
    v1[8] = 0;
    sub_245DEDCD8(v52, v53, v54, v55, v56, v57, v58);
    if (qword_25751FEE0 != -1)
      swift_once();
    v59 = sub_245E0632C();
    __swift_project_value_buffer(v59, (uint64_t)qword_25751FEE8);
    v60 = v51;
    v61 = sub_245E06314();
    v62 = sub_245E068D8();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = swift_slowAlloc();
      *(_QWORD *)&v98 = v64;
      *(_DWORD *)v63 = 136315138;
      swift_getErrorValue();
      v65 = sub_245E06A94();
      *(_QWORD *)(v0 + 48) = sub_245DE3004(v65, v66, (uint64_t *)&v98);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v61, v62, "### AutoUnlockSetup start failed: error=%s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v64, -1, -1);
      MEMORY[0x24954972C](v63, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    v71 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (qword_25751FEE0 != -1)
      swift_once();
    v67 = sub_245E0632C();
    __swift_project_value_buffer(v67, (uint64_t)qword_25751FEE8);
    v68 = sub_245E06314();
    v69 = sub_245E068E4();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v70 = 0;
      _os_log_impl(&dword_245DDF000, v68, v69, "AutoUnlockSetup start success", v70, 2u);
      MEMORY[0x24954972C](v70, -1, -1);
    }

    swift_task_dealloc();
    v71 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v71();
}

unint64_t sub_245DECC44()
{
  unint64_t result;

  result = qword_25751EEF0;
  if (!qword_25751EEF0)
  {
    result = MEMORY[0x24954969C](&unk_245E076EC, &type metadata for SKUIStepAutoUnlockSetupStartRequestHandler);
    atomic_store(result, &qword_25751EEF0);
  }
  return result;
}

uint64_t sub_245DECC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[9] = a1;
  v3[10] = a3;
  v4 = sub_245E0662C();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DECCE8()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 112) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v2;
    *v2 = v0;
    v2[1] = sub_245DECDF4;
    return sub_245DECF30(v0 + 16);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 104))(*(_QWORD *)(v0 + 104), *MEMORY[0x24BE85A50], *(_QWORD *)(v0 + 88));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DECDF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DECE58()
{
  uint64_t v0;
  _OWORD *v1;
  __int128 v2;

  v1 = *(_OWORD **)(v0 + 72);
  swift_release();
  v2 = *(_OWORD *)(v0 + 32);
  *v1 = *(_OWORD *)(v0 + 16);
  v1[1] = v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DECEA0()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DECEDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245DEB5B0;
  return sub_245DECC88(a1, v5, v1);
}

uint64_t sub_245DECF30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[19] = a1;
  v2[20] = v1;
  v3 = sub_245E0662C();
  v2[21] = v3;
  v2[22] = *(_QWORD *)(v3 - 8);
  v2[23] = swift_task_alloc();
  sub_245DE38DC(&qword_25751EED8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  v2[24] = sub_245E0680C();
  v2[25] = v4;
  return swift_task_switch();
}

uint64_t sub_245DECFC4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t v30;

  if (qword_25751FEE0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  *(_QWORD *)(v0 + 208) = __swift_project_value_buffer(v1, (uint64_t)qword_25751FEE8);
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245DDF000, v2, v3, "AutoUnlockSetup finish", v4, 2u);
    MEMORY[0x24954972C](v4, -1, -1);
  }
  v5 = *(_QWORD **)(v0 + 160);

  v6 = v5[2];
  *(_QWORD *)(v0 + 216) = v6;
  v7 = v5[3];
  *(_QWORD *)(v0 + 224) = v7;
  v8 = v5[4];
  *(_QWORD *)(v0 + 232) = v8;
  v9 = v5[5];
  *(_QWORD *)(v0 + 240) = v9;
  v10 = (void *)v5[6];
  *(_QWORD *)(v0 + 248) = v10;
  v11 = (void *)v5[7];
  *(_QWORD *)(v0 + 256) = v11;
  v12 = (void *)v5[8];
  *(_QWORD *)(v0 + 264) = v12;
  if (v7 == 1)
  {
    v14 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 184);
    v15 = *(_QWORD *)(v0 + 168);
    sub_245E0671C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE85A50], v15);
    v16 = (void *)sub_245E06728();
    swift_willThrow();
    v17 = v16;
    v18 = v16;
    v19 = sub_245E06314();
    v20 = sub_245E068D8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v30 = v22;
      *(_DWORD *)v21 = 136315138;
      swift_getErrorValue();
      v23 = sub_245E06A94();
      *(_QWORD *)(v0 + 136) = sub_245DE3004(v23, v24, &v30);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v19, v20, "### AutoUnlockSetup finish failed: error=%s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v22, -1, -1);
      MEMORY[0x24954972C](v21, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v6;
    *(_QWORD *)(v0 + 24) = v7;
    *(_QWORD *)(v0 + 32) = v8;
    *(_QWORD *)(v0 + 40) = v9;
    *(_QWORD *)(v0 + 48) = v10;
    *(_QWORD *)(v0 + 56) = v11;
    *(_QWORD *)(v0 + 64) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = v10;
    v26 = v11;
    v27 = v12;
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v28;
    *v28 = v0;
    v28[1] = sub_245DED34C;
    return sub_245DEDA94(v0 + 72, v0 + 16);
  }
}

uint64_t sub_245DED34C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DED3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_t log;
  uint64_t v29;
  uint64_t v30[5];

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 96);
  v29 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v4 = sub_245E06314();
  v5 = sub_245E068E4();
  log = v4;
  if (os_log_type_enabled(v4, v5))
  {
    v25 = *(void **)(v0 + 256);
    v26 = *(void **)(v0 + 264);
    v23 = *(_QWORD *)(v0 + 240);
    v24 = *(void **)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 224);
    v22 = *(_QWORD *)(v0 + 232);
    v20 = *(_QWORD *)(v0 + 216);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    v30[0] = v7;
    v30[1] = v2;
    v30[2] = v1;
    v30[3] = v29;
    v30[4] = v3;
    v8 = SKUIStepAutoUnlockSetupReport.description.getter();
    *(_QWORD *)(v0 + 144) = sub_245DE3004(v8, v9, v30);
    sub_245E06914();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245DDF000, v4, v5, "AutoUnlockSetup finished: report=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
    sub_245DEDCD8(v20, v21, v22, v23, v24, v25, v26);

  }
  else
  {
    v10 = *(void **)(v0 + 256);
    v27 = *(void **)(v0 + 264);
    v12 = *(_QWORD *)(v0 + 240);
    v11 = *(void **)(v0 + 248);
    v14 = *(_QWORD *)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 232);
    v15 = v2;
    v16 = *(_QWORD *)(v0 + 216);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v17 = v16;
    v2 = v15;
    sub_245DEDCD8(v17, v14, v13, v12, v11, v10, v27);

  }
  v18 = *(uint64_t **)(v0 + 152);
  *v18 = v2;
  v18[1] = v1;
  v18[2] = v29;
  v18[3] = v3;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DED5FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  sub_245DEDCD8(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240), *(void **)(v0 + 248), *(void **)(v0 + 256), *(void **)(v0 + 264));
  v1 = *(void **)(v0 + 280);
  v2 = v1;
  v3 = v1;
  v4 = sub_245E06314();
  v5 = sub_245E068D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_245E06A94();
    *(_QWORD *)(v0 + 136) = sub_245DE3004(v8, v9, &v11);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v4, v5, "### AutoUnlockSetup finish failed: error=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_245DED7BC()
{
  unint64_t result;

  result = qword_25751EF08;
  if (!qword_25751EF08)
  {
    result = MEMORY[0x24954969C](&unk_245E07884, &type metadata for SKUIStepAutoUnlockSetupFinishRequestHandler);
    atomic_store(result, (unint64_t *)&qword_25751EF08);
  }
  return result;
}

uint64_t SKUIStepAutoUnlockSetupServer.cancel()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  sub_245DE38DC(&qword_25751EED8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  v1[3] = sub_245E0680C();
  v1[4] = v2;
  return swift_task_switch();
}

uint64_t sub_245DED86C()
{
  uint64_t v0;
  uint64_t Strong;

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 40) = Strong;
  if (Strong)
  {
    sub_245E067B8();
    sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DED920()
{
  _QWORD *v0;
  uint64_t v1;

  v0[6] = sub_245E0677C();
  swift_release();
  sub_245E0653C();
  sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
  v0[7] = sub_245E0680C();
  v0[8] = v1;
  return swift_task_switch();
}

uint64_t sub_245DED9B4()
{
  sub_245E064F4();
  return swift_task_switch();
}

uint64_t sub_245DEDA04()
{
  sub_245E064F4();
  return swift_task_switch();
}

uint64_t sub_245DEDA54()
{
  uint64_t v0;

  swift_release();
  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer__started) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DEDA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[2] = a1;
  v3[3] = v2;
  v5 = sub_245E0662C();
  v3[4] = v5;
  v3[5] = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v7 = *(_QWORD *)(a2 + 48);
  v3[6] = v6;
  v3[7] = v7;
  sub_245DE38DC(&qword_25751EED8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DEDB38()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t (*v6)(void);
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = (void *)v0[7];
  if (!v1)
  {
    v7 = (_QWORD *)v0[3];
    v8 = v7[3];
    v9 = v8;
    if (v8)
    {
      if (v8 == 1)
      {
        v9 = 0;
        v8 = 0;
        v10 = 0;
        goto LABEL_9;
      }
      v9 = v7[2];
      swift_bridgeObjectRetain();
    }
    v10 = v7[5];
    if (v10)
    {
      v11 = v7[4];
      v10 = swift_bridgeObjectRetain();
LABEL_10:
      v12 = (_QWORD *)v0[2];
      *v12 = v11;
      v12[1] = v10;
      v12[2] = v9;
      v12[3] = v8;
      swift_task_dealloc();
      v6 = (uint64_t (*)(void))v0[1];
      return v6();
    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v3 = v0[5];
  v2 = v0[6];
  v4 = v0[4];
  sub_245E0671C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE85A50], v4);
  v5 = v1;
  sub_245E06728();
  swift_willThrow();

  swift_task_dealloc();
  v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

SetupKitUI::SKUIStepAutoUnlockSetupReport __swiftcall SKUIStepAutoUnlockSetupReport.init()()
{
  _OWORD *v0;
  SetupKitUI::SKUIStepAutoUnlockSetupReport result;

  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t SKUIStepAutoUnlockSetupServer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_245DEDCD8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_weakDestroy();
  return v0;
}

void sub_245DEDCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t SKUIStepAutoUnlockSetupServer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_245DEDCD8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_245DEDDAC()
{
  sub_245DE38DC(&qword_25751F0C0, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupServer);
  return sub_245E06638();
}

uint64_t sub_245DEDDFC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.mockPersonaIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.mockPersonaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SKUIStepAutoUnlockSetupConfiguration.mockPersonaIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.mockPersonalDeviceVolumeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.mockPersonalDeviceVolumeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SKUIStepAutoUnlockSetupConfiguration.mockPersonalDeviceVolumeIdentifier.modify())()
{
  return nullsub_1;
}

void *SKUIStepAutoUnlockSetupConfiguration.mockSharingClientError.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void SKUIStepAutoUnlockSetupConfiguration.mockSharingClientError.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*SKUIStepAutoUnlockSetupConfiguration.mockSharingClientError.modify())()
{
  return nullsub_1;
}

void *SKUIStepAutoUnlockSetupConfiguration.mockSharingServerStartError.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 40);
  v2 = v1;
  return v1;
}

void SKUIStepAutoUnlockSetupConfiguration.mockSharingServerStartError.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
}

uint64_t (*SKUIStepAutoUnlockSetupConfiguration.mockSharingServerStartError.modify())()
{
  return nullsub_1;
}

void *SKUIStepAutoUnlockSetupConfiguration.mockSharingServerFinishError.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void SKUIStepAutoUnlockSetupConfiguration.mockSharingServerFinishError.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
}

uint64_t (*SKUIStepAutoUnlockSetupConfiguration.mockSharingServerFinishError.modify())()
{
  return nullsub_1;
}

double SKUIStepAutoUnlockSetupConfiguration.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.description.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = sub_245E062C0();
  v2 = *(_QWORD *)(v1 - 8);
  v17 = v1;
  v18 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[1];
  v6 = v0[3];
  v7 = (void *)v0[4];
  v8 = (void *)v0[5];
  v9 = (void *)v0[6];
  v22 = 0;
  v23 = 0xE000000000000000;
  sub_245E062B4();
  if (v6)
  {
    v20 = 0;
    v21 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v20 = 0xD000000000000023;
    v21 = 0x8000000245E0A200;
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
  }
  if (v5)
  {
    v20 = 0;
    v21 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v20 = 0xD000000000000016;
    v21 = 0x8000000245E0A1E0;
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    v20 = 0;
    v21 = 0xE000000000000000;
    v10 = v7;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v20 = 0xD000000000000017;
    v21 = 0x8000000245E0A1C0;
    v19 = v10;
    sub_245E0671C();
    sub_245DE38DC(&qword_25751EF18, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B90], MEMORY[0x24BDD01A8]);
    sub_245E06A94();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067DC();

    swift_bridgeObjectRelease();
  }
  if (v8)
  {
    v20 = 0;
    v21 = 0xE000000000000000;
    v11 = v8;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v20 = 0xD00000000000001CLL;
    v21 = 0x8000000245E0A1A0;
    v19 = v11;
    sub_245E0671C();
    sub_245DE38DC(&qword_25751EF18, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B90], MEMORY[0x24BDD01A8]);
    sub_245E06A94();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067DC();

    swift_bridgeObjectRelease();
  }
  if (v9)
  {
    v20 = 0;
    v21 = 0xE000000000000000;
    v12 = v9;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v20 = 0xD00000000000001DLL;
    v21 = 0x8000000245E0A180;
    v19 = v12;
    sub_245E0671C();
    sub_245DE38DC(&qword_25751EF18, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B90], MEMORY[0x24BDD01A8]);
    sub_245E06A94();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067DC();

    swift_bridgeObjectRelease();
  }
  v13 = v22;
  v14 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0)
    v14 = v22 & 0xFFFFFFFFFFFFLL;
  if (!v14)
  {
    swift_bridgeObjectRelease();
    v13 = 0x746C7561666564;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v17);
  return v13;
}

uint64_t sub_245DEE40C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245DEE444 + 4 * byte_245E07480[a1]))(0xD000000000000015, 0x8000000245E0A2D0);
}

uint64_t sub_245DEE444(uint64_t a1)
{
  return a1 + 13;
}

BOOL sub_245DEE48C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245DEE4A0()
{
  sub_245E06AAC();
  sub_245E06AB8();
  return sub_245E06AC4();
}

uint64_t sub_245DEE4E4()
{
  return sub_245E06AB8();
}

uint64_t sub_245DEE50C()
{
  sub_245E06AAC();
  sub_245E06AB8();
  return sub_245E06AC4();
}

uint64_t sub_245DEE54C()
{
  unsigned __int8 *v0;

  return sub_245DEE40C(*v0);
}

uint64_t sub_245DEE554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245DF133C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245DEE578()
{
  return 0;
}

void sub_245DEE584(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_245DEE590()
{
  sub_245DEFE74();
  return sub_245E06B00();
}

uint64_t sub_245DEE5B8()
{
  sub_245DEFE74();
  return sub_245E06B0C();
}

uint64_t SKUIStepAutoUnlockSetupConfiguration.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char v20;
  uint64_t v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF20);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v17 = v1[3];
  v18 = v7;
  v8 = v1[4];
  v15 = v1[5];
  v16 = v8;
  v14 = v1[6];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFE74();
  sub_245E06ADC();
  LOBYTE(v21) = 0;
  v9 = v19;
  sub_245E06A1C();
  if (!v9)
  {
    v11 = v15;
    v10 = v16;
    LOBYTE(v21) = 1;
    sub_245E06A1C();
    v21 = v10;
    v20 = 2;
    sub_245E0671C();
    sub_245DE38DC(&qword_25751EF28, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B90], MEMORY[0x24BE85BA0]);
    sub_245E06A34();
    v21 = v11;
    v20 = 3;
    sub_245E06A34();
    v21 = v14;
    v20 = 4;
    sub_245E06A34();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void SKUIStepAutoUnlockSetupConfiguration.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  id v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF30);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFE74();
  sub_245E06AD0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    LOBYTE(v32) = 0;
    v9 = sub_245E069D4();
    v11 = v10;
    LOBYTE(v32) = 1;
    swift_bridgeObjectRetain();
    v27 = sub_245E069D4();
    v30 = v12;
    v13 = sub_245E0671C();
    v31 = 2;
    v14 = sub_245DE38DC(&qword_25751EF38, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B90], MEMORY[0x24BE85BA8]);
    swift_bridgeObjectRetain();
    v28 = v14;
    v29 = v13;
    sub_245E069EC();
    v25 = v9;
    v15 = (uint64_t)v32;
    v31 = 3;
    v26 = v32;
    sub_245E069EC();
    v31 = 4;
    v23 = (uint64_t)v32;
    v24 = a2;
    v16 = v32;
    sub_245E069EC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v17 = (uint64_t)v32;
    v18 = v32;
    v19 = v24;
    *v24 = v25;
    v19[1] = v11;
    v20 = v30;
    v19[2] = v27;
    v19[3] = v20;
    v21 = v23;
    v19[4] = v15;
    v19[5] = v21;
    v19[6] = v17;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_245DEEB60(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  SKUIStepAutoUnlockSetupConfiguration.init(from:)(a1, a2);
}

uint64_t sub_245DEEB74(_QWORD *a1)
{
  return SKUIStepAutoUnlockSetupConfiguration.encode(to:)(a1);
}

uint64_t SKUIStepAutoUnlockSetupReport.personalDeviceVolumeIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKUIStepAutoUnlockSetupReport.personalDeviceVolumeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SKUIStepAutoUnlockSetupReport.personalDeviceVolumeIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SKUIStepAutoUnlockSetupReport.personaIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKUIStepAutoUnlockSetupReport.personaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SKUIStepAutoUnlockSetupReport.personaIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SKUIStepAutoUnlockSetupReport.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v1 = sub_245E062C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + 8);
  v6 = *(_QWORD *)(v0 + 24);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_245E062B4();
  if (v5)
  {
    v8 = 0;
    v9 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v8 = 0xD00000000000001FLL;
    v9 = 0x8000000245E0A250;
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
  }
  if (v6)
  {
    v8 = 0;
    v9 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v8 = 0xD000000000000012;
    v9 = 0x8000000245E0A230;
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

BOOL sub_245DEEDD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_245DEEDF0()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0xD00000000000001ELL;
}

uint64_t sub_245DEEE30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245DF152C(a1, a2);
  *a3 = result;
  return result;
}

void sub_245DEEE54(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_245DEEE60()
{
  sub_245DEFF68();
  return sub_245E06B00();
}

uint64_t sub_245DEEE88()
{
  sub_245DEFF68();
  return sub_245E06B0C();
}

uint64_t SKUIStepAutoUnlockSetupReport.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF40);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFF68();
  sub_245E06ADC();
  v12 = 0;
  sub_245E06A1C();
  if (!v2)
  {
    v11 = 1;
    sub_245E06A1C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t SKUIStepAutoUnlockSetupReport.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF48);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFF68();
  sub_245E06AD0();
  if (!v2)
  {
    v20 = 0;
    v9 = sub_245E069D4();
    v11 = v10;
    v19 = 1;
    swift_bridgeObjectRetain();
    v12 = sub_245E069D4();
    v15 = v14;
    v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v17 = v12;
    v16(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v17;
    a2[3] = v15;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245DEF194@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SKUIStepAutoUnlockSetupReport.init(from:)(a1, a2);
}

uint64_t sub_245DEF1A8(_QWORD *a1)
{
  return SKUIStepAutoUnlockSetupReport.encode(to:)(a1);
}

uint64_t sub_245DEF1C4()
{
  return 1;
}

uint64_t sub_245DEF1D0()
{
  return sub_245E06AB8();
}

uint64_t sub_245DEF1FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_245DF1618(a1, a2);
  *a3 = result != 0;
  return result;
}

void sub_245DEF228(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_245DEF234()
{
  sub_245DEFFAC();
  return sub_245E06B00();
}

uint64_t sub_245DEF25C()
{
  sub_245DEFFAC();
  return sub_245E06B0C();
}

uint64_t sub_245DEF284(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF50);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v11 = v1[1];
  v12 = v7;
  v10 = v1[2];
  v8 = *((_QWORD *)v1 + 6);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFFAC();
  sub_245E06ADC();
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v8;
  sub_245DEFFF0();
  sub_245E06A40();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

__n128 sub_245DEF3B0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 48) = v2;
  return result;
}

uint64_t sub_245DEF3CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[3];
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DEFFAC();
  sub_245E06AD0();
  if (!v2)
  {
    sub_245DF0034();
    sub_245E069F8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v14;
    v10 = v13[1];
    v11 = v13[2];
    *(_OWORD *)a2 = v13[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = v11;
    *(_QWORD *)(a2 + 48) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_245DEF4FC()
{
  return 0xD000000000000016;
}

uint64_t sub_245DEF520()
{
  return sub_245E06398();
}

uint64_t sub_245DEF534()
{
  return sub_245E063A4();
}

uint64_t sub_245DEF548@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_245DEF3CC(a1, a2);
}

uint64_t sub_245DEF55C(_QWORD *a1)
{
  return sub_245DEF284(a1);
}

uint64_t sub_245DEF570()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_245DEF5A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245DE9848;
  return sub_245E063EC();
}

uint64_t sub_245DEF64C()
{
  sub_245E06AAC();
  sub_245E06AB8();
  return sub_245E06AC4();
}

uint64_t sub_245DEF68C()
{
  sub_245E06AAC();
  sub_245E06AB8();
  return sub_245E06AC4();
}

uint64_t sub_245DEF6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_245DF16D8(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_245DEF6F8()
{
  sub_245DF0078();
  return sub_245E06B00();
}

uint64_t sub_245DEF720()
{
  sub_245DF0078();
  return sub_245E06B0C();
}

uint64_t sub_245DEF748(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)v1;
  v8 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF0078();
  sub_245E06ADC();
  v10[1] = v10[0];
  v11 = v8;
  v12 = v7;
  sub_245DF00BC();
  sub_245E06A40();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_245DEF858@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  _OWORD v11[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF0078();
  sub_245E06AD0();
  if (!v2)
  {
    sub_245DF0100();
    sub_245E069F8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v11[1];
    *a2 = v11[0];
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_245DEF97C()
{
  return sub_245E063BC();
}

uint64_t sub_245DEF990()
{
  return sub_245E063C8();
}

uint64_t sub_245DEF9A4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_245DEF858(a1, a2);
}

uint64_t sub_245DEF9B8(_QWORD *a1)
{
  return sub_245DEF748(a1);
}

uint64_t sub_245DEF9CC()
{
  return 0;
}

uint64_t sub_245DEF9D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_245DEFA04()
{
  sub_245DF0144();
  return sub_245E06B00();
}

uint64_t sub_245DEFA2C()
{
  sub_245DF0144();
  return sub_245E06B0C();
}

unint64_t sub_245DEFA54()
{
  return 0xD000000000000017;
}

uint64_t sub_245DEFA70(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_245DEFA94(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EF90);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF0144();
  sub_245E06ADC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_245DEFB58()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  v1 = v0[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  return &unk_25751F0B8;
}

uint64_t sub_245DEFBB0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_245DEB5B0;
  return v9(a1, a3);
}

uint64_t sub_245DEFC20()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245DEB5B0;
  return sub_245E063EC();
}

uint64_t _s10SetupKitUI018SKUIStepAutoUnlockA13ConfigurationV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t result;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  char v26;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = (void *)a1[4];
  v8 = (void *)a1[5];
  v7 = (void *)a1[6];
  v9 = a2[1];
  v10 = a2[2];
  v11 = a2[3];
  v12 = (void *)a2[4];
  v14 = (void *)a2[5];
  v13 = (void *)a2[6];
  if (!v3)
  {
    if (v9)
      return 0;
    goto LABEL_8;
  }
  if (!v9)
    return 0;
  if (*a1 == *a2 && v3 == v9 || (v15 = sub_245E06A64(), result = 0, (v15 & 1) != 0))
  {
LABEL_8:
    if (v5)
    {
      if (!v11)
        return 0;
      if (v4 != v10 || v5 != v11)
      {
        v17 = sub_245E06A64();
        result = 0;
        if ((v17 & 1) == 0)
          return result;
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v6)
    {
      if (!v12)
        return 0;
      sub_245E0671C();
      v18 = v12;
      v19 = v6;
      v20 = sub_245E068FC();

      if ((v20 & 1) == 0)
        return 0;
    }
    else if (v12)
    {
      return 0;
    }
    if (v8)
    {
      if (!v14)
        return 0;
      sub_245E0671C();
      v21 = v14;
      v22 = v8;
      v23 = sub_245E068FC();

      if ((v23 & 1) == 0)
        return 0;
    }
    else if (v14)
    {
      return 0;
    }
    if (v7)
    {
      if (v13)
      {
        sub_245E0671C();
        v24 = v13;
        v25 = v7;
        v26 = sub_245E068FC();

        if ((v26 & 1) != 0)
          return 1;
      }
    }
    else if (!v13)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_245DEFE74()
{
  unint64_t result;

  result = qword_25751FF10;
  if (!qword_25751FF10)
  {
    result = MEMORY[0x24954969C](&unk_245E07F18, &type metadata for SKUIStepAutoUnlockSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25751FF10);
  }
  return result;
}

uint64_t _s10SetupKitUI018SKUIStepAutoUnlockA6ReportV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  if (!v3)
  {
    if (v6)
      return 0;
    goto LABEL_10;
  }
  if (!v6)
    return 0;
  v9 = *a1 == *a2 && v3 == v6;
  if (v9 || (v10 = sub_245E06A64(), result = 0, (v10 & 1) != 0))
  {
LABEL_10:
    if (v5)
    {
      if (v8 && (v4 == v7 && v5 == v8 || (sub_245E06A64() & 1) != 0))
        return 1;
    }
    else if (!v8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_245DEFF68()
{
  unint64_t result;

  result = qword_25751FF18;
  if (!qword_25751FF18)
  {
    result = MEMORY[0x24954969C](&unk_245E07EC8, &type metadata for SKUIStepAutoUnlockSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25751FF18);
  }
  return result;
}

unint64_t sub_245DEFFAC()
{
  unint64_t result;

  result = qword_25751FF20;
  if (!qword_25751FF20)
  {
    result = MEMORY[0x24954969C](&unk_245E07E78, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25751FF20);
  }
  return result;
}

unint64_t sub_245DEFFF0()
{
  unint64_t result;

  result = qword_25751EF58;
  if (!qword_25751EF58)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupConfiguration, &type metadata for SKUIStepAutoUnlockSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751EF58);
  }
  return result;
}

unint64_t sub_245DF0034()
{
  unint64_t result;

  result = qword_25751EF68;
  if (!qword_25751EF68)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupConfiguration, &type metadata for SKUIStepAutoUnlockSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751EF68);
  }
  return result;
}

unint64_t sub_245DF0078()
{
  unint64_t result;

  result = qword_25751FF28;
  if (!qword_25751FF28)
  {
    result = MEMORY[0x24954969C](&unk_245E07E28, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25751FF28);
  }
  return result;
}

unint64_t sub_245DF00BC()
{
  unint64_t result;

  result = qword_25751EF78;
  if (!qword_25751EF78)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupReport, &type metadata for SKUIStepAutoUnlockSetupReport);
    atomic_store(result, (unint64_t *)&qword_25751EF78);
  }
  return result;
}

unint64_t sub_245DF0100()
{
  unint64_t result;

  result = qword_25751EF88;
  if (!qword_25751EF88)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupReport, &type metadata for SKUIStepAutoUnlockSetupReport);
    atomic_store(result, (unint64_t *)&qword_25751EF88);
  }
  return result;
}

unint64_t sub_245DF0144()
{
  unint64_t result;

  result = qword_25751FF30[0];
  if (!qword_25751FF30[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07DD8, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_25751FF30);
  }
  return result;
}

unint64_t sub_245DF018C()
{
  unint64_t result;

  result = qword_25751EF98;
  if (!qword_25751EF98)
  {
    result = MEMORY[0x24954969C]("혏\v09", &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EF98);
  }
  return result;
}

unint64_t sub_245DF01D4()
{
  unint64_t result;

  result = qword_25751EFA0;
  if (!qword_25751EFA0)
  {
    result = MEMORY[0x24954969C](&unk_245E076C4, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFA0);
  }
  return result;
}

uint64_t sub_245DF0218()
{
  return sub_245DE38DC(&qword_25751EFA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D7C8], MEMORY[0x24BE6D7B8]);
}

unint64_t sub_245DF0248()
{
  unint64_t result;

  result = qword_25751EFB0;
  if (!qword_25751EFB0)
  {
    result = MEMORY[0x24954969C](&unk_245E07634, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFB0);
  }
  return result;
}

unint64_t sub_245DF0290()
{
  unint64_t result;

  result = qword_25751EFC0;
  if (!qword_25751EFC0)
  {
    result = MEMORY[0x24954969C](&unk_245E0777C, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFC0);
  }
  return result;
}

unint64_t sub_245DF02D8()
{
  unint64_t result;

  result = qword_25751EFC8;
  if (!qword_25751EFC8)
  {
    result = MEMORY[0x24954969C](&unk_245E077A4, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFC8);
  }
  return result;
}

unint64_t sub_245DF0320()
{
  unint64_t result;

  result = qword_25751EFD0;
  if (!qword_25751EFD0)
  {
    result = MEMORY[0x24954969C](&unk_245E07834, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFD0);
  }
  return result;
}

unint64_t sub_245DF0368()
{
  unint64_t result;

  result = qword_25751EFD8;
  if (!qword_25751EFD8)
  {
    result = MEMORY[0x24954969C](&unk_245E0785C, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFD8);
  }
  return result;
}

unint64_t sub_245DF03B0()
{
  unint64_t result;

  result = qword_25751EFE0;
  if (!qword_25751EFE0)
  {
    result = MEMORY[0x24954969C](&unk_245E07734, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFE0);
  }
  return result;
}

unint64_t sub_245DF03F8()
{
  unint64_t result;

  result = qword_25751EFE8;
  if (!qword_25751EFE8)
  {
    result = MEMORY[0x24954969C](&unk_245E077CC, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751EFE8);
  }
  return result;
}

uint64_t sub_245DF043C()
{
  return type metadata accessor for SKUIStepAutoUnlockSetupServer();
}

uint64_t sub_245DF0444()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245E0665C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SKUIStepAutoUnlockSetupServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUIStepAutoUnlockSetupServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for SKUIStepAutoUnlockSetupConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupConfiguration()
{
  return &type metadata for SKUIStepAutoUnlockSetupConfiguration;
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

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupReport()
{
  return &type metadata for SKUIStepAutoUnlockSetupReport;
}

void _s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwxx_0(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *_s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[4];
  v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  v7 = (void *)a2[6];
  a1[6] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v5;
  v9 = v6;
  v10 = v7;
  return a1;
}

_QWORD *_s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  v7 = (void *)a1[5];
  v8 = (void *)a2[5];
  a1[5] = v8;
  v9 = v8;

  v10 = (void *)a1[6];
  v11 = (void *)a2[6];
  a1[6] = v11;
  v12 = v11;

  return a1;
}

uint64_t _s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  return a1;
}

uint64_t _s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s10SetupKitUI36SKUIStepAutoUnlockSetupConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupStartRequestMessage()
{
  return &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage;
}

_QWORD *initializeBufferWithCopyOfBuffer for SKUIStepAutoUnlockSetupStartRequestHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SKUIStepAutoUnlockSetupStartRequestHandler()
{
  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SKUIStepAutoUnlockSetupStartRequestHandler(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupStartRequestHandler()
{
  return &type metadata for SKUIStepAutoUnlockSetupStartRequestHandler;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupFinishRequestMessage()
{
  return &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage;
}

uint64_t _s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s10SetupKitUI29SKUIStepAutoUnlockSetupReportVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage()
{
  return &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage;
}

_QWORD *assignWithCopy for SKUISetupGenericClientExternalCommandRequestHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericClientExternalCommandRequestHandler(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClientExternalCommandRequestHandler(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupFinishRequestHandler()
{
  return &type metadata for SKUIStepAutoUnlockSetupFinishRequestHandler;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupFinishRequestMessage.CodingKeys()
{
  return &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys()
{
  return &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys;
}

uint64_t _s10SetupKitUI43SKUIStepAutoUnlockSetupFinishRequestMessageV15ResponseMessageV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s10SetupKitUI43SKUIStepAutoUnlockSetupFinishRequestMessageV15ResponseMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245DF0C10 + 4 * byte_245E07485[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245DF0C30 + 4 * byte_245E0748A[v4]))();
}

_BYTE *sub_245DF0C10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245DF0C30(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DF0C38(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DF0C40(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DF0C48(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DF0C50(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys()
{
  return &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKUIStepAutoUnlockSetupReport.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SKUIStepAutoUnlockSetupReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DF0D54 + 4 * byte_245E07494[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245DF0D88 + 4 * byte_245E0748F[v4]))();
}

uint64_t sub_245DF0D88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DF0D90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DF0D98);
  return result;
}

uint64_t sub_245DF0DA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DF0DACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245DF0DB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DF0DB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DF0DC4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245DF0DCC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupReport.CodingKeys()
{
  return &type metadata for SKUIStepAutoUnlockSetupReport.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SKUIStepAutoUnlockSetupConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SKUIStepAutoUnlockSetupConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DF0EC4 + 4 * byte_245E0749E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_245DF0EF8 + 4 * byte_245E07499[v4]))();
}

uint64_t sub_245DF0EF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DF0F00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DF0F08);
  return result;
}

uint64_t sub_245DF0F14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DF0F1CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_245DF0F20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DF0F28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_245DF0F34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepAutoUnlockSetupConfiguration.CodingKeys()
{
  return &type metadata for SKUIStepAutoUnlockSetupConfiguration.CodingKeys;
}

unint64_t sub_245DF0F50()
{
  unint64_t result;

  result = qword_257520AD0[0];
  if (!qword_257520AD0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07B38, &type metadata for SKUIStepAutoUnlockSetupConfiguration.CodingKeys);
    atomic_store(result, qword_257520AD0);
  }
  return result;
}

unint64_t sub_245DF0F98()
{
  unint64_t result;

  result = qword_257520CE0[0];
  if (!qword_257520CE0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07BF0, &type metadata for SKUIStepAutoUnlockSetupReport.CodingKeys);
    atomic_store(result, qword_257520CE0);
  }
  return result;
}

unint64_t sub_245DF0FE0()
{
  unint64_t result;

  result = qword_257520EF0[0];
  if (!qword_257520EF0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07CA8, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_257520EF0);
  }
  return result;
}

unint64_t sub_245DF1028()
{
  unint64_t result;

  result = qword_257521100[0];
  if (!qword_257521100[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07D60, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_257521100);
  }
  return result;
}

unint64_t sub_245DF1070()
{
  unint64_t result;

  result = qword_257521310;
  if (!qword_257521310)
  {
    result = MEMORY[0x24954969C](&unk_245E07D88, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257521310);
  }
  return result;
}

unint64_t sub_245DF10B8()
{
  unint64_t result;

  result = qword_257521318[0];
  if (!qword_257521318[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07DB0, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_257521318);
  }
  return result;
}

unint64_t sub_245DF1100()
{
  unint64_t result;

  result = qword_2575213A0;
  if (!qword_2575213A0)
  {
    result = MEMORY[0x24954969C](&unk_245E07CD0, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575213A0);
  }
  return result;
}

unint64_t sub_245DF1148()
{
  unint64_t result;

  result = qword_2575213A8[0];
  if (!qword_2575213A8[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07CF8, &type metadata for SKUIStepAutoUnlockSetupFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_2575213A8);
  }
  return result;
}

unint64_t sub_245DF1190()
{
  unint64_t result;

  result = qword_257521430;
  if (!qword_257521430)
  {
    result = MEMORY[0x24954969C](&unk_245E07C18, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257521430);
  }
  return result;
}

unint64_t sub_245DF11D8()
{
  unint64_t result;

  result = qword_257521438[0];
  if (!qword_257521438[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07C40, &type metadata for SKUIStepAutoUnlockSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_257521438);
  }
  return result;
}

unint64_t sub_245DF1220()
{
  unint64_t result;

  result = qword_2575214C0;
  if (!qword_2575214C0)
  {
    result = MEMORY[0x24954969C](&unk_245E07B60, &type metadata for SKUIStepAutoUnlockSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575214C0);
  }
  return result;
}

unint64_t sub_245DF1268()
{
  unint64_t result;

  result = qword_2575214C8[0];
  if (!qword_2575214C8[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07B88, &type metadata for SKUIStepAutoUnlockSetupReport.CodingKeys);
    atomic_store(result, qword_2575214C8);
  }
  return result;
}

unint64_t sub_245DF12B0()
{
  unint64_t result;

  result = qword_257521550;
  if (!qword_257521550)
  {
    result = MEMORY[0x24954969C](&unk_245E07AA8, &type metadata for SKUIStepAutoUnlockSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257521550);
  }
  return result;
}

unint64_t sub_245DF12F8()
{
  unint64_t result;

  result = qword_257521558[0];
  if (!qword_257521558[0])
  {
    result = MEMORY[0x24954969C](&unk_245E07AD0, &type metadata for SKUIStepAutoUnlockSetupConfiguration.CodingKeys);
    atomic_store(result, qword_257521558);
  }
  return result;
}

uint64_t sub_245DF133C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x8000000245E0A2D0 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000022 && a2 == 0x8000000245E0A2F0 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000245E0A320 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000245E0A340 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000245E0A360)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_245E06A64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_245DF152C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001ELL && a2 == 0x8000000245E0A380 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000245E0A3A0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_245E06A64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_245DF1618(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x72756769666E6F63 && a2 == 0xED00006E6F697461)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_245E06A64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245DF16B4()
{
  return 0x72756769666E6F63;
}

uint64_t sub_245DF16D8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74726F706572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_245E06A64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245DF1754()
{
  return 0x74726F706572;
}

uint64_t sub_245DF1768()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DF178C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_245DE9848;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25751F0B0 + dword_25751F0B0))(a1, a2, a3, v8);
}

id sub_245DF1814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v8;
  id v9;
  id result;

  if (a2 != 1)
  {
    v8 = a7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = a5;
    return a6;
  }
  return result;
}

uint64_t sub_245DF1888()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_2575215E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2575215E8);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUIStepHomeKitSetupServer.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepHomeKitSetupServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started) = 0;
  v4 = v3 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKUIStepHomeKitSetupServer.init(server:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started) = 0;
  v4 = v2 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKUIStepHomeKitSetupServer.start()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[12] = v0;
  v2 = sub_245E0662C();
  v1[13] = v2;
  v1[14] = *(_QWORD *)(v2 - 8);
  v1[15] = swift_task_alloc();
  sub_245DE38DC(&qword_25751F0E8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupServer);
  v1[16] = sub_245E0680C();
  v1[17] = v3;
  return swift_task_switch();
}

uint64_t sub_245DF1B2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t Strong;

  v1 = v0[12];
  v2 = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started;
  v0[18] = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started;
  if ((*(_BYTE *)(v1 + v2) & 1) != 0)
  {
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[19] = Strong;
    if (Strong)
    {
      sub_245E067B8();
      sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
      sub_245E0680C();
      return swift_task_switch();
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[14] + 104))(v0[15], *MEMORY[0x24BE85A48], v0[13]);
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t sub_245DF1C70()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 160) = sub_245E0677C();
  return swift_task_switch();
}

uint64_t sub_245DF1CAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = swift_allocObject();
  swift_weakInit();
  v0[5] = &type metadata for SKUIStepHomeKitSetupStartRequestHandler;
  v0[6] = sub_245DF2DB4();
  v0[2] = &unk_25751F0F8;
  v0[3] = v1;
  sub_245E0653C();
  sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
  v0[21] = sub_245E0680C();
  v0[22] = v2;
  return swift_task_switch();
}

uint64_t sub_245DF1D70()
{
  uint64_t v0;

  sub_245E064DC();
  *(_QWORD *)(v0 + 184) = 0;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_245DF1DDC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = swift_allocObject();
  swift_weakInit();
  v0[10] = &type metadata for SKUIStepHomeKitSetupFinishRequestHandler;
  v0[11] = sub_245DF3130();
  v0[7] = &unk_25751F110;
  v0[8] = v1;
  return swift_task_switch();
}

uint64_t type metadata accessor for SKUIStepHomeKitSetupServer()
{
  uint64_t result;

  result = qword_257521E30;
  if (!qword_257521E30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245DF1E90()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245DF1EB4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 + 56) = a1;
  *(_QWORD *)(v4 + 64) = a4;
  v6 = sub_245E0662C();
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v8 = *a2;
  *(_QWORD *)(v4 + 88) = v7;
  *(_QWORD *)(v4 + 96) = v8;
  *(_BYTE *)(v4 + 49) = *((_BYTE *)a2 + 8);
  return swift_task_switch();
}

uint64_t sub_245DF1F24()
{
  uint64_t v0;
  uint64_t Strong;
  char v2;
  _QWORD *v3;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 104) = Strong;
  if (Strong)
  {
    v2 = *(_BYTE *)(v0 + 49);
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 96);
    *(_BYTE *)(v0 + 48) = v2;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_245DF203C;
    return sub_245DF218C((uint64_t *)(v0 + 40));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 104))(*(_QWORD *)(v0 + 88), *MEMORY[0x24BE85A50], *(_QWORD *)(v0 + 72));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DF203C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF20A0()
{
  uint64_t v0;

  sub_245E063F8();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF20EC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF2128(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_245DEB5B0;
  return sub_245DF1EB4(a1, a2, v7, v2);
}

uint64_t sub_245DF218C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v2 + 64) = v1;
  v4 = sub_245E0662C();
  *(_QWORD *)(v2 + 72) = v4;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v5 = sub_245E06308();
  *(_QWORD *)(v2 + 96) = v5;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v7 = *a1;
  *(_QWORD *)(v2 + 112) = v6;
  *(_QWORD *)(v2 + 120) = v7;
  *(_BYTE *)(v2 + 208) = *((_BYTE *)a1 + 8);
  sub_245DE38DC(&qword_25751F0E8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupServer);
  *(_QWORD *)(v2 + 128) = sub_245E0680C();
  *(_QWORD *)(v2 + 136) = v8;
  return swift_task_switch();
}

uint64_t sub_245DF2260()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  char v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v34;
  uint64_t v35;
  char v36;

  if (qword_2575215E0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  *(_QWORD *)(v0 + 144) = __swift_project_value_buffer(v1, (uint64_t)qword_2575215E8);
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_BYTE *)(v0 + 208);
    v5 = *(_QWORD *)(v0 + 120);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v34 = v7;
    v35 = v5;
    *(_DWORD *)v6 = 136315138;
    v36 = v4;
    v8 = SKUIStepHomeKitSetupConfiguration.description.getter();
    *(_QWORD *)(v0 + 56) = sub_245DE3004(v8, v9, &v34);
    sub_245E06914();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245DDF000, v2, v3, "HomeKitSetup start: configuration=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
  }

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 152) = Strong;
  if (Strong)
  {
    if ((*(_BYTE *)(v0 + 208) & 1) != 0)
    {
      v11 = *(_QWORD *)(v0 + 64);
      v12 = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler;
      *(_QWORD *)(v0 + 176) = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler;
      v13 = *(void **)(v11 + v12);
      if (v13)
      {
        v14 = v13;
        v15 = sub_245E06314();
        v16 = sub_245E068E4();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_245DDF000, v15, v16, "HomeKitSetup cancel previous handler to start new", v17, 2u);
          MEMORY[0x24954972C](v17, -1, -1);
        }

        objc_msgSend(v14, sel_cancel);
        v18 = *(void **)(v11 + v12);
        *(_QWORD *)(v11 + v12) = 0;

      }
      sub_245E067B8();
      sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
      sub_245E0680C();
      return swift_task_switch();
    }
    else
    {
      sub_245E06650();
      v29 = sub_245E06AE8();
      v31 = v30;
      v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_25751F270 + dword_25751F270);
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 160) = v32;
      *v32 = v0;
      v32[1] = sub_245DF27B8;
      return v33(v29, v31, 0, 0, 1);
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 104))(*(_QWORD *)(v0 + 88), *MEMORY[0x24BE85A48], *(_QWORD *)(v0 + 72));
    sub_245E0671C();
    v20 = (void *)sub_245E06728();
    swift_willThrow();
    v21 = v20;
    v22 = v20;
    v23 = sub_245E06314();
    v24 = sub_245E068D8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v35 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_getErrorValue();
      v27 = sub_245E06A94();
      *(_QWORD *)(v0 + 48) = sub_245DE3004(v27, v28, &v35);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v23, v24, "### HomeKitSetup start failed: error=%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v26, -1, -1);
      MEMORY[0x24954972C](v25, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DF27B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[13] + 8))(v2[14], v2[12]);
  return swift_task_switch();
}

uint64_t sub_245DF2828()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF2870()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_245E0677C();
  sub_245E0653C();
  sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DF28F0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 192) = sub_245E064E8();
  *(_QWORD *)(v0 + 200) = 0;
  return swift_task_switch();
}

uint64_t sub_245DF2948()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = *(void **)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = (void *)sub_245E06644();
  v5 = objc_msgSend(objc_allocWithZone((Class)SKUIHMDeviceSetupOperationHandler), sel_initWithDispatchQueue_messageSessionTemplate_, v4, v1);

  v6 = *(void **)(v3 + v2);
  *(_QWORD *)(v3 + v2) = v5;
  v7 = v5;

  objc_msgSend(v7, sel_start);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF2A28()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  swift_release();
  v1 = *(void **)(v0 + 168);
  v2 = v1;
  v3 = v1;
  v4 = sub_245E06314();
  v5 = sub_245E068D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_245E06A94();
    *(_QWORD *)(v0 + 48) = sub_245DE3004(v8, v9, &v11);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v4, v5, "### HomeKitSetup start failed: error=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF2BE8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  swift_release();
  swift_release();
  v1 = *(void **)(v0 + 200);
  v2 = v1;
  v3 = v1;
  v4 = sub_245E06314();
  v5 = sub_245E068D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_245E06A94();
    *(_QWORD *)(v0 + 48) = sub_245DE3004(v8, v9, &v11);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v4, v5, "### HomeKitSetup start failed: error=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_245DF2DB4()
{
  unint64_t result;

  result = qword_25751F100;
  if (!qword_25751F100)
  {
    result = MEMORY[0x24954969C](&unk_245E08174, &type metadata for SKUIStepHomeKitSetupStartRequestHandler);
    atomic_store(result, &qword_25751F100);
  }
  return result;
}

uint64_t sub_245DF2DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a1;
  v3[6] = a3;
  v4 = sub_245E0662C();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DF2E58()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 80) = Strong;
  if (Strong)
  {
    type metadata accessor for SKUIStepHomeKitSetupServer();
    sub_245DE38DC(&qword_25751F0E8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupServer);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 104))(*(_QWORD *)(v0 + 72), *MEMORY[0x24BE85A50], *(_QWORD *)(v0 + 56));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DF2F80()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (qword_2575215E0 != -1)
    swift_once();
  v1 = sub_245E0632C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2575215E8);
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245DDF000, v2, v3, "HomeKitSetup finish", v4, 2u);
    MEMORY[0x24954972C](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 80);

  v6 = OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler;
  v7 = *(void **)(v5 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__homeKitOperationHandler);
  if (v7)
  {
    objc_msgSend(v7, sel_cancel);
    v8 = *(void **)(v5 + v6);
    *(_QWORD *)(v5 + v6) = 0;

  }
  return swift_task_switch();
}

uint64_t sub_245DF3094()
{
  uint64_t v0;

  sub_245E063F8();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF30DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245DEB5B0;
  return sub_245DF2DF8(a1, v5, v1);
}

unint64_t sub_245DF3130()
{
  unint64_t result;

  result = qword_25751F118;
  if (!qword_25751F118)
  {
    result = MEMORY[0x24954969C](&unk_245E08274, &type metadata for SKUIStepHomeKitSetupFinishRequestHandler);
    atomic_store(result, (unint64_t *)&qword_25751F118);
  }
  return result;
}

uint64_t SKUIStepHomeKitSetupServer.cancel()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  sub_245DE38DC(&qword_25751F0E8, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupServer);
  v1[3] = sub_245E0680C();
  v1[4] = v2;
  return swift_task_switch();
}

uint64_t sub_245DF31E0()
{
  uint64_t v0;
  uint64_t Strong;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = 1;
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 40) = Strong;
  if (Strong)
  {
    sub_245E067B8();
    sub_245DE38DC(&qword_25751EB58, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C80], MEMORY[0x24BE85C90]);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DF329C()
{
  _QWORD *v0;
  uint64_t v1;

  v0[6] = sub_245E0677C();
  swift_release();
  sub_245E0653C();
  sub_245DE38DC(&qword_25751EA40, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
  v0[7] = sub_245E0680C();
  v0[8] = v1;
  return swift_task_switch();
}

uint64_t sub_245DF3330()
{
  sub_245E064F4();
  return swift_task_switch();
}

uint64_t sub_245DF3380()
{
  sub_245E064F4();
  return swift_task_switch();
}

uint64_t sub_245DF33D0()
{
  uint64_t v0;

  swift_release();
  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer__started) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF3410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_245E062FC();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_245DF34B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_245E06308();
  sub_245DE38DC(&qword_25751F278, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D60], MEMORY[0x24BE29D88]);
  sub_245E06A7C();
  sub_245DE38DC(&qword_25751F280, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D38], MEMORY[0x24BE29D58]);
  sub_245E06974();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_245DF35CC;
  return sub_245E06A88();
}

uint64_t sub_245DF35CC()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_245DF3678()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKUIStepHomeKitSetupServer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_weakDestroy();
  return v0;
}

uint64_t SKUIStepHomeKitSetupServer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_245DF3788()
{
  sub_245DE38DC(&qword_25751F260, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepHomeKitSetupServer, (uint64_t)&protocol conformance descriptor for SKUIStepHomeKitSetupServer);
  return sub_245E06638();
}

uint64_t sub_245DF37D8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI26SKUIStepHomeKitSetupServer_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepHomeKitSetupConfiguration.mockSetupTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKUIStepHomeKitSetupConfiguration.mockSetupTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKUIStepHomeKitSetupConfiguration.mockSetupTime.modify())()
{
  return nullsub_1;
}

SetupKitUI::SKUIStepHomeKitSetupConfiguration __swiftcall SKUIStepHomeKitSetupConfiguration.init()()
{
  uint64_t v0;
  SetupKitUI::SKUIStepHomeKitSetupConfiguration result;

  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 1;
  return result;
}

uint64_t SKUIStepHomeKitSetupConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  uint64_t v11;
  unint64_t v12;

  v1 = sub_245E062C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_BYTE *)(v0 + 8);
  v6 = 0xE000000000000000;
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_245E062B4();
  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    sub_245E06938();
    sub_245E067F4();
    sub_245E068C0();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    v7 = v11;
    v6 = v12;
  }
  v8 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v8 = v7 & 0xFFFFFFFFFFFFLL;
  if (!v8)
  {
    swift_bridgeObjectRelease();
    v7 = 0x746C7561666564;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v7;
}

uint64_t static SKUIStepHomeKitSetupConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  return 1;
}

uint64_t sub_245DF39E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_245DF4DE4(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_245DF3A14()
{
  sub_245DF3B54();
  return sub_245E06B00();
}

uint64_t sub_245DF3A3C()
{
  sub_245DF3B54();
  return sub_245E06B0C();
}

uint64_t SKUIStepHomeKitSetupConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F128);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF3B54();
  sub_245E06ADC();
  sub_245E06A28();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_245DF3B54()
{
  unint64_t result;

  result = qword_257521618;
  if (!qword_257521618)
  {
    result = MEMORY[0x24954969C](&unk_245E086D4, &type metadata for SKUIStepHomeKitSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257521618);
  }
  return result;
}

uint64_t SKUIStepHomeKitSetupConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F130);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF3B54();
  sub_245E06AD0();
  if (!v2)
  {
    v9 = sub_245E069E0();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_245DF3CBC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKUIStepHomeKitSetupConfiguration.init(from:)(a1, a2);
}

uint64_t sub_245DF3CD0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F128);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF3B54();
  sub_245E06ADC();
  sub_245E06A28();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_245DF3DC4(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (*(_BYTE *)(a2 + 8))
      return 1;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) == 0)
      return 1;
  }
  return 0;
}

id SKUIStepHomeKitSetupReport.accessory.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void SKUIStepHomeKitSetupReport.accessory.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*SKUIStepHomeKitSetupReport.accessory.modify())()
{
  return nullsub_1;
}

uint64_t SKUIStepHomeKitSetupReport.setupTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t SKUIStepHomeKitSetupReport.setupTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = result;
  *(_BYTE *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*SKUIStepHomeKitSetupReport.setupTime.modify())()
{
  return nullsub_1;
}

void SKUIStepHomeKitSetupReport.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
}

uint64_t SKUIStepHomeKitSetupReport.description.getter()
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
  void *v9;
  int v10;
  id v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v1 = sub_245E062A8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E062C0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)v0;
  v10 = *(unsigned __int8 *)(v0 + 16);
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_245E062B4();
  v13 = 0x726F737365636361;
  v14 = 0xEA00000000003D79;
  if (v9)
  {
    v11 = objc_msgSend(v9, sel_uniqueIdentifier, v13, v14);
    sub_245E0629C();

    sub_245E06290();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v13 = 0x6D69547075746573;
  v14 = 0xEA00000000003D65;
  if (!v10)
    sub_245E068B4();
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v15;
}

uint64_t sub_245DF40A4()
{
  sub_245DF45B0();
  return sub_245E06B00();
}

uint64_t sub_245DF40CC()
{
  sub_245DF45B0();
  return sub_245E06B0C();
}

uint64_t sub_245DF40F4(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F138);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *((_BYTE *)v1 + 8);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF45B0();
  sub_245E06ADC();
  v10 = v7;
  v11 = v8;
  sub_245DF45F4();
  sub_245E06A40();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_245DF41FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_245DF4210@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F148);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF45B0();
  sub_245E06AD0();
  if (!v2)
  {
    sub_245DF4638();
    sub_245E069F8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v12;
    *(_QWORD *)a2 = v11;
    *(_BYTE *)(a2 + 8) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_245DF4338()
{
  return 0xD000000000000013;
}

uint64_t sub_245DF4354@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_245DF4210(a1, a2);
}

uint64_t sub_245DF4368(_QWORD *a1)
{
  return sub_245DF40F4(a1);
}

uint64_t sub_245DF437C()
{
  sub_245DF467C();
  return sub_245E06B00();
}

uint64_t sub_245DF43A4()
{
  sub_245DF467C();
  return sub_245E06B0C();
}

unint64_t sub_245DF43CC()
{
  return 0xD000000000000014;
}

uint64_t sub_245DF43E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F158);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DF467C();
  sub_245E06ADC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_245DF44AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  v1 = v0[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  return &unk_25751F258;
}

BOOL _s10SetupKitUI012SKUIStepHomebA6ReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  char v4;
  void *v5;
  double v6;
  char v7;
  id v8;
  id v9;
  char v10;
  char v12;

  v2 = *(void **)a1;
  v3 = *(double *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = *(void **)a2;
  v6 = *(double *)(a2 + 8);
  v7 = *(_BYTE *)(a2 + 16);
  if (*(_QWORD *)a1)
  {
    if (!v5)
      return 0;
    sub_245DE36C4();
    v8 = v5;
    v9 = v2;
    v10 = sub_245E068FC();

    if ((v10 & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((v4 & 1) == 0)
  {
    if (v3 == v6)
      v12 = v7;
    else
      v12 = 1;
    return (v12 & 1) == 0;
  }
  return (v7 & 1) != 0;
}

unint64_t sub_245DF45B0()
{
  unint64_t result;

  result = qword_257521620;
  if (!qword_257521620)
  {
    result = MEMORY[0x24954969C](&unk_245E08684, &type metadata for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257521620);
  }
  return result;
}

unint64_t sub_245DF45F4()
{
  unint64_t result;

  result = qword_25751F140;
  if (!qword_25751F140)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepHomeKitSetupConfiguration, &type metadata for SKUIStepHomeKitSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751F140);
  }
  return result;
}

unint64_t sub_245DF4638()
{
  unint64_t result;

  result = qword_25751F150;
  if (!qword_25751F150)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepHomeKitSetupConfiguration, &type metadata for SKUIStepHomeKitSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751F150);
  }
  return result;
}

unint64_t sub_245DF467C()
{
  unint64_t result;

  result = qword_257521628[0];
  if (!qword_257521628[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08634, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_257521628);
  }
  return result;
}

unint64_t sub_245DF46C4()
{
  unint64_t result;

  result = qword_25751F160;
  if (!qword_25751F160)
  {
    result = MEMORY[0x24954969C](&unk_245E08124, &type metadata for SKUIStepHomeKitSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751F160);
  }
  return result;
}

unint64_t sub_245DF470C()
{
  unint64_t result;

  result = qword_25751F168;
  if (!qword_25751F168)
  {
    result = MEMORY[0x24954969C](&unk_245E0814C, &type metadata for SKUIStepHomeKitSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751F168);
  }
  return result;
}

unint64_t sub_245DF4758()
{
  unint64_t result;

  result = qword_25751F178;
  if (!qword_25751F178)
  {
    result = MEMORY[0x24954969C](&unk_245E08224, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751F178);
  }
  return result;
}

unint64_t sub_245DF47A0()
{
  unint64_t result;

  result = qword_25751F180;
  if (!qword_25751F180)
  {
    result = MEMORY[0x24954969C](&unk_245E0824C, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_25751F180);
  }
  return result;
}

uint64_t sub_245DF47E8()
{
  return type metadata accessor for SKUIStepHomeKitSetupServer();
}

uint64_t sub_245DF47F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245E0665C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SKUIStepHomeKitSetupServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUIStepHomeKitSetupServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKUIStepHomeKitSetupConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKUIStepHomeKitSetupConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupConfiguration()
{
  return &type metadata for SKUIStepHomeKitSetupConfiguration;
}

uint64_t initializeBufferWithCopyOfBuffer for SKUIStepHomeKitSetupReport(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  return a1;
}

void destroy for SKUIStepHomeKitSetupReport(id *a1)
{

}

uint64_t assignWithCopy for SKUIStepHomeKitSetupReport(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
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

uint64_t assignWithTake for SKUIStepHomeKitSetupReport(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUIStepHomeKitSetupReport(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SKUIStepHomeKitSetupReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupReport()
{
  return &type metadata for SKUIStepHomeKitSetupReport;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupStartRequestMessage()
{
  return &type metadata for SKUIStepHomeKitSetupStartRequestMessage;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupStartRequestHandler()
{
  return &type metadata for SKUIStepHomeKitSetupStartRequestHandler;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupFinishRequestMessage()
{
  return &type metadata for SKUIStepHomeKitSetupFinishRequestMessage;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupFinishRequestHandler()
{
  return &type metadata for SKUIStepHomeKitSetupFinishRequestHandler;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupFinishRequestMessage.CodingKeys()
{
  return &type metadata for SKUIStepHomeKitSetupFinishRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys()
{
  return &type metadata for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys;
}

uint64_t _s10SetupKitUI39SKUIStepHomeKitSetupStartRequestMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245DF4B48 + 4 * byte_245E07F70[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245DF4B68 + 4 * byte_245E07F75[v4]))();
}

_BYTE *sub_245DF4B48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245DF4B68(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DF4B70(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DF4B78(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DF4B80(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DF4B88(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKUIStepHomeKitSetupConfiguration.CodingKeys()
{
  return &type metadata for SKUIStepHomeKitSetupConfiguration.CodingKeys;
}

unint64_t sub_245DF4BA8()
{
  unint64_t result;

  result = qword_257521F40[0];
  if (!qword_257521F40[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08504, &type metadata for SKUIStepHomeKitSetupConfiguration.CodingKeys);
    atomic_store(result, qword_257521F40);
  }
  return result;
}

unint64_t sub_245DF4BF0()
{
  unint64_t result;

  result = qword_257522150[0];
  if (!qword_257522150[0])
  {
    result = MEMORY[0x24954969C](&unk_245E085BC, &type metadata for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_257522150);
  }
  return result;
}

unint64_t sub_245DF4C38()
{
  unint64_t result;

  result = qword_257522360;
  if (!qword_257522360)
  {
    result = MEMORY[0x24954969C](&unk_245E085E4, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522360);
  }
  return result;
}

unint64_t sub_245DF4C80()
{
  unint64_t result;

  result = qword_257522368[0];
  if (!qword_257522368[0])
  {
    result = MEMORY[0x24954969C](&unk_245E0860C, &type metadata for SKUIStepHomeKitSetupFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_257522368);
  }
  return result;
}

unint64_t sub_245DF4CC8()
{
  unint64_t result;

  result = qword_2575223F0;
  if (!qword_2575223F0)
  {
    result = MEMORY[0x24954969C](&unk_245E0852C, &type metadata for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575223F0);
  }
  return result;
}

unint64_t sub_245DF4D10()
{
  unint64_t result;

  result = qword_2575223F8[0];
  if (!qword_2575223F8[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08554, &type metadata for SKUIStepHomeKitSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_2575223F8);
  }
  return result;
}

unint64_t sub_245DF4D58()
{
  unint64_t result;

  result = qword_257522480;
  if (!qword_257522480)
  {
    result = MEMORY[0x24954969C](&unk_245E08474, &type metadata for SKUIStepHomeKitSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522480);
  }
  return result;
}

unint64_t sub_245DF4DA0()
{
  unint64_t result;

  result = qword_257522488[0];
  if (!qword_257522488[0])
  {
    result = MEMORY[0x24954969C](&unk_245E0849C, &type metadata for SKUIStepHomeKitSetupConfiguration.CodingKeys);
    atomic_store(result, qword_257522488);
  }
  return result;
}

uint64_t sub_245DF4DE4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x757465536B636F6DLL && a2 == 0xED0000656D695470)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_245E06A64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245DF4E80()
{
  return 0x757465536B636F6DLL;
}

uint64_t sub_245DF4EA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DF4EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_245DE9848;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25751F250 + dword_25751F250))(a1, a2, a3, v8);
}

uint64_t sub_245DF4F5C()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_257522518);
  __swift_project_value_buffer(v0, (uint64_t)qword_257522518);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUISetupGenericClient.client.getter()
{
  return swift_retain();
}

uint64_t SKUISetupGenericClient.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUISetupGenericClientConfiguration.init(activationConfiguration:appleAccountSetupConfiguration:autoUnlockSetupConfiguration:bluetoothDevice:clientConfiguration:wifiSetupConfiguration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v24 = a3[1];
  v25 = *a3;
  v23 = a3[2];
  v11 = *((_QWORD *)a3 + 6);
  v12 = sub_245E06710();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a7, 1, 1, v12);
  v13 = (int *)type metadata accessor for SKUISetupGenericClientConfiguration(0);
  v14 = a7 + v13[5];
  v15 = sub_245E065B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = a7 + v13[6];
  *(_OWORD *)v16 = xmmword_245E07460;
  *(_OWORD *)(v16 + 16) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_QWORD *)(v16 + 48) = 0;
  v17 = v13[7];
  *(_QWORD *)(a7 + v17) = 0;
  v18 = a7 + v13[9];
  v19 = sub_245E06548();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  sub_245DFE98C(a1, a7, &qword_25751F290);
  sub_245DFE98C(a2, v14, &qword_25751F298);
  sub_245DEDCD8(*(_QWORD *)v16, *(_QWORD *)(v16 + 8), *(_QWORD *)(v16 + 16), *(_QWORD *)(v16 + 24), *(void **)(v16 + 32), *(void **)(v16 + 40), *(void **)(v16 + 48));
  *(_OWORD *)v16 = v25;
  *(_OWORD *)(v16 + 16) = v24;
  *(_OWORD *)(v16 + 32) = v23;
  *(_QWORD *)(v16 + 48) = v11;

  *(_QWORD *)(a7 + v17) = a4;
  v20 = a7 + v13[8];
  v21 = sub_245E06668();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20, a5, v21);
  return sub_245DFE98C(a6, v18, &qword_25751F288);
}

uint64_t type metadata accessor for SKUISetupGenericClientConfiguration(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_257522EA0);
}

uint64_t SKUISetupGenericClient.__allocating_init(configuration:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SKUISetupGenericClient.init(configuration:environment:)(a1, a2);
  return v4;
}

uint64_t SKUISetupGenericClient.init(configuration:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = sub_245E0665C();
  v19 = *(_QWORD *)(v6 - 8);
  v7 = v19;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_245E06668();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__nexusServer) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__eventContinuations) = MEMORY[0x24BEE4B00];
  sub_245DE98EC(a1, v3 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__configuration, type metadata accessor for SKUISetupGenericClientConfiguration);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14(v3 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, a2, v6);
  sub_245E06770();
  v15 = type metadata accessor for SKUISetupGenericClientConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1 + *(int *)(v15 + 32), v10);
  v14((uint64_t)v9, a2, v6);
  v16 = sub_245E06740();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a2, v6);
  sub_245DE9930(a1, type metadata accessor for SKUISetupGenericClientConfiguration);
  *(_QWORD *)(v3 + 16) = v16;
  return v3;
}

uint64_t SKUISetupGenericClient.setup()(uint64_t a1)
{
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

  v2[26] = a1;
  v2[27] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
  v2[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
  v2[29] = swift_task_alloc();
  v3 = sub_245E065B4();
  v2[30] = v3;
  v2[31] = *(_QWORD *)(v3 - 8);
  v2[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  v2[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
  v2[34] = swift_task_alloc();
  v4 = sub_245E06710();
  v2[35] = v4;
  v2[36] = *(_QWORD *)(v4 - 8);
  v2[37] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
  v2[38] = swift_task_alloc();
  v5 = sub_245E0665C();
  v2[39] = v5;
  v2[40] = *(_QWORD *)(v5 - 8);
  v2[41] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
  v2[42] = swift_task_alloc();
  v6 = sub_245E06548();
  v2[43] = v6;
  v2[44] = *(_QWORD *)(v6 - 8);
  v2[45] = swift_task_alloc();
  v7 = sub_245E06338();
  v2[46] = v7;
  v2[47] = *(_QWORD *)(v7 - 8);
  v2[48] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB40);
  v2[49] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2C0);
  v2[50] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[51] = v9;
  v2[52] = *(_QWORD *)(v9 + 64);
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = type metadata accessor for SKUISetupGenericClientReport(0);
  v2[56] = swift_task_alloc();
  sub_245DE38DC(&qword_25751F2C8, type metadata accessor for SKUISetupGenericClient, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient);
  v2[57] = sub_245E0680C();
  v2[58] = v10;
  return swift_task_switch();
}

uint64_t sub_245DF565C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v25;

  if (qword_257522510 != -1)
    swift_once();
  v1 = sub_245E0632C();
  *(_QWORD *)(v0 + 472) = __swift_project_value_buffer(v1, (uint64_t)qword_257522518);
  swift_retain_n();
  v2 = sub_245E06314();
  v3 = sub_245E068E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v25 = v5;
    *(_DWORD *)v4 = 136315138;
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v6 = SKUISetupGenericClientConfiguration.description.getter();
    *(_QWORD *)(v0 + 200) = sub_245DE3004(v6, v7, &v25);
    sub_245E06914();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_245DDF000, v2, v3, "setup start: configuration%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v5, -1, -1);
    MEMORY[0x24954972C](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v9 = *(int **)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 448);
  v10 = *(_QWORD *)(v0 + 216);
  v11 = sub_245E066A4();
  *(_QWORD *)(v0 + 480) = v11;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  *(_QWORD *)(v0 + 488) = v12;
  v12(v8, 1, 1, v11);
  v13 = v9[5];
  *(_DWORD *)(v0 + 768) = v13;
  v14 = v8 + v13;
  v15 = sub_245E065E4();
  *(_QWORD *)(v0 + 496) = v15;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  *(_QWORD *)(v0 + 504) = v16;
  v16(v14, 1, 1, v15);
  v17 = v9[6];
  *(_DWORD *)(v0 + 772) = v17;
  v18 = v8 + v17;
  *(_OWORD *)v18 = xmmword_245E07460;
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  v19 = v9[7];
  *(_DWORD *)(v0 + 776) = v19;
  v20 = v8 + v19;
  v21 = sub_245E06578();
  *(_QWORD *)(v0 + 512) = v21;
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  *(_QWORD *)(v0 + 520) = v22;
  v22(v20, 1, 1, v21);
  *(_QWORD *)(v0 + 528) = *(_QWORD *)(v10 + 16);
  sub_245E06770();
  sub_245DE38DC(&qword_25751EA30, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C08], MEMORY[0x24BE85C18]);
  *(_QWORD *)(v0 + 536) = sub_245E0680C();
  *(_QWORD *)(v0 + 544) = v23;
  return swift_task_switch();
}

uint64_t sub_245DF5954()
{
  sub_245E06764();
  return swift_task_switch();
}

uint64_t sub_245DF5990()
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
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v22;

  v1 = v0[53];
  v2 = v0[54];
  v3 = v0[51];
  v4 = v0[52];
  v5 = v0[49];
  v6 = v0[50];
  v7 = v0[27];
  v8 = sub_245E06848();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v6);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v1, v6);
  *(_QWORD *)(v11 + ((v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  v0[69] = sub_245DF8BE4(v5, (uint64_t)&unk_25751F2D8, v11);
  v12 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__configuration;
  v0[70] = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__configuration;
  v13 = v7 + v12;
  v14 = type metadata accessor for SKUISetupGenericClientConfiguration(0);
  v0[71] = v14;
  v15 = *(void **)(v13 + *(int *)(v14 + 28));
  if (v15 && (v16 = objc_msgSend(v15, sel_identifier)) != 0)
  {
    v17 = v16;
    v18 = sub_245E067D0();
    v20 = v19;

    v0[72] = v18;
    v0[73] = v20;
    return swift_task_switch();
  }
  else
  {
    v22 = (_QWORD *)swift_task_alloc();
    v0[76] = v22;
    *v22 = v0;
    v22[1] = sub_245DF5CD4;
    return sub_245E06758();
  }
}

uint64_t sub_245DF5B58()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 592) = sub_245E06734();
  return swift_task_switch();
}

uint64_t sub_245DF5B94()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[73];
  v3 = v0[47];
  v2 = (_QWORD *)v0[48];
  *v2 = v0[72];
  v2[1] = v1;
  (*(void (**)(void))(v3 + 104))();
  v4 = (_QWORD *)swift_task_alloc();
  v0[75] = v4;
  *v4 = v0;
  v4[1] = sub_245DF5C14;
  return sub_245E06500();
}

uint64_t sub_245DF5C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 376);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 384);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 368);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_245DF5C80()
{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 608) = v1;
  *v1 = v0;
  v1[1] = sub_245DF5CD4;
  return sub_245E06758();
}

uint64_t sub_245DF5CD4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF5D20()
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 336);
  sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 36), v3, &qword_25751F288);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_245DEB574(*(_QWORD *)(v0 + 336), &qword_25751F288);
    v4 = *(_QWORD *)(v0 + 280);
    v5 = *(_QWORD *)(v0 + 288);
    v6 = *(_QWORD *)(v0 + 272);
    sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560), v6, &qword_25751F290);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
    {
      sub_245DEB574(*(_QWORD *)(v0 + 272), &qword_25751F290);
      v7 = *(_QWORD *)(v0 + 240);
      v8 = *(_QWORD *)(v0 + 248);
      v9 = *(_QWORD *)(v0 + 232);
      sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 20), v9, &qword_25751F298);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
      {
        sub_245DEB574(*(_QWORD *)(v0 + 232), &qword_25751F298);
        v10 = *(_QWORD *)(v0 + 216);
        v11 = (uint64_t *)(v10 + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 24));
        v12 = *v11;
        *(_QWORD *)(v0 + 688) = *v11;
        v13 = v11[1];
        *(_QWORD *)(v0 + 696) = v13;
        v14 = v11[2];
        *(_QWORD *)(v0 + 704) = v14;
        v15 = v11[3];
        *(_QWORD *)(v0 + 712) = v15;
        v16 = (void *)v11[4];
        *(_QWORD *)(v0 + 720) = v16;
        v17 = (void *)v11[5];
        *(_QWORD *)(v0 + 728) = v17;
        v18 = (void *)v11[6];
        *(_QWORD *)(v0 + 736) = v18;
        if (v13 == 1)
        {
          v19 = sub_245E06314();
          v20 = sub_245E068E4();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = (uint8_t *)swift_slowAlloc();
            v22 = swift_slowAlloc();
            v51 = v22;
            *(_DWORD *)v21 = 136315138;
            swift_beginAccess();
            v23 = SKUISetupGenericClientReport.description.getter();
            *(_QWORD *)(v0 + 176) = sub_245DE3004(v23, v24, &v51);
            sub_245E06914();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_245DDF000, v19, v20, "setup success: report=%s", v21, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24954972C](v22, -1, -1);
            MEMORY[0x24954972C](v21, -1, -1);
          }

          v25 = *(_QWORD *)(v0 + 448);
          v26 = *(_QWORD *)(v0 + 432);
          v28 = *(_QWORD *)(v0 + 400);
          v27 = *(_QWORD *)(v0 + 408);
          v29 = *(_QWORD *)(v0 + 208);
          swift_beginAccess();
          sub_245DE98EC(v25, v29, type metadata accessor for SKUISetupGenericClientReport);
          sub_245E0689C();
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
          sub_245DE9930(v25, type metadata accessor for SKUISetupGenericClientReport);
          sub_245DFBD20();
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
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
        else
        {
          v46 = *(_QWORD *)(v0 + 320);
          v48 = *(_QWORD *)(v0 + 328);
          v49 = *(_QWORD *)(v0 + 312);
          v50 = *(_QWORD *)(v0 + 528);
          type metadata accessor for SKUIStepAutoUnlockSetupClient();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v48, v10 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v49);
          swift_retain();
          sub_245DF1814(v12, v13, v14, v15, v16, v17, v18);
          *(_QWORD *)(v0 + 744) = SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)(v50, v48);
          *(_QWORD *)(v0 + 16) = v12;
          *(_QWORD *)(v0 + 24) = v13;
          *(_QWORD *)(v0 + 32) = v14;
          *(_QWORD *)(v0 + 40) = v15;
          *(_QWORD *)(v0 + 48) = v16;
          *(_QWORD *)(v0 + 56) = v17;
          *(_QWORD *)(v0 + 64) = v18;
          v47 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 752) = v47;
          *v47 = v0;
          v47[1] = sub_245DF7568;
          return SKUIStepAutoUnlockSetupClient.perform(configuration:)(v0 + 72, v0 + 16);
        }
      }
      else
      {
        v42 = *(_QWORD *)(v0 + 320);
        v41 = *(_QWORD *)(v0 + 328);
        v43 = *(_QWORD *)(v0 + 312);
        v44 = *(_QWORD *)(v0 + 216);
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
        sub_245E065D8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v44 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v43);
        swift_retain();
        *(_QWORD *)(v0 + 664) = sub_245E065C0();
        v45 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 672) = v45;
        *v45 = v0;
        v45[1] = sub_245DF70B8;
        return sub_245E065CC();
      }
    }
    else
    {
      v37 = *(_QWORD *)(v0 + 320);
      v36 = *(_QWORD *)(v0 + 328);
      v38 = *(_QWORD *)(v0 + 312);
      v39 = *(_QWORD *)(v0 + 216);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 288) + 32))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 280));
      sub_245E06698();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v39 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v38);
      swift_retain();
      *(_QWORD *)(v0 + 640) = sub_245E06680();
      v40 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 648) = v40;
      *v40 = v0;
      v40[1] = sub_245DF6B00;
      return sub_245E0668C();
    }
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 320);
    v31 = *(_QWORD *)(v0 + 328);
    v33 = *(_QWORD *)(v0 + 312);
    v34 = *(_QWORD *)(v0 + 216);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 352) + 32))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 344));
    sub_245E0656C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v34 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v33);
    swift_retain();
    *(_QWORD *)(v0 + 616) = sub_245E06554();
    v35 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 624) = v35;
    *v35 = v0;
    v35[1] = sub_245DF6438;
    return sub_245E06560();
  }
}

uint64_t sub_245DF6438()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 632) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF6498()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, uint64_t, uint64_t);
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 520);
  v2 = *(_QWORD *)(v0 + 512);
  v3 = *(int *)(v0 + 776);
  v4 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 304);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v1(v8, 0, 1, v2);
  sub_245DFE98C(v8, v4 + v3, &qword_25751F2B8);
  v9 = *(_QWORD *)(v0 + 280);
  v10 = *(_QWORD *)(v0 + 288);
  v11 = *(_QWORD *)(v0 + 272);
  sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560), v11, &qword_25751F290);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_245DEB574(*(_QWORD *)(v0 + 272), &qword_25751F290);
    v12 = *(_QWORD *)(v0 + 240);
    v13 = *(_QWORD *)(v0 + 248);
    v14 = *(_QWORD *)(v0 + 232);
    sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 20), v14, &qword_25751F298);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
    {
      sub_245DEB574(*(_QWORD *)(v0 + 232), &qword_25751F298);
      v15 = *(_QWORD *)(v0 + 216);
      v16 = (uint64_t *)(v15 + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 24));
      v17 = *v16;
      *(_QWORD *)(v0 + 688) = *v16;
      v18 = v16[1];
      *(_QWORD *)(v0 + 696) = v18;
      v19 = v16[2];
      *(_QWORD *)(v0 + 704) = v19;
      v20 = v16[3];
      *(_QWORD *)(v0 + 712) = v20;
      v21 = (void *)v16[4];
      *(_QWORD *)(v0 + 720) = v21;
      v22 = (void *)v16[5];
      *(_QWORD *)(v0 + 728) = v22;
      v23 = (void *)v16[6];
      *(_QWORD *)(v0 + 736) = v23;
      if (v18 == 1)
      {
        v24 = sub_245E06314();
        v25 = sub_245E068E4();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = (uint8_t *)swift_slowAlloc();
          v27 = swift_slowAlloc();
          v51 = v27;
          *(_DWORD *)v26 = 136315138;
          swift_beginAccess();
          v28 = SKUISetupGenericClientReport.description.getter();
          *(_QWORD *)(v0 + 176) = sub_245DE3004(v28, v29, &v51);
          sub_245E06914();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_245DDF000, v24, v25, "setup success: report=%s", v26, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24954972C](v27, -1, -1);
          MEMORY[0x24954972C](v26, -1, -1);
        }

        v30 = *(_QWORD *)(v0 + 448);
        v31 = *(_QWORD *)(v0 + 432);
        v33 = *(_QWORD *)(v0 + 400);
        v32 = *(_QWORD *)(v0 + 408);
        v34 = *(_QWORD *)(v0 + 208);
        swift_beginAccess();
        sub_245DE98EC(v30, v34, type metadata accessor for SKUISetupGenericClientReport);
        sub_245E0689C();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
        sub_245DE9930(v30, type metadata accessor for SKUISetupGenericClientReport);
        sub_245DFBD20();
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
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      else
      {
        v46 = *(_QWORD *)(v0 + 320);
        v48 = *(_QWORD *)(v0 + 328);
        v49 = *(_QWORD *)(v0 + 312);
        v50 = *(_QWORD *)(v0 + 528);
        type metadata accessor for SKUIStepAutoUnlockSetupClient();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v48, v15 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v49);
        swift_retain();
        sub_245DF1814(v17, v18, v19, v20, v21, v22, v23);
        *(_QWORD *)(v0 + 744) = SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)(v50, v48);
        *(_QWORD *)(v0 + 16) = v17;
        *(_QWORD *)(v0 + 24) = v18;
        *(_QWORD *)(v0 + 32) = v19;
        *(_QWORD *)(v0 + 40) = v20;
        *(_QWORD *)(v0 + 48) = v21;
        *(_QWORD *)(v0 + 56) = v22;
        *(_QWORD *)(v0 + 64) = v23;
        v47 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 752) = v47;
        *v47 = v0;
        v47[1] = sub_245DF7568;
        return SKUIStepAutoUnlockSetupClient.perform(configuration:)(v0 + 72, v0 + 16);
      }
    }
    else
    {
      v42 = *(_QWORD *)(v0 + 320);
      v41 = *(_QWORD *)(v0 + 328);
      v43 = *(_QWORD *)(v0 + 312);
      v44 = *(_QWORD *)(v0 + 216);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
      sub_245E065D8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v44 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v43);
      swift_retain();
      *(_QWORD *)(v0 + 664) = sub_245E065C0();
      v45 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 672) = v45;
      *v45 = v0;
      v45[1] = sub_245DF70B8;
      return sub_245E065CC();
    }
  }
  else
  {
    v37 = *(_QWORD *)(v0 + 320);
    v36 = *(_QWORD *)(v0 + 328);
    v38 = *(_QWORD *)(v0 + 312);
    v39 = *(_QWORD *)(v0 + 216);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 288) + 32))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 280));
    sub_245E06698();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v39 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v38);
    swift_retain();
    *(_QWORD *)(v0 + 640) = sub_245E06680();
    v40 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 648) = v40;
    *v40 = v0;
    v40[1] = sub_245DF6B00;
    return sub_245E0668C();
  }
}

uint64_t sub_245DF6B00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 656) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF6B60()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = *(_QWORD *)(v0 + 480);
  v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 488);
  v3 = *(_QWORD *)(v0 + 448);
  v5 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 264);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v2(v7, 0, 1, v1);
  sub_245DFE98C(v7, v3, &qword_25751F2B0);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 248);
  v10 = *(_QWORD *)(v0 + 232);
  sub_245DFFAD0(*(_QWORD *)(v0 + 216) + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 20), v10, &qword_25751F298);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8) == 1)
  {
    sub_245DEB574(*(_QWORD *)(v0 + 232), &qword_25751F298);
    v11 = *(_QWORD *)(v0 + 216);
    v12 = (uint64_t *)(v11 + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 24));
    v13 = *v12;
    *(_QWORD *)(v0 + 688) = *v12;
    v14 = v12[1];
    *(_QWORD *)(v0 + 696) = v14;
    v15 = v12[2];
    *(_QWORD *)(v0 + 704) = v15;
    v16 = v12[3];
    *(_QWORD *)(v0 + 712) = v16;
    v17 = (void *)v12[4];
    *(_QWORD *)(v0 + 720) = v17;
    v18 = (void *)v12[5];
    *(_QWORD *)(v0 + 728) = v18;
    v19 = (void *)v12[6];
    *(_QWORD *)(v0 + 736) = v19;
    if (v14 == 1)
    {
      v20 = sub_245E06314();
      v21 = sub_245E068E4();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v42 = v23;
        *(_DWORD *)v22 = 136315138;
        swift_beginAccess();
        v24 = SKUISetupGenericClientReport.description.getter();
        *(_QWORD *)(v0 + 176) = sub_245DE3004(v24, v25, &v42);
        sub_245E06914();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245DDF000, v20, v21, "setup success: report=%s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24954972C](v23, -1, -1);
        MEMORY[0x24954972C](v22, -1, -1);
      }

      v26 = *(_QWORD *)(v0 + 448);
      v27 = *(_QWORD *)(v0 + 432);
      v29 = *(_QWORD *)(v0 + 400);
      v28 = *(_QWORD *)(v0 + 408);
      v30 = *(_QWORD *)(v0 + 208);
      swift_beginAccess();
      sub_245DE98EC(v26, v30, type metadata accessor for SKUISetupGenericClientReport);
      sub_245E0689C();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
      sub_245DE9930(v26, type metadata accessor for SKUISetupGenericClientReport);
      sub_245DFBD20();
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
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v37 = *(_QWORD *)(v0 + 320);
      v39 = *(_QWORD *)(v0 + 328);
      v40 = *(_QWORD *)(v0 + 312);
      v41 = *(_QWORD *)(v0 + 528);
      type metadata accessor for SKUIStepAutoUnlockSetupClient();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v39, v11 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v40);
      swift_retain();
      sub_245DF1814(v13, v14, v15, v16, v17, v18, v19);
      *(_QWORD *)(v0 + 744) = SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)(v41, v39);
      *(_QWORD *)(v0 + 16) = v13;
      *(_QWORD *)(v0 + 24) = v14;
      *(_QWORD *)(v0 + 32) = v15;
      *(_QWORD *)(v0 + 40) = v16;
      *(_QWORD *)(v0 + 48) = v17;
      *(_QWORD *)(v0 + 56) = v18;
      *(_QWORD *)(v0 + 64) = v19;
      v38 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 752) = v38;
      *v38 = v0;
      v38[1] = sub_245DF7568;
      return SKUIStepAutoUnlockSetupClient.perform(configuration:)(v0 + 72, v0 + 16);
    }
  }
  else
  {
    v33 = *(_QWORD *)(v0 + 320);
    v32 = *(_QWORD *)(v0 + 328);
    v34 = *(_QWORD *)(v0 + 312);
    v35 = *(_QWORD *)(v0 + 216);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
    sub_245E065D8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v35 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v34);
    swift_retain();
    *(_QWORD *)(v0 + 664) = sub_245E065C0();
    v36 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 672) = v36;
    *v36 = v0;
    v36[1] = sub_245DF70B8;
    return sub_245E065CC();
  }
}

uint64_t sub_245DF70B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 680) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF7118()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 496);
  v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 504);
  v3 = *(int *)(v0 + 768);
  v4 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 240);
  v8 = *(_QWORD *)(v0 + 224);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v2(v8, 0, 1, v1);
  sub_245DFE98C(v8, v4 + v3, &qword_25751F2A8);
  v9 = *(_QWORD *)(v0 + 216);
  v10 = (uint64_t *)(v9 + *(_QWORD *)(v0 + 560) + *(int *)(*(_QWORD *)(v0 + 568) + 24));
  v11 = *v10;
  *(_QWORD *)(v0 + 688) = *v10;
  v12 = v10[1];
  *(_QWORD *)(v0 + 696) = v12;
  v13 = v10[2];
  *(_QWORD *)(v0 + 704) = v13;
  v14 = v10[3];
  *(_QWORD *)(v0 + 712) = v14;
  v15 = (void *)v10[4];
  *(_QWORD *)(v0 + 720) = v15;
  v16 = (void *)v10[5];
  *(_QWORD *)(v0 + 728) = v16;
  v17 = (void *)v10[6];
  *(_QWORD *)(v0 + 736) = v17;
  if (v12 == 1)
  {
    v18 = sub_245E06314();
    v19 = sub_245E068E4();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v35 = v21;
      *(_DWORD *)v20 = 136315138;
      swift_beginAccess();
      v22 = SKUISetupGenericClientReport.description.getter();
      *(_QWORD *)(v0 + 176) = sub_245DE3004(v22, v23, &v35);
      sub_245E06914();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245DDF000, v18, v19, "setup success: report=%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v21, -1, -1);
      MEMORY[0x24954972C](v20, -1, -1);
    }

    v24 = *(_QWORD *)(v0 + 448);
    v25 = *(_QWORD *)(v0 + 432);
    v27 = *(_QWORD *)(v0 + 400);
    v26 = *(_QWORD *)(v0 + 408);
    v28 = *(_QWORD *)(v0 + 208);
    swift_beginAccess();
    sub_245DE98EC(v24, v28, type metadata accessor for SKUISetupGenericClientReport);
    sub_245E0689C();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    sub_245DE9930(v24, type metadata accessor for SKUISetupGenericClientReport);
    sub_245DFBD20();
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
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v30 = *(_QWORD *)(v0 + 320);
    v32 = *(_QWORD *)(v0 + 328);
    v33 = *(_QWORD *)(v0 + 312);
    v34 = *(_QWORD *)(v0 + 528);
    type metadata accessor for SKUIStepAutoUnlockSetupClient();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v32, v9 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment, v33);
    swift_retain();
    sub_245DF1814(v11, v12, v13, v14, v15, v16, v17);
    *(_QWORD *)(v0 + 744) = SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)(v34, v32);
    *(_QWORD *)(v0 + 16) = v11;
    *(_QWORD *)(v0 + 24) = v12;
    *(_QWORD *)(v0 + 32) = v13;
    *(_QWORD *)(v0 + 40) = v14;
    *(_QWORD *)(v0 + 48) = v15;
    *(_QWORD *)(v0 + 56) = v16;
    *(_QWORD *)(v0 + 64) = v17;
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 752) = v31;
    *v31 = v0;
    v31[1] = sub_245DF7568;
    return SKUIStepAutoUnlockSetupClient.perform(configuration:)(v0 + 72, v0 + 16);
  }
}

uint64_t sub_245DF7568()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 760) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF75CC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 736);
  v2 = *(void **)(v0 + 728);
  v3 = *(void **)(v0 + 720);
  v4 = *(_QWORD *)(v0 + 712);
  v5 = *(_QWORD *)(v0 + 704);
  v6 = *(_QWORD *)(v0 + 696);
  v7 = *(_QWORD *)(v0 + 688);
  v8 = *(int *)(v0 + 772);
  v9 = *(_QWORD *)(v0 + 448);
  swift_release();
  v10 = (uint64_t *)(v9 + v8);
  sub_245DEDCD8(v7, v6, v5, v4, v3, v2, v1);
  v25 = *(_OWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 96);
  sub_245DFE958(*v10, v10[1]);
  *(_OWORD *)v10 = v25;
  v10[2] = v12;
  v10[3] = v11;
  v13 = sub_245E06314();
  v14 = sub_245E068E4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v26 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_beginAccess();
    v17 = SKUISetupGenericClientReport.description.getter();
    *(_QWORD *)(v0 + 176) = sub_245DE3004(v17, v18, &v26);
    sub_245E06914();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245DDF000, v13, v14, "setup success: report=%s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v16, -1, -1);
    MEMORY[0x24954972C](v15, -1, -1);
  }

  v19 = *(_QWORD *)(v0 + 448);
  v20 = *(_QWORD *)(v0 + 432);
  v22 = *(_QWORD *)(v0 + 400);
  v21 = *(_QWORD *)(v0 + 408);
  v23 = *(_QWORD *)(v0 + 208);
  swift_beginAccess();
  sub_245DE98EC(v19, v23, type metadata accessor for SKUISetupGenericClientReport);
  sub_245E0689C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  sub_245DE9930(v19, type metadata accessor for SKUISetupGenericClientReport);
  sub_245DFBD20();
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF78F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v2 = *(_QWORD *)(v0 + 352);
  v1 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 344);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(void **)(v0 + 632);
  v5 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 432);
  v8 = *(_QWORD *)(v0 + 400);
  v7 = *(_QWORD *)(v0 + 408);
  sub_245E0689C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_245DE9930(v5, type metadata accessor for SKUISetupGenericClientReport);
  v9 = v4;
  v10 = v4;
  v11 = sub_245E06314();
  v12 = sub_245E068D8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue();
    v15 = sub_245E06A94();
    *(_QWORD *)(v0 + 192) = sub_245DE3004(v15, v16, &v18);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v11, v12, "### setup failed: error=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  sub_245DFBD20();
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF7BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v2 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 280);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(void **)(v0 + 656);
  v5 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 432);
  v8 = *(_QWORD *)(v0 + 400);
  v7 = *(_QWORD *)(v0 + 408);
  sub_245E0689C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_245DE9930(v5, type metadata accessor for SKUISetupGenericClientReport);
  v9 = v4;
  v10 = v4;
  v11 = sub_245E06314();
  v12 = sub_245E068D8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue();
    v15 = sub_245E06A94();
    *(_QWORD *)(v0 + 192) = sub_245DE3004(v15, v16, &v18);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v11, v12, "### setup failed: error=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  sub_245DFBD20();
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF7ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v2 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 240);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(void **)(v0 + 680);
  v5 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 432);
  v8 = *(_QWORD *)(v0 + 400);
  v7 = *(_QWORD *)(v0 + 408);
  sub_245E0689C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_245DE9930(v5, type metadata accessor for SKUISetupGenericClientReport);
  v9 = v4;
  v10 = v4;
  v11 = sub_245E06314();
  v12 = sub_245E068D8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue();
    v15 = sub_245E06A94();
    *(_QWORD *)(v0 + 192) = sub_245DE3004(v15, v16, &v18);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v11, v12, "### setup failed: error=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  sub_245DFBD20();
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF81C0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;

  v1 = *(void **)(v0 + 736);
  v2 = *(void **)(v0 + 728);
  v3 = *(void **)(v0 + 720);
  v4 = *(_QWORD *)(v0 + 712);
  v5 = *(_QWORD *)(v0 + 704);
  v6 = *(_QWORD *)(v0 + 696);
  v7 = *(_QWORD *)(v0 + 688);
  swift_release();
  sub_245DEDCD8(v7, v6, v5, v4, v3, v2, v1);
  v8 = *(void **)(v0 + 760);
  v9 = *(_QWORD *)(v0 + 448);
  v10 = *(_QWORD *)(v0 + 432);
  v12 = *(_QWORD *)(v0 + 400);
  v11 = *(_QWORD *)(v0 + 408);
  sub_245E0689C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  sub_245DE9930(v9, type metadata accessor for SKUISetupGenericClientReport);
  v13 = v8;
  v14 = v8;
  v15 = sub_245E06314();
  v16 = sub_245E068D8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v22 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_getErrorValue();
    v19 = sub_245E06A94();
    *(_QWORD *)(v0 + 192) = sub_245DE3004(v19, v20, &v22);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v15, v16, "### setup failed: error=%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v18, -1, -1);
    MEMORY[0x24954972C](v17, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  sub_245DFBD20();
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKUISetupGenericClientReport.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_245E066A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
  v3 = (int *)type metadata accessor for SKUISetupGenericClientReport(0);
  v4 = a1 + v3[5];
  v5 = sub_245E065E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a1 + v3[6];
  *(_OWORD *)v6 = xmmword_245E07460;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  v7 = a1 + v3[7];
  v8 = sub_245E06578();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
}

uint64_t sub_245DF8594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[5] = a4;
  v5[6] = a5;
  v6 = sub_245E06518();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v7 = sub_245E0674C();
  v5[10] = v7;
  v5[11] = *(_QWORD *)(v7 - 8);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F8B0);
  v5[15] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F8B8);
  v5[16] = v8;
  v5[17] = *(_QWORD *)(v8 - 8);
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DF8688()
{
  uint64_t v0;
  int v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2C0);
  sub_245E06884();
  swift_beginAccess();
  v1 = *MEMORY[0x24BE85BD0];
  *(_DWORD *)(v0 + 176) = *MEMORY[0x24BE85BC8];
  *(_DWORD *)(v0 + 180) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v2;
  *v2 = v0;
  v2[1] = sub_245DF8740;
  return sub_245E06890();
}

uint64_t sub_245DF8740()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DF8794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
    goto LABEL_6;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 112), v1, v2);
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 160) = Strong;
  if (!Strong)
  {
LABEL_5:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 80));
LABEL_6:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if ((sub_245E068A8() & 1) != 0)
  {
    swift_release();
    goto LABEL_5;
  }
  type metadata accessor for SKUISetupGenericClient(0);
  sub_245DE38DC(&qword_25751F2C8, type metadata accessor for SKUISetupGenericClient, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DF88F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  if (qword_257522510 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = sub_245E0632C();
  __swift_project_value_buffer(v5, (uint64_t)qword_257522518);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v1, v2, v3);
  v7 = sub_245E06314();
  v8 = sub_245E068E4();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  v12 = *(_QWORD *)(v0 + 88);
  if (v9)
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_245DE38DC(&qword_25751F8C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE85BD8], MEMORY[0x24BE85BE8]);
    v15 = sub_245E06A4C();
    *(_QWORD *)(v13 + 4) = sub_245DE3004(v15, v16, &v28);
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v11);
    _os_log_impl(&dword_245DDF000, v7, v8, "client event: %s", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v14, -1, -1);
    MEMORY[0x24954972C](v13, -1, -1);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  }

  *(_QWORD *)(v0 + 168) = v17;
  v18 = *(_DWORD *)(v0 + 176);
  v20 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 96);
  v21 = *(_QWORD *)(v0 + 80);
  v6(v19, *(_QWORD *)(v0 + 112), v21);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 88))(v19, v21);
  if (v22 == v18)
  {
    v23 = *(_QWORD *)(v0 + 96);
    v24 = *(char **)(v0 + 72);
    v25 = *(_QWORD *)(v0 + 56);
    v26 = *(_QWORD *)(v0 + 64);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v23, *(_QWORD *)(v0 + 80));
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v24, v23, v25);
    sub_245DF8D30(v24);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
  }
  else if (v22 != *(_DWORD *)(v0 + 180))
  {
    v17(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  }
  return swift_task_switch();
}

uint64_t sub_245DF8B64()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void (*)(uint64_t, uint64_t))v0[21];
  v2 = v0[14];
  v3 = v0[10];
  swift_release();
  v1(v2, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[19] = v4;
  *v4 = v0;
  v4[1] = sub_245DF8740;
  return sub_245E06890();
}

uint64_t sub_245DF8BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E06848();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245E0683C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245DEB574(a1, &qword_25751EB40);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245E0680C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_245DF8D30(char *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;

  v41 = a1;
  v37 = sub_245E06470();
  v40 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v36 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for SKUISetupGenericClient.Event(0);
  MEMORY[0x24BDAC7A8](v38);
  v39 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_245E06458();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245E06344();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v33 - v12;
  v14 = sub_245E06518();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (id *)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, char *, uint64_t))(v15 + 16))(v17, v41, v14);
  v18 = (*(uint64_t (**)(id *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == *MEMORY[0x24BE6DC00])
  {
    (*(void (**)(id *, uint64_t))(v15 + 96))(v17, v14);

    return;
  }
  v34 = v6;
  v35 = v4;
  v41 = v11;
  v19 = v3;
  v20 = (uint64_t)v39;
  v21 = v40;
  if (v18 == *MEMORY[0x24BE6DBE8] || v18 == *MEMORY[0x24BE6DBF0])
  {
    (*(void (**)(id *, uint64_t))(v15 + 96))(v17, v14);
    swift_release();
    return;
  }
  if (v18 == *MEMORY[0x24BE6DBD8])
  {
    (*(void (**)(id *, uint64_t))(v15 + 96))(v17, v14);
    swift_release();
    v22 = (char *)v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751EEC8) + 48);
    v23 = v8;
    v24 = v13;
    v25 = v13;
    v26 = v7;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v25, v22, v7);
    v27 = v41;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v41, v24, v26);
    v28 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v27, v26);
    if (v28 != *MEMORY[0x24BE6D488])
    {
      if (v28 == *MEMORY[0x24BE6D490])
      {
        (*(void (**)(char *, uint64_t))(v8 + 96))(v27, v26);
        v30 = v34;
        v29 = v35;
        (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v34, v27, v19);
        (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v20, v30, v19);
        swift_storeEnumTagMultiPayload();
        SKUISetupGenericClient._report(event:)(v20);
        sub_245DE9930(v20, type metadata accessor for SKUISetupGenericClient.Event);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v19);
        goto LABEL_16;
      }
      if (v28 == *MEMORY[0x24BE6D498])
      {
        (*(void (**)(char *, uint64_t))(v8 + 96))(v27, v26);
        v32 = v36;
        v31 = v37;
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v36, v27, v37);
        (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v20, v32, v31);
        swift_storeEnumTagMultiPayload();
        SKUISetupGenericClient._report(event:)(v20);
        sub_245DE9930(v20, type metadata accessor for SKUISetupGenericClient.Event);
        (*(void (**)(char *, uint64_t))(v21 + 8))(v32, v31);
        goto LABEL_16;
      }
      if (v28 != *MEMORY[0x24BE6D480] && v28 != *MEMORY[0x24BE6D4A0] && v28 == *MEMORY[0x24BE6D4A8])
        goto LABEL_16;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v26);
LABEL_16:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v26);
    return;
  }
  if (v18 != *MEMORY[0x24BE6DBE0])
    (*(void (**)(id *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t SKUISetupGenericClient._report(event:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t *v24;
  __int128 v25;
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int64_t v65;
  unint64_t v66;
  char *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;

  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E0);
  v63 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SKUISetupGenericClient.Event(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v53 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v69 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (int64_t *)((char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v64 = (char *)&v53 - v16;
  v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__eventContinuations);
  swift_beginAccess();
  v18 = *v17;
  v19 = *(_QWORD *)(*v17 + 64);
  v54 = *v17 + 64;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v55 = (unint64_t)(v20 + 63) >> 6;
  v53 = v55 - 1;
  v59 = v18;
  result = swift_bridgeObjectRetain();
  v65 = 0;
  v24 = &qword_25751F2F8;
  *(_QWORD *)&v25 = 134218242;
  v57 = v25;
  v56 = MEMORY[0x24BEE4AD8] + 8;
  v68 = v15;
  v58 = a1;
  v62 = v10;
  while (1)
  {
    if (v22)
    {
      v28 = __clz(__rbit64(v22));
      v29 = (v22 - 1) & v22;
      v30 = v28 | (v65 << 6);
LABEL_8:
      v31 = *(_QWORD *)(v59 + 56);
      *v15 = *(_QWORD *)(*(_QWORD *)(v59 + 48) + 8 * v30);
      v32 = v69;
      v33 = v31 + *(_QWORD *)(v69 + 72) * v30;
      v34 = __swift_instantiateConcreteTypeFromMangledName(v24);
      v35 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
      v15 = v68;
      v35((char *)v68 + *(int *)(v34 + 48), v33, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v15, 0, 1, v34);
      v36 = v64;
      goto LABEL_27;
    }
    v37 = v65 + 1;
    if (__OFADD__(v65, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    v36 = v64;
    if (v37 < v55)
    {
      v38 = *(_QWORD *)(v54 + 8 * v37);
      if (v38)
        goto LABEL_12;
      v39 = v65 + 2;
      ++v65;
      if (v37 + 1 < v55)
      {
        v38 = *(_QWORD *)(v54 + 8 * v39);
        if (v38)
          goto LABEL_15;
        v65 = v37 + 1;
        if (v37 + 2 < v55)
        {
          v38 = *(_QWORD *)(v54 + 8 * (v37 + 2));
          if (v38)
          {
            v37 += 2;
            goto LABEL_12;
          }
          v39 = v37 + 3;
          v65 = v37 + 2;
          if (v37 + 3 < v55)
            break;
        }
      }
    }
LABEL_26:
    v40 = __swift_instantiateConcreteTypeFromMangledName(v24);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v15, 1, 1, v40);
    v29 = 0;
LABEL_27:
    sub_245DFE9E4((uint64_t)v15, (uint64_t)v36);
    v41 = v24;
    v42 = __swift_instantiateConcreteTypeFromMangledName(v24);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 48))(v36, 1, v42) == 1)
      return swift_release();
    v66 = v29;
    v43 = *(_QWORD *)v36;
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v67, &v36[*(int *)(v42 + 48)], v10);
    if (qword_257522510 != -1)
      swift_once();
    v44 = sub_245E0632C();
    __swift_project_value_buffer(v44, (uint64_t)qword_257522518);
    sub_245DE98EC(a1, (uint64_t)v9, type metadata accessor for SKUISetupGenericClient.Event);
    v45 = sub_245E06314();
    v46 = (uint64_t)v9;
    v47 = sub_245E068E4();
    if (os_log_type_enabled(v45, v47))
    {
      v48 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v70 = v49;
      *(_DWORD *)v48 = v57;
      *(_QWORD *)(v48 + 4) = v43;
      *(_WORD *)(v48 + 12) = 2080;
      v50 = SKUISetupGenericClient.Event.description.getter();
      *(_QWORD *)(v48 + 14) = sub_245DE3004(v50, v51, &v70);
      swift_bridgeObjectRelease();
      sub_245DE9930(v46, type metadata accessor for SKUISetupGenericClient.Event);
      _os_log_impl(&dword_245DDF000, v45, v47, "event monitor report: id=%llu, event={%s}", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v49, -1, -1);
      v52 = v48;
      a1 = v58;
      MEMORY[0x24954972C](v52, -1, -1);
    }
    else
    {
      sub_245DE9930(v46, type metadata accessor for SKUISetupGenericClient.Event);
    }

    v9 = (char *)v46;
    v15 = v68;
    sub_245DE98EC(a1, (uint64_t)v7, type metadata accessor for SKUISetupGenericClient.Event);
    v26 = v60;
    v10 = v62;
    v27 = v67;
    sub_245E0686C();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v26, v61);
    result = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v27, v10);
    v24 = v41;
    v22 = v66;
  }
  v38 = *(_QWORD *)(v54 + 8 * v39);
  if (v38)
  {
LABEL_15:
    v37 = v39;
LABEL_12:
    v29 = (v38 - 1) & v38;
    v30 = __clz(__rbit64(v38)) + (v37 << 6);
    v65 = v37;
    goto LABEL_8;
  }
  while (1)
  {
    v37 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v37 >= v55)
    {
      v65 = v53;
      goto LABEL_26;
    }
    v38 = *(_QWORD *)(v54 + 8 * v37);
    ++v39;
    if (v38)
      goto LABEL_12;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t static SKUISetupGenericClient.perform(command:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v1[3] = type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage(0);
  v1[4] = swift_task_alloc();
  v2 = sub_245E06338();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = sub_245E06404();
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DF9830()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[4];
  v2 = v0[2];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[6] + 104))(v0[7], *MEMORY[0x24BE6D370], v0[5]);
  sub_245DFEA40();
  sub_245E068F0();
  sub_245E064AC();
  swift_allocObject();
  v0[11] = sub_245E064A0();
  sub_245DE98EC(v2, v1, type metadata accessor for SKUISetupGenericClient.Command);
  v3 = (_QWORD *)swift_task_alloc();
  v0[12] = v3;
  sub_245DE38DC(&qword_25751F310, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestMessage);
  *v3 = v0;
  v3[1] = sub_245DF9934;
  return sub_245E06494();
}

uint64_t sub_245DF9934()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  (*v1)[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_245DE9930(v2[4], type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage);
    swift_release();
  }
  else
  {
    v4 = v2[9];
    v3 = v2[10];
    v5 = v2[8];
    v6 = v2[4];
    swift_release();
    sub_245DE9930(v6, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_245DF99F8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DF9A44()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKUISetupGenericClient.perform(command:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_245E06488();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_245E06524();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v5 = sub_245E06428();
  v2[12] = v5;
  v2[13] = *(_QWORD *)(v5 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = type metadata accessor for SKUISetupGenericClient.Command(0);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  sub_245DE38DC(&qword_25751F2C8, type metadata accessor for SKUISetupGenericClient, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient);
  v2[18] = sub_245E0680C();
  v2[19] = v6;
  return swift_task_switch();
}

uint64_t sub_245DF9BC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v16;

  if (qword_257522510 != -1)
    swift_once();
  v1 = v0[3];
  v2 = v0[17];
  v3 = sub_245E0632C();
  __swift_project_value_buffer(v3, (uint64_t)qword_257522518);
  sub_245DE98EC(v1, v2, type metadata accessor for SKUISetupGenericClient.Command);
  v4 = sub_245E06314();
  v5 = sub_245E068E4();
  v6 = os_log_type_enabled(v4, v5);
  v7 = v0[17];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = SKUISetupGenericClient.Command.description.getter();
    v0[2] = sub_245DE3004(v10, v11, &v16);
    sub_245E06914();
    swift_bridgeObjectRelease();
    sub_245DE9930(v7, type metadata accessor for SKUISetupGenericClient.Command);
    _os_log_impl(&dword_245DDF000, v4, v5, "perform command: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v9, -1, -1);
    MEMORY[0x24954972C](v8, -1, -1);
  }
  else
  {
    sub_245DE9930(v0[17], type metadata accessor for SKUISetupGenericClient.Command);
  }

  v12 = v0[4];
  sub_245DE98EC(v0[3], v0[16], type metadata accessor for SKUISetupGenericClient.Command);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v14 = v0[16];
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[6] + 32))(v0[7], v14, v0[5]);
    v0[24] = *(_QWORD *)(v12 + 16);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[13] + 32))(v0[14], v14, v0[12]);
    v0[20] = *(_QWORD *)(v12 + 16);
  }
  sub_245E06770();
  sub_245DE38DC(&qword_25751EA30, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C08], MEMORY[0x24BE85C18]);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DF9E7C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 168) = sub_245E06734();
  return swift_task_switch();
}

uint64_t sub_245DF9EB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[11];
  v2 = v0[8];
  v3 = v0[9];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[13] + 16))(v1, v0[14], v0[12]);
  v4 = *MEMORY[0x24BE6D4C0];
  v5 = sub_245E06350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v1, v4, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x24BE6DC48], v2);
  v6 = (_QWORD *)swift_task_alloc();
  v0[22] = v6;
  *v6 = v0;
  v6[1] = sub_245DF9F74;
  return sub_245E06530();
}

uint64_t sub_245DF9F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_245DF9FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DFA09C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 200) = sub_245E06734();
  return swift_task_switch();
}

uint64_t sub_245DFA0D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[8];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[6] + 16))(v1, v0[7], v0[5]);
  v4 = *MEMORY[0x24BE6D4C8];
  v5 = sub_245E06350();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v1, v4, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE6DC48], v3);
  v6 = (_QWORD *)swift_task_alloc();
  v0[26] = v6;
  *v6 = v0;
  v6[1] = sub_245DFA194;
  return sub_245E06530();
}

uint64_t sub_245DFA194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_245DFA21C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DFA2BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DFA364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t SKUISetupGenericClient.Command.description.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(_QWORD);
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;

  v1 = v0;
  v2 = sub_245E06488();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E06428();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SKUISetupGenericClient.Command(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DE98EC(v1, (uint64_t)v12, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v12, v2);
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v16 = 0xD00000000000001ALL;
    v17 = 0x8000000245E09F10;
    sub_245DE38DC(&qword_25751EBA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D990], MEMORY[0x24BE6D9B0]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    v14 = v16;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v16 = 0xD000000000000018;
    v17 = 0x8000000245E0A510;
    sub_245DE38DC(&qword_25751F320, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D8C0], MEMORY[0x24BE6D8E0]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    v14 = v16;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v14;
}

uint64_t sub_245DFA66C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_245E03C1C(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_245DFA698()
{
  sub_245DFF940();
  return sub_245E06B00();
}

uint64_t sub_245DFA6C0()
{
  sub_245DFF940();
  return sub_245E06B0C();
}

uint64_t sub_245DFA6E8()
{
  sub_245DFF8FC();
  return sub_245E06B00();
}

uint64_t sub_245DFA710()
{
  sub_245DFF8FC();
  return sub_245E06B0C();
}

unint64_t sub_245DFA738()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000017;
  else
    return 0xD000000000000015;
}

uint64_t sub_245DFA778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245E03C88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245DFA79C()
{
  sub_245DFF8B8();
  return sub_245E06B00();
}

uint64_t sub_245DFA7C4()
{
  sub_245DFF8B8();
  return sub_245E06B0C();
}

uint64_t SKUISetupGenericClient.Command.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;

  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F328);
  v31 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v30 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_245E06488();
  v29 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F330);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_245E06428();
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SKUISetupGenericClient.Command(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F338);
  v34 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245DFF8B8();
  sub_245E06ADC();
  sub_245DE98EC(v35, (uint64_t)v10, type metadata accessor for SKUISetupGenericClient.Command);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = v28;
    v14 = v29;
    v16 = v32;
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v28, v10, v32);
    v37 = 1;
    sub_245DFF8FC();
    v17 = v30;
    sub_245E06A10();
    sub_245DE38DC(&qword_25751F340, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D990], MEMORY[0x24BE6D9A0]);
    v18 = v33;
    sub_245E06A40();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v18);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v15, v16);
  }
  else
  {
    v19 = v24;
    v20 = v26;
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v7, v10, v26);
    v36 = 0;
    sub_245DFF940();
    sub_245E06A10();
    sub_245DE38DC(&qword_25751F348, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D8C0], MEMORY[0x24BE6D8D0]);
    v21 = v27;
    sub_245E06A40();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v21);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v11);
}

uint64_t SKUISetupGenericClient.Command.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;

  v36 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F350);
  v40 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v43 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F358);
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F360);
  v41 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SKUISetupGenericClient.Command(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v18 = a1[3];
  v44 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v18);
  sub_245DFF8B8();
  v19 = v45;
  sub_245E06AD0();
  if (v19)
    goto LABEL_5;
  v34 = v12;
  v35 = v15;
  v20 = v43;
  v33 = v17;
  v45 = v9;
  v21 = v6;
  v22 = v8;
  if (*(_QWORD *)(sub_245E06A04() + 16) != 1)
  {
    v27 = sub_245E0695C();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751F368);
    *v29 = v45;
    sub_245E069C8();
    sub_245E06950();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
LABEL_5:
    v26 = (uint64_t)v44;
    return __swift_destroy_boxed_opaque_existential_0(v26);
  }
  v46 = 1;
  sub_245DFF8FC();
  v23 = v20;
  sub_245E069BC();
  sub_245E06488();
  sub_245DE38DC(&qword_25751F370, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D990], MEMORY[0x24BE6D9A8]);
  v24 = (uint64_t)v34;
  v25 = v37;
  sub_245E069F8();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v25);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v21);
  v26 = (uint64_t)v44;
  swift_storeEnumTagMultiPayload();
  v31 = (uint64_t)v33;
  sub_245E005B4(v24, (uint64_t)v33, type metadata accessor for SKUISetupGenericClient.Command);
  sub_245E005B4(v31, v36, type metadata accessor for SKUISetupGenericClient.Command);
  return __swift_destroy_boxed_opaque_existential_0(v26);
}

uint64_t sub_245DFB04C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKUISetupGenericClient.Command.init(from:)(a1, a2);
}

uint64_t sub_245DFB060(_QWORD *a1)
{
  return SKUISetupGenericClient.Command.encode(to:)(a1);
}

Swift::Void __swiftcall SKUISetupGenericClient.registerExternalHandlers()()
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

  v1 = v0;
  v2 = sub_245E0635C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__nexusServer;
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__nexusServer))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751F380);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_245E08730;
    v8 = swift_allocObject();
    swift_weakInit();
    *(_QWORD *)(v7 + 56) = &type metadata for SKUISetupGenericClientExternalCommandRequestHandler;
    *(_QWORD *)(v7 + 64) = sub_245DFF9E8();
    *(_QWORD *)(v7 + 32) = &unk_25751F390;
    *(_QWORD *)(v7 + 40) = v8;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE6D4F0], v2);
    sub_245DFE528(MEMORY[0x24BEE4AF8]);
    sub_245DFEA40();
    sub_245E068F0();
    sub_245E064D0();
    swift_allocObject();
    *(_QWORD *)(v1 + v6) = sub_245E064B8();
    swift_retain();
    swift_release();
    sub_245E064C4();
    swift_release();
  }
}

uint64_t sub_245DFB208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  v5 = sub_245E0662C();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DFB26C()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_245DFB370;
    return SKUISetupGenericClient.perform(command:)(*(_QWORD *)(v0 + 48));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 104))(*(_QWORD *)(v0 + 80), *MEMORY[0x24BE85A50], *(_QWORD *)(v0 + 64));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DFB370()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DFB3D4()
{
  uint64_t v0;

  sub_245E063F8();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DFB41C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKUISetupGenericClient.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v23[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F3A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F3A8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = CUNextID64();
  if (qword_257522510 != -1)
    swift_once();
  v14 = sub_245E0632C();
  __swift_project_value_buffer(v14, (uint64_t)qword_257522518);
  v15 = sub_245E06314();
  v16 = sub_245E068CC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = v2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v25 = v13;
    sub_245E06914();
    _os_log_impl(&dword_245DDF000, v15, v16, "event monitor start: id=%llu", v18, 0xCu);
    MEMORY[0x24954972C](v18, -1, -1);
  }

  type metadata accessor for SKUISetupGenericClient.Event(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6A10], v6);
  sub_245E06854();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v12, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_245DFB750((uint64_t)v5, v13);
  swift_endAccess();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v13;
  sub_245E06860();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_245DFB750(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F3A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_245DEB574(a1, &qword_25751F3A0);
    v13 = sub_245DE99E0(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_245DFF148();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_245DFEDC4(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_245DEB574((uint64_t)v8, &qword_25751F3A0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_245DFEF90((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_245DFB92C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751EB40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E06848();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v8[5] = a2;
  sub_245DE8A9C((uint64_t)v5, (uint64_t)&unk_25751F878, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_245DFBA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_245DFBA64()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_245DE8804;
    return sub_245DFBB00(*(_QWORD *)(v0 + 56));
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245DFBB00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = a1;
  v2[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F3A0);
  v2[8] = swift_task_alloc();
  sub_245DE38DC(&qword_25751F2C8, type metadata accessor for SKUISetupGenericClient, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient);
  sub_245E0680C();
  return swift_task_switch();
}

uint64_t sub_245DFBB90()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_257522510 != -1)
    swift_once();
  v1 = sub_245E0632C();
  __swift_project_value_buffer(v1, (uint64_t)qword_257522518);
  v2 = sub_245E06314();
  v3 = sub_245E068CC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    *(_QWORD *)(v0 + 40) = v4;
    sub_245E06914();
    _os_log_impl(&dword_245DDF000, v2, v3, "event monitor cancel: id=%llu", v5, 0xCu);
    MEMORY[0x24954972C](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  swift_beginAccess();
  sub_245DFB750(v6, v7);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DFBD20()
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
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  int64_t v34;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - v9;
  v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__eventContinuations);
  swift_beginAccess();
  v12 = *v11;
  v14 = (_QWORD *)(*v11 + 64);
  v13 = *v14;
  v32 = v11;
  v33 = v14;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v13;
  v34 = (unint64_t)(v15 + 63) >> 6;
  v31 = v34 - 1;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  while (1)
  {
    if (v17)
    {
      v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v21 = v20 | (v19 << 6);
LABEL_6:
      v22 = *(_QWORD *)(v12 + 56);
      *(_QWORD *)v8 = *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * v21);
      v23 = v22 + *(_QWORD *)(v2 + 72) * v21;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F8);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(&v8[*(int *)(v24 + 48)], v23, v1);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v8, 0, 1, v24);
      goto LABEL_25;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v25 < v34)
    {
      v26 = v33[v25];
      if (v26)
        goto LABEL_10;
      v27 = v19 + 2;
      ++v19;
      if (v25 + 1 < v34)
      {
        v26 = v33[v27];
        if (v26)
          goto LABEL_13;
        v19 = v25 + 1;
        if (v25 + 2 < v34)
        {
          v26 = v33[v25 + 2];
          if (v26)
          {
            v25 += 2;
            goto LABEL_10;
          }
          v27 = v25 + 3;
          v19 = v25 + 2;
          if (v25 + 3 < v34)
            break;
        }
      }
    }
LABEL_24:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v8, 1, 1, v28);
    v17 = 0;
LABEL_25:
    sub_245DFE9E4((uint64_t)v8, (uint64_t)v10);
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v10, 1, v29) == 1)
    {
      swift_release();
      *v32 = MEMORY[0x24BEE4B00];
      return swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, &v10[*(int *)(v29 + 48)], v1);
    sub_245E06878();
    result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v26 = v33[v27];
  if (v26)
  {
LABEL_13:
    v25 = v27;
LABEL_10:
    v17 = (v26 - 1) & v26;
    v21 = __clz(__rbit64(v26)) + (v25 << 6);
    v19 = v25;
    goto LABEL_6;
  }
  while (1)
  {
    v25 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v25 >= v34)
    {
      v19 = v31;
      goto LABEL_24;
    }
    v26 = v33[v25];
    ++v27;
    if (v26)
      goto LABEL_10;
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t SKUISetupGenericClient.Event.description.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(_QWORD);
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;

  v1 = v0;
  v2 = sub_245E06470();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E06458();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SKUISetupGenericClient.Event(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DE98EC(v1, (uint64_t)v12, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v12, v2);
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v16 = 0xD00000000000001ALL;
    v17 = 0x8000000245E09F30;
    sub_245DE38DC(&qword_25751EBC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D970], MEMORY[0x24BE6D980]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    v14 = v16;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v16 = 0xD000000000000018;
    v17 = 0x8000000245E0A560;
    sub_245DE38DC(&qword_25751F3B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D930], MEMORY[0x24BE6D948]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    v14 = v16;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v14;
}

uint64_t SKUISetupGenericClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_245DE9930(v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__configuration, type metadata accessor for SKUISetupGenericClientConfiguration);
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKUISetupGenericClient.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_245DE9930(v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient__configuration, type metadata accessor for SKUISetupGenericClientConfiguration);
  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_245DFC3F0()
{
  sub_245DE38DC(&qword_25751F828, type metadata accessor for SKUISetupGenericClient, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient);
  return sub_245E06638();
}

uint64_t sub_245DFC440@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI22SKUISetupGenericClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUISetupGenericClientConfiguration.activationConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_245DFFAD0(v1, a1, &qword_25751F290);
}

uint64_t SKUISetupGenericClientConfiguration.activationConfiguration.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_245DFE98C(a1, v1, &qword_25751F290);
}

uint64_t (*SKUISetupGenericClientConfiguration.activationConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t SKUISetupGenericClientConfiguration.appleAccountSetupConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_245DFCEE4(type metadata accessor for SKUISetupGenericClientConfiguration, &qword_25751F298, a1);
}

uint64_t SKUISetupGenericClientConfiguration.appleAccountSetupConfiguration.setter(uint64_t a1)
{
  return sub_245DFCF40(a1, type metadata accessor for SKUISetupGenericClientConfiguration, &qword_25751F298);
}

uint64_t (*SKUISetupGenericClientConfiguration.appleAccountSetupConfiguration.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return nullsub_1;
}

id SKUISetupGenericClientConfiguration.autoUnlockSetupConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 24));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = (void *)v3[4];
  v9 = (void *)v3[5];
  v10 = (void *)v3[6];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = (uint64_t)v8;
  a1[5] = (uint64_t)v9;
  a1[6] = (uint64_t)v10;
  return sub_245DF1814(v4, v5, v6, v7, v8, v9, v10);
}

__n128 SKUISetupGenericClientConfiguration.autoUnlockSetupConfiguration.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;
  __n128 v5;
  __int128 v6;
  __int128 v7;

  v6 = a1[1];
  v7 = *a1;
  v5 = (__n128)a1[2];
  v2 = *((_QWORD *)a1 + 6);
  v3 = v1 + *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 24);
  sub_245DEDCD8(*(_QWORD *)v3, *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(void **)(v3 + 32), *(void **)(v3 + 40), *(void **)(v3 + 48));
  *(_OWORD *)v3 = v7;
  *(_OWORD *)(v3 + 16) = v6;
  result = v5;
  *(__n128 *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 48) = v2;
  return result;
}

uint64_t (*SKUISetupGenericClientConfiguration.autoUnlockSetupConfiguration.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return nullsub_1;
}

void *SKUISetupGenericClientConfiguration.bluetoothDevice.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 28));
  v2 = v1;
  return v1;
}

void SKUISetupGenericClientConfiguration.bluetoothDevice.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 28);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*SKUISetupGenericClientConfiguration.bluetoothDevice.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientConfiguration.clientConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 32);
  v4 = sub_245E06668();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUISetupGenericClientConfiguration.clientConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SKUISetupGenericClientConfiguration(0) + 32);
  v4 = sub_245E06668();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SKUISetupGenericClientConfiguration.clientConfiguration.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientConfiguration.wifiSetupConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return sub_245DFFAD0(v1 + *(int *)(v3 + 36), a1, &qword_25751F288);
}

uint64_t SKUISetupGenericClientConfiguration.wifiSetupConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return sub_245DFE98C(a1, v1 + *(int *)(v3 + 36), &qword_25751F288);
}

uint64_t (*SKUISetupGenericClientConfiguration.wifiSetupConfiguration.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientConfiguration(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_245E065B4();
  v46 = *(char **)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245E06710();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E062C0();
  v44 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = 0;
  v58 = 0xE000000000000000;
  sub_245E062B4();
  v47 = v0;
  sub_245DFFAD0(v0, (uint64_t)v8, &qword_25751F290);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_245DEB574((uint64_t)v8, &qword_25751F290);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v48 = 0;
    v49 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v48 = 0xD000000000000019;
    v49 = 0x8000000245E0A610;
    sub_245DE38DC(&qword_25751F3D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE85B78], MEMORY[0x24BE85B88]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v16 = (int *)type metadata accessor for SKUISetupGenericClientConfiguration(0);
  v17 = v47;
  sub_245DFFAD0(v47 + v16[5], (uint64_t)v3, &qword_25751F298);
  v18 = v46;
  if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v46 + 6))(v3, 1, v4) == 1)
  {
    sub_245DEB574((uint64_t)v3, &qword_25751F298);
  }
  else
  {
    v19 = v43;
    (*((void (**)(char *, char *, uint64_t))v18 + 4))(v43, v3, v4);
    v48 = 0;
    v49 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v48 = 0xD000000000000020;
    v49 = 0x8000000245E0A5E0;
    sub_245DE38DC(&qword_25751F3C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE859A0], MEMORY[0x24BE859B0]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, uint64_t))v18 + 1))(v19, v4);
  }
  v20 = (uint64_t *)(v17 + v16[6]);
  v21 = v20[1];
  if (v21 != 1)
  {
    v23 = (void *)v20[5];
    v22 = (void *)v20[6];
    v46 = v15;
    v25 = v20[3];
    v24 = (void *)v20[4];
    v26 = v20[2];
    v27 = *v20;
    v48 = 0;
    v49 = 0xE000000000000000;
    v28 = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29 = v24;
    v30 = v23;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v55 = 0xD00000000000001ELL;
    v56 = 0x8000000245E0A5C0;
    v48 = v27;
    v49 = v21;
    v50 = v26;
    v51 = v25;
    v52 = v24;
    v53 = v23;
    v54 = v22;
    sub_245DFFA58();
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    v31 = v25;
    v32 = v22;
    v15 = v46;
    v17 = v47;
    sub_245DEDCD8(v27, v21, v26, v31, v24, v23, v32);
  }
  v33 = *(void **)(v17 + v16[7]);
  if (v33)
  {
    v48 = 0;
    v49 = 0xE000000000000000;
    v34 = v33;
    sub_245E06938();
    sub_245E067F4();
    v35 = objc_msgSend(v34, sel_identifier);
    if (v35)
    {
      v36 = v35;
      v37 = sub_245E067D0();
      v39 = v38;

    }
    else
    {
      v37 = 0;
      v39 = 0;
    }
    v55 = v37;
    v56 = v39;
    sub_245E06A58();
    swift_bridgeObjectRelease();
    sub_245E067DC();

    swift_bridgeObjectRelease();
  }
  v48 = 0;
  v49 = 0xE000000000000000;
  sub_245E06938();
  swift_bridgeObjectRelease();
  v48 = 0xD000000000000015;
  v49 = 0x8000000245E0A580;
  sub_245E06668();
  sub_245DE38DC(&qword_25751F3B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85A88], MEMORY[0x24BE85A98]);
  sub_245E06A4C();
  sub_245E067F4();
  swift_bridgeObjectRelease();
  sub_245E067F4();
  sub_245E067DC();
  swift_bridgeObjectRelease();
  v40 = v57;
  v41 = HIBYTE(v58) & 0xF;
  if ((v58 & 0x2000000000000000) == 0)
    v41 = v57 & 0xFFFFFFFFFFFFLL;
  if (!v41)
  {
    swift_bridgeObjectRelease();
    v40 = 0x746C7561666564;
  }
  (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v45);
  return v40;
}

uint64_t SKUISetupGenericClientReport.activationReport.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_245DFFAD0(v1, a1, &qword_25751F2B0);
}

uint64_t SKUISetupGenericClientReport.activationReport.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_245DFE98C(a1, v1, &qword_25751F2B0);
}

uint64_t (*SKUISetupGenericClientReport.activationReport.modify())()
{
  return nullsub_1;
}

uint64_t SKUISetupGenericClientReport.appleAccountSetupReport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_245DFCEE4(type metadata accessor for SKUISetupGenericClientReport, &qword_25751F2A8, a1);
}

uint64_t sub_245DFCEE4@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return sub_245DFFAD0(v3 + *(int *)(v6 + 20), a3, a2);
}

uint64_t SKUISetupGenericClientReport.appleAccountSetupReport.setter(uint64_t a1)
{
  return sub_245DFCF40(a1, type metadata accessor for SKUISetupGenericClientReport, &qword_25751F2A8);
}

uint64_t sub_245DFCF40(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return sub_245DFE98C(a1, v3 + *(int *)(v6 + 20), a3);
}

uint64_t (*SKUISetupGenericClientReport.appleAccountSetupReport.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientReport(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientReport.autoUnlockSetupReport.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SKUISetupGenericClientReport(0) + 24));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  return sub_245DFFA9C(v4, v5);
}

__n128 SKUISetupGenericClientReport.autoUnlockSetupReport.setter(__n128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_i64[0];
  v3 = a1[1].n128_i64[1];
  v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SKUISetupGenericClientReport(0) + 24));
  sub_245DFE958(*v4, v4[1]);
  result = v6;
  *(__n128 *)v4 = v6;
  v4[2] = v2;
  v4[3] = v3;
  return result;
}

uint64_t (*SKUISetupGenericClientReport.autoUnlockSetupReport.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientReport(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientReport.wifiSetupReport.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SKUISetupGenericClientReport(0);
  return sub_245DFFAD0(v1 + *(int *)(v3 + 28), a1, &qword_25751F2B8);
}

uint64_t SKUISetupGenericClientReport.wifiSetupReport.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SKUISetupGenericClientReport(0);
  return sub_245DFE98C(a1, v1 + *(int *)(v3 + 28), &qword_25751F2B8);
}

uint64_t (*SKUISetupGenericClientReport.wifiSetupReport.modify())(void)
{
  type metadata accessor for SKUISetupGenericClientReport(0);
  return nullsub_1;
}

uint64_t SKUISetupGenericClientReport.description.getter()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
  MEMORY[0x24BDAC7A8](v2);
  v41 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_245E06578();
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245E065E4();
  v38 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_245E066A4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_245E062C0();
  v39 = *(_QWORD *)(v18 - 8);
  v40 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = 0;
  v52 = 0xE000000000000000;
  sub_245E062B4();
  v44 = v1;
  sub_245DFFAD0(v1, (uint64_t)v13, &qword_25751F2B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_245DEB574((uint64_t)v13, &qword_25751F2B0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v45 = 0xD000000000000012;
    v46 = 0x8000000245E0A690;
    sub_245DE38DC(&qword_25751F3F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE85AD8], MEMORY[0x24BE85B00]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  v21 = (int *)type metadata accessor for SKUISetupGenericClientReport(0);
  v22 = v44;
  sub_245DFFAD0(v44 + v21[5], (uint64_t)v8, &qword_25751F2A8);
  v23 = v38;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v8, 1, v9) == 1)
  {
    sub_245DEB574((uint64_t)v8, &qword_25751F2A8);
  }
  else
  {
    v24 = v36;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v36, v8, v9);
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v45 = 0xD000000000000014;
    v46 = 0x8000000245E0A670;
    sub_245DE38DC(&qword_25751F3E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE859D8], MEMORY[0x24BE85A00]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v9);
  }
  v25 = (unint64_t *)(v22 + v21[6]);
  v26 = v25[1];
  if (v26 != 1)
  {
    v28 = v25[2];
    v27 = v25[3];
    v29 = *v25;
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v49 = 0xD000000000000017;
    v50 = 0x8000000245E0A650;
    v45 = v29;
    v46 = v26;
    v47 = v28;
    v48 = v27;
    v22 = v44;
    sub_245DFFB14();
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
  }
  v30 = v41;
  sub_245DFFAD0(v22 + v21[7], v41, &qword_25751F2B8);
  v32 = v42;
  v31 = v43;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v30, 1, v43) == 1)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
    sub_245DEB574(v30, &qword_25751F2B8);
  }
  else
  {
    v33 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v37, v30, v31);
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_245E06938();
    swift_bridgeObjectRelease();
    v45 = 0xD000000000000011;
    v46 = 0x8000000245E0A630;
    sub_245DE38DC(&qword_25751F3D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85938], MEMORY[0x24BE85960]);
    sub_245E06A4C();
    sub_245E067F4();
    swift_bridgeObjectRelease();
    sub_245E067F4();
    sub_245E067DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
  }
  return v51;
}

uint64_t sub_245DFD710(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245DFD748 + 4 * byte_245E08740[a1]))(0xD000000000000010, 0x8000000245E0A740);
}

uint64_t sub_245DFD748(uint64_t a1)
{
  return a1 + 7;
}

uint64_t sub_245DFD770()
{
  return 0x7574655369666977;
}

uint64_t sub_245DFD794()
{
  unsigned __int8 *v0;

  return sub_245DFD710(*v0);
}

uint64_t sub_245DFD79C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245E03D70(a1, a2);
  *a3 = result;
  return result;
}

void sub_245DFD7C0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_245DFD7CC()
{
  sub_245E0052C();
  return sub_245E06B00();
}

uint64_t sub_245DFD7F4()
{
  sub_245E0052C();
  return sub_245E06B0C();
}

uint64_t SKUISetupGenericClientReport.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  _BYTE v13[16];
  __int128 v14;
  __int128 v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F3F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245E0052C();
  sub_245E06ADC();
  LOBYTE(v14) = 0;
  sub_245E066A4();
  sub_245DE38DC(&qword_25751F400, (uint64_t (*)(uint64_t))MEMORY[0x24BE85AD8], MEMORY[0x24BE85AE8]);
  sub_245E06A34();
  if (!v2)
  {
    v9 = type metadata accessor for SKUISetupGenericClientReport(0);
    LOBYTE(v14) = 1;
    sub_245E065E4();
    sub_245DE38DC(&qword_25751F408, (uint64_t (*)(uint64_t))MEMORY[0x24BE859D8], MEMORY[0x24BE859E8]);
    sub_245E06A34();
    v10 = (__int128 *)(v3 + *(int *)(v9 + 24));
    v11 = v10[1];
    v14 = *v10;
    v15 = v11;
    v13[15] = 2;
    sub_245DF00BC();
    sub_245E06A34();
    LOBYTE(v14) = 3;
    sub_245E06578();
    sub_245DE38DC(&qword_25751F410, (uint64_t (*)(uint64_t))MEMORY[0x24BE85938], MEMORY[0x24BE85948]);
    sub_245E06A34();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SKUISetupGenericClientReport.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  __int128 v46;
  char *v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  char v53;

  v41 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
  MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
  MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)&v46 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F418);
  v44 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for SKUISetupGenericClientReport(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_245E066A4();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v43 = v14;
  v15(v13, 1, 1);
  v16 = &v13[v11[5]];
  v17 = sub_245E065E4();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v42 = (uint64_t)v16;
  v18(v16, 1, 1, v17);
  v19 = (uint64_t *)&v13[v11[6]];
  *(_OWORD *)v19 = xmmword_245E07460;
  v19[2] = 0;
  v19[3] = 0;
  v20 = (uint64_t)&v13[v11[7]];
  v21 = sub_245E06578();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v39 = v20;
  v22(v20, 1, 1, v21);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245E0052C();
  v47 = v10;
  v23 = (uint64_t)v49;
  sub_245E06AD0();
  v24 = a1;
  if (v23)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v25 = v42;
    v38 = v19;
    v49 = v13;
    v26 = v44;
    v27 = (uint64_t)v45;
    v28 = (uint64_t)v24;
    LOBYTE(v50) = 0;
    sub_245DE38DC(&qword_25751F420, (uint64_t (*)(uint64_t))MEMORY[0x24BE85AD8], MEMORY[0x24BE85AF8]);
    v29 = v46;
    v30 = v47;
    sub_245E069EC();
    sub_245DFE98C(v29, (uint64_t)v49, &qword_25751F2B0);
    LOBYTE(v50) = 1;
    sub_245DE38DC(&qword_25751F428, (uint64_t (*)(uint64_t))MEMORY[0x24BE859D8], MEMORY[0x24BE859F8]);
    sub_245E069EC();
    sub_245DFE98C(v27, v25, &qword_25751F2A8);
    v53 = 2;
    sub_245DF0100();
    sub_245E069EC();
    v46 = v50;
    v33 = v51;
    v32 = v52;
    v34 = v38;
    sub_245DFE958(*v38, v38[1]);
    *(_OWORD *)v34 = v46;
    v34[2] = v33;
    v34[3] = v32;
    LOBYTE(v50) = 3;
    sub_245DE38DC(&qword_25751F430, (uint64_t (*)(uint64_t))MEMORY[0x24BE85938], MEMORY[0x24BE85958]);
    v35 = (uint64_t)v40;
    v36 = v48;
    sub_245E069EC();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v36);
    v37 = v41;
    v13 = v49;
    sub_245DFE98C(v35, v39, &qword_25751F2B8);
    sub_245DE98EC((uint64_t)v13, v37, type metadata accessor for SKUISetupGenericClientReport);
    __swift_destroy_boxed_opaque_existential_0(v28);
  }
  return sub_245DE9930((uint64_t)v13, type metadata accessor for SKUISetupGenericClientReport);
}

uint64_t sub_245DFDEEC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKUISetupGenericClientReport.init(from:)(a1, a2);
}

uint64_t sub_245DFDF00(_QWORD *a1)
{
  return SKUISetupGenericClientReport.encode(to:)(a1);
}

unint64_t static SKUISetupGenericClientExternalCommandRequestMessage.requestName.getter()
{
  return 0xD000000000000025;
}

uint64_t SKUISetupGenericClientExternalCommandRequestMessage.command.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_245DE98EC(v1, a1, type metadata accessor for SKUISetupGenericClient.Command);
}

uint64_t sub_245DFDF60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_245E03F2C(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_245DFDF8C()
{
  sub_245E00570();
  return sub_245E06B00();
}

uint64_t sub_245DFDFB4()
{
  sub_245E00570();
  return sub_245E06B0C();
}

uint64_t SKUISetupGenericClientExternalCommandRequestMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F438);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245E00570();
  sub_245E06ADC();
  type metadata accessor for SKUISetupGenericClient.Command(0);
  sub_245DE38DC(&qword_25751F440, type metadata accessor for SKUISetupGenericClient.Command, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient.Command);
  sub_245E06A40();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t SKUISetupGenericClientExternalCommandRequestMessage.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = a2;
  v4 = type metadata accessor for SKUISetupGenericClient.Command(0);
  MEMORY[0x24BDAC7A8](v4);
  v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F448);
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245E00570();
  sub_245E06AD0();
  if (!v2)
  {
    sub_245DE38DC(&qword_25751F450, type metadata accessor for SKUISetupGenericClient.Command, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient.Command);
    sub_245E069F8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_245E005B4(v15, (uint64_t)v11, type metadata accessor for SKUISetupGenericClient.Command);
    sub_245E005B4((uint64_t)v11, v13, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_245DFE2B8()
{
  return 0xD000000000000025;
}

uint64_t sub_245DFE2D4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKUISetupGenericClientExternalCommandRequestMessage.init(from:)(a1, a2);
}

uint64_t sub_245DFE2E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F438);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_245E00570();
  sub_245E06ADC();
  type metadata accessor for SKUISetupGenericClient.Command(0);
  sub_245DE38DC(&qword_25751F440, type metadata accessor for SKUISetupGenericClient.Command, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClient.Command);
  sub_245E06A40();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t SKUISetupGenericClientExternalCommandRequestHandler.asyncHandler.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_245DFE428()
{
  sub_245E03FC8();
  return sub_245E06410();
}

uint64_t sub_245DFE454()
{
  return sub_245E06374();
}

uint64_t sub_245DFE478(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245DFE4DC;
  return v6(a1);
}

uint64_t sub_245DFE4DC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_245DFE528(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F890);
  v2 = (_QWORD *)sub_245E069A4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_245DFE650(v5, v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_245DFE650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245E06AAC();
  sub_245E067E8();
  v4 = sub_245E06AC4();
  return sub_245DFE6B4(a1, a2, v4);
}

unint64_t sub_245DFE6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_245E06A64() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_245E06A64() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_245E06A64() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t type metadata accessor for SKUISetupGenericClientReport(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_257522EB0);
}

uint64_t type metadata accessor for SKUISetupGenericClient(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_257522E70);
}

uint64_t sub_245DFE820()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245DFE844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DFE8D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751F2C0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_245DE9848;
  return sub_245DF8594((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_245DFE958(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_245DFE98C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for SKUISetupGenericClient.Event(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_257522E90);
}

uint64_t sub_245DFE9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1)
{
  return sub_245DE9980(a1, qword_257522EC0);
}

unint64_t sub_245DFEA40()
{
  unint64_t result;

  result = qword_25751F308;
  if (!qword_25751F308)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25751F308);
  }
  return result;
}

uint64_t type metadata accessor for SKUISetupGenericClient.Command(uint64_t a1)
{
  return sub_245DE9980(a1, (uint64_t *)&unk_257522E80);
}

uint64_t sub_245DFEA90(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F888);
  result = sub_245E06998();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_245E06AA0();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_245DFEDC4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245E0692C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_245E06AA0();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_245DFEF90(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_245DE99E0(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_245DFF0B8(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_245DFF148();
      goto LABEL_7;
    }
    sub_245DFEA90(v13, a3 & 1);
    v20 = sub_245DE99E0(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_245DFF0B8(v10, a2, a1, v16);
    }
  }
  result = sub_245E06A70();
  __break(1u);
  return result;
}

uint64_t sub_245DFF0B8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_245DFF148()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2E8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751F888);
  v23 = v0;
  v5 = *v0;
  v6 = sub_245E0698C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t _s10SetupKitUI22SKUISetupGenericClientC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v3 = sub_245E06470();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E06458();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SKUISetupGenericClient.Event(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F868);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_245DE98EC(a1, (uint64_t)v18, type metadata accessor for SKUISetupGenericClient.Event);
  sub_245DE98EC(v29, v19, type metadata accessor for SKUISetupGenericClient.Event);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v12, type metadata accessor for SKUISetupGenericClient.Event);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = v26;
      v20 = v27;
      v5 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v26, v19, v28);
      v22 = sub_245E06464();
      v23 = *(void (**)(char *, uint64_t))(v20 + 8);
      v23(v21, v5);
      v24 = v12;
LABEL_9:
      v23(v24, v5);
      sub_245DE9930((uint64_t)v18, type metadata accessor for SKUISetupGenericClient.Event);
      return v22 & 1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
  }
  else
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v14, type metadata accessor for SKUISetupGenericClient.Event);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v19, v5);
      v22 = sub_245E0644C();
      v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v8, v5);
      v24 = v14;
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  }
  sub_245DEB574((uint64_t)v18, &qword_25751F868);
  v22 = 0;
  return v22 & 1;
}

uint64_t _s10SetupKitUI22SKUISetupGenericClientC7CommandO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v3 = sub_245E06488();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E06428();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SKUISetupGenericClient.Command(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F898);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_245DE98EC(a1, (uint64_t)v18, type metadata accessor for SKUISetupGenericClient.Command);
  sub_245DE98EC(v29, v19, type metadata accessor for SKUISetupGenericClient.Command);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v12, type metadata accessor for SKUISetupGenericClient.Command);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = v26;
      v20 = v27;
      v5 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v26, v19, v28);
      v22 = sub_245E0647C();
      v23 = *(void (**)(char *, uint64_t))(v20 + 8);
      v23(v21, v5);
      v24 = v12;
LABEL_9:
      v23(v24, v5);
      sub_245DE9930((uint64_t)v18, type metadata accessor for SKUISetupGenericClient.Command);
      return v22 & 1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
  }
  else
  {
    sub_245DE98EC((uint64_t)v18, (uint64_t)v14, type metadata accessor for SKUISetupGenericClient.Command);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v19, v5);
      v22 = sub_245E0641C();
      v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v8, v5);
      v24 = v14;
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  }
  sub_245DEB574((uint64_t)v18, &qword_25751F898);
  v22 = 0;
  return v22 & 1;
}

unint64_t sub_245DFF8B8()
{
  unint64_t result;

  result = qword_257522548;
  if (!qword_257522548)
  {
    result = MEMORY[0x24954969C](&unk_245E0918C, &type metadata for SKUISetupGenericClient.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522548);
  }
  return result;
}

unint64_t sub_245DFF8FC()
{
  unint64_t result;

  result = qword_257522550;
  if (!qword_257522550)
  {
    result = MEMORY[0x24954969C](&unk_245E0913C, &type metadata for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522550);
  }
  return result;
}

unint64_t sub_245DFF940()
{
  unint64_t result;

  result = qword_257522558;
  if (!qword_257522558)
  {
    result = MEMORY[0x24954969C](&unk_245E090EC, &type metadata for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522558);
  }
  return result;
}

uint64_t sub_245DFF984(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_245DE9848;
  return sub_245DFB208(a1, a2, v7, v2);
}

unint64_t sub_245DFF9E8()
{
  unint64_t result;

  result = qword_25751F398;
  if (!qword_25751F398)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestHandler, &type metadata for SKUISetupGenericClientExternalCommandRequestHandler);
    atomic_store(result, (unint64_t *)&qword_25751F398);
  }
  return result;
}

uint64_t sub_245DFFA2C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DFFA50()
{
  uint64_t v0;

  return sub_245DFB92C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_245DFFA58()
{
  unint64_t result;

  result = qword_25751F3C0;
  if (!qword_25751F3C0)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupConfiguration, &type metadata for SKUIStepAutoUnlockSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_25751F3C0);
  }
  return result;
}

uint64_t sub_245DFFA9C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_245DFFAD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_245DFFB14()
{
  unint64_t result;

  result = qword_25751F3E0;
  if (!qword_25751F3E0)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupReport, &type metadata for SKUIStepAutoUnlockSetupReport);
    atomic_store(result, (unint64_t *)&qword_25751F3E0);
  }
  return result;
}

BOOL _s10SetupKitUI28SKUISetupGenericClientReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t *v37;
  uint64_t v38;
  char v39;
  void (*v40)(char *, uint64_t);
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  char *v52;
  char v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v95 = a2;
  v85 = sub_245E06578();
  v83 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v78 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F830);
  MEMORY[0x24BDAC7A8](v80);
  v84 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v79 = (uint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v81 = (uint64_t)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v82 = (uint64_t)&v77 - v10;
  v91 = sub_245E065E4();
  v89 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v86 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F838);
  MEMORY[0x24BDAC7A8](v88);
  v90 = (uint64_t)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v87 = (uint64_t)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v93 = (uint64_t)&v77 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v92 = (uint64_t)&v77 - v18;
  v19 = sub_245E066A4();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F840);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v77 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v77 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v77 - v33;
  v94 = a1;
  sub_245DFFAD0(a1, (uint64_t)&v77 - v33, &qword_25751F2B0);
  sub_245DFFAD0(v95, (uint64_t)v32, &qword_25751F2B0);
  v35 = (uint64_t)&v25[*(int *)(v23 + 48)];
  sub_245DFFAD0((uint64_t)v34, (uint64_t)v25, &qword_25751F2B0);
  sub_245DFFAD0((uint64_t)v32, v35, &qword_25751F2B0);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48);
  if (v36((uint64_t)v25, 1, v19) == 1)
  {
    sub_245DEB574((uint64_t)v32, &qword_25751F2B0);
    sub_245DEB574((uint64_t)v34, &qword_25751F2B0);
    if (v36(v35, 1, v19) == 1)
    {
      sub_245DEB574((uint64_t)v25, &qword_25751F2B0);
      goto LABEL_8;
    }
LABEL_6:
    v37 = &qword_25751F840;
    v38 = (uint64_t)v25;
LABEL_15:
    sub_245DEB574(v38, v37);
    return 0;
  }
  sub_245DFFAD0((uint64_t)v25, (uint64_t)v29, &qword_25751F2B0);
  if (v36(v35, 1, v19) == 1)
  {
    sub_245DEB574((uint64_t)v32, &qword_25751F2B0);
    sub_245DEB574((uint64_t)v34, &qword_25751F2B0);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v29, v19);
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v22, v35, v19);
  sub_245DE38DC(&qword_25751F860, (uint64_t (*)(uint64_t))MEMORY[0x24BE85AD8], MEMORY[0x24BE85AF0]);
  v39 = sub_245E067C4();
  v40 = *(void (**)(char *, uint64_t))(v20 + 8);
  v40(v22, v19);
  sub_245DEB574((uint64_t)v32, &qword_25751F2B0);
  sub_245DEB574((uint64_t)v34, &qword_25751F2B0);
  v40(v29, v19);
  sub_245DEB574((uint64_t)v25, &qword_25751F2B0);
  if ((v39 & 1) == 0)
    return 0;
LABEL_8:
  v41 = (int *)type metadata accessor for SKUISetupGenericClientReport(0);
  v42 = v92;
  sub_245DFFAD0(v94 + v41[5], v92, &qword_25751F2A8);
  v43 = v95;
  v44 = v93;
  sub_245DFFAD0(v95 + v41[5], v93, &qword_25751F2A8);
  v45 = v90;
  v46 = v90 + *(int *)(v88 + 48);
  sub_245DFFAD0(v42, v90, &qword_25751F2A8);
  sub_245DFFAD0(v44, v46, &qword_25751F2A8);
  v47 = v89;
  v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48);
  v49 = v91;
  if (v48(v45, 1, v91) == 1)
  {
    sub_245DEB574(v44, &qword_25751F2A8);
    sub_245DEB574(v42, &qword_25751F2A8);
    if (v48(v46, 1, v49) == 1)
    {
      sub_245DEB574(v45, &qword_25751F2A8);
      goto LABEL_18;
    }
LABEL_13:
    v37 = &qword_25751F838;
LABEL_14:
    v38 = v45;
    goto LABEL_15;
  }
  v50 = v87;
  sub_245DFFAD0(v45, v87, &qword_25751F2A8);
  if (v48(v46, 1, v49) == 1)
  {
    sub_245DEB574(v93, &qword_25751F2A8);
    sub_245DEB574(v42, &qword_25751F2A8);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v50, v49);
    goto LABEL_13;
  }
  v52 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v86, v46, v49);
  sub_245DE38DC(&qword_25751F858, (uint64_t (*)(uint64_t))MEMORY[0x24BE859D8], MEMORY[0x24BE859F0]);
  v53 = sub_245E067C4();
  v54 = *(void (**)(char *, uint64_t))(v47 + 8);
  v54(v52, v49);
  sub_245DEB574(v93, &qword_25751F2A8);
  sub_245DEB574(v92, &qword_25751F2A8);
  v54((char *)v50, v49);
  sub_245DEB574(v45, &qword_25751F2A8);
  if ((v53 & 1) == 0)
    return 0;
LABEL_18:
  v55 = v41[6];
  v57 = *(_QWORD *)(v94 + v55);
  v56 = *(_QWORD *)(v94 + v55 + 8);
  v59 = *(_QWORD *)(v94 + v55 + 16);
  v58 = *(_QWORD *)(v94 + v55 + 24);
  v60 = (uint64_t *)(v43 + v55);
  v62 = *v60;
  v61 = v60[1];
  v64 = v60[2];
  v63 = v60[3];
  if (v56 == 1)
  {
    if (v61 == 1)
      goto LABEL_25;
LABEL_23:
    sub_245DFFA9C(v62, v61);
    sub_245DFE958(v57, v56);
    sub_245DFE958(v62, v61);
    return 0;
  }
  v100 = v57;
  v101 = v56;
  v102 = v59;
  v103 = v58;
  if (v61 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v96 = v62;
  v97 = v61;
  v98 = v64;
  v99 = v63;
  sub_245E0400C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v65 = sub_245E067C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_245DFE958(v57, v56);
  if ((v65 & 1) == 0)
    return 0;
LABEL_25:
  v66 = v82;
  sub_245DFFAD0(v94 + v41[7], v82, &qword_25751F2B8);
  v67 = v43 + v41[7];
  v68 = v81;
  sub_245DFFAD0(v67, v81, &qword_25751F2B8);
  v45 = v84;
  v69 = v84 + *(int *)(v80 + 48);
  sub_245DFFAD0(v66, v84, &qword_25751F2B8);
  sub_245DFFAD0(v68, v69, &qword_25751F2B8);
  v70 = v83;
  v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48);
  v72 = v85;
  if (v71(v45, 1, v85) != 1)
  {
    v73 = v79;
    sub_245DFFAD0(v45, v79, &qword_25751F2B8);
    if (v71(v69, 1, v72) == 1)
    {
      sub_245DEB574(v68, &qword_25751F2B8);
      sub_245DEB574(v66, &qword_25751F2B8);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v73, v72);
      goto LABEL_30;
    }
    v74 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v78, v69, v72);
    sub_245DE38DC(&qword_25751F848, (uint64_t (*)(uint64_t))MEMORY[0x24BE85938], MEMORY[0x24BE85950]);
    v75 = sub_245E067C4();
    v76 = *(void (**)(char *, uint64_t))(v70 + 8);
    v76(v74, v72);
    sub_245DEB574(v68, &qword_25751F2B8);
    sub_245DEB574(v66, &qword_25751F2B8);
    v76((char *)v73, v72);
    sub_245DEB574(v45, &qword_25751F2B8);
    return (v75 & 1) != 0;
  }
  sub_245DEB574(v68, &qword_25751F2B8);
  sub_245DEB574(v66, &qword_25751F2B8);
  if (v71(v69, 1, v72) != 1)
  {
LABEL_30:
    v37 = &qword_25751F830;
    goto LABEL_14;
  }
  sub_245DEB574(v45, &qword_25751F2B8);
  return 1;
}

unint64_t sub_245E0052C()
{
  unint64_t result;

  result = qword_257522560;
  if (!qword_257522560)
  {
    result = MEMORY[0x24954969C](&unk_245E0909C, &type metadata for SKUISetupGenericClientReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257522560);
  }
  return result;
}

unint64_t sub_245E00570()
{
  unint64_t result;

  result = qword_257522568[0];
  if (!qword_257522568[0])
  {
    result = MEMORY[0x24954969C](&unk_245E0904C, &type metadata for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys);
    atomic_store(result, qword_257522568);
  }
  return result;
}

uint64_t sub_245E005B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_245E005F8()
{
  return sub_245DE38DC(&qword_25751F458, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestMessage);
}

uint64_t sub_245E00624()
{
  return sub_245DE38DC(&qword_25751F460, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestMessage);
}

uint64_t sub_245E00654()
{
  return sub_245DE38DC(&qword_25751F310, type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage, (uint64_t)&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestMessage);
}

uint64_t sub_245E00680()
{
  return type metadata accessor for SKUISetupGenericClient(0);
}

uint64_t sub_245E00688()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for SKUISetupGenericClientConfiguration(319);
  if (v1 <= 0x3F)
  {
    result = sub_245E0665C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SKUISetupGenericClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUISetupGenericClient.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericClient.Command(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_245E007FC(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t destroy for SKUISetupGenericClient.Command(uint64_t a1, uint64_t a2)
{
  return sub_245E008F0(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t initializeWithCopy for SKUISetupGenericClient.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00954(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t assignWithCopy for SKUISetupGenericClient.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E009F8(a1, a2, a3, type metadata accessor for SKUISetupGenericClient.Command, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t initializeWithTake for SKUISetupGenericClient.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00AA8(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t assignWithTake for SKUISetupGenericClient.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00B4C(a1, a2, a3, type metadata accessor for SKUISetupGenericClient.Command, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D8C0], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D990]);
}

uint64_t sub_245E007D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00BFC(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D8C0], (uint64_t (*)(uint64_t))MEMORY[0x24BE6D990]);
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericClient.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_245E007FC(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t *sub_245E007FC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD))
{
  int v7;
  uint64_t v10;
  uint64_t v11;

  v7 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v10 = a5(0);
    else
      v10 = a4(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericClient.Event(uint64_t a1, uint64_t a2)
{
  return sub_245E008F0(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E008F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
    v7 = a4(0);
  else
    v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
}

uint64_t initializeWithCopy for SKUISetupGenericClient.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00954(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E00954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD))
{
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload() == 1)
    v9 = a5(0);
  else
    v9 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SKUISetupGenericClient.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E009F8(a1, a2, a3, type metadata accessor for SKUISetupGenericClient.Event, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E009F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD))
{
  uint64_t v10;

  if (a1 != a2)
  {
    sub_245DE9930(a1, a4);
    if (swift_getEnumCaseMultiPayload() == 1)
      v10 = a6(0);
    else
      v10 = a5(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for SKUISetupGenericClient.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00AA8(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E00AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD))
{
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload() == 1)
    v9 = a5(0);
  else
    v9 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for SKUISetupGenericClient.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00B4C(a1, a2, a3, type metadata accessor for SKUISetupGenericClient.Event, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D930], (uint64_t (*)(_QWORD))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E00B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD))
{
  uint64_t v10;

  if (a1 != a2)
  {
    sub_245DE9930(a1, a4);
    if (swift_getEnumCaseMultiPayload() == 1)
      v10 = a6(0);
    else
      v10 = a5(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_245E00BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245E00BFC(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D930], (uint64_t (*)(uint64_t))MEMORY[0x24BE6D970]);
}

uint64_t sub_245E00BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = a4(319);
  if (v7 <= 0x3F)
  {
    result = a5(319);
    if (v8 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericClientConfiguration(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  id v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245E06710();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_245E065B4();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    v17 = a3[6];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *((_QWORD *)v19 + 1);
    if (v20 == 1)
    {
      v21 = *((_OWORD *)v19 + 1);
      *(_OWORD *)v18 = *(_OWORD *)v19;
      *((_OWORD *)v18 + 1) = v21;
      *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
      *((_QWORD *)v18 + 6) = *((_QWORD *)v19 + 6);
    }
    else
    {
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *((_QWORD *)v18 + 1) = v20;
      v22 = *((_QWORD *)v19 + 3);
      *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
      *((_QWORD *)v18 + 3) = v22;
      v23 = (void *)*((_QWORD *)v19 + 4);
      v24 = (void *)*((_QWORD *)v19 + 5);
      *((_QWORD *)v18 + 4) = v23;
      *((_QWORD *)v18 + 5) = v24;
      v25 = (void *)*((_QWORD *)v19 + 6);
      *((_QWORD *)v18 + 6) = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v26 = v23;
      v27 = v24;
      v28 = v25;
    }
    v29 = a3[7];
    v30 = a3[8];
    v31 = *(void **)((char *)a2 + v29);
    *(uint64_t *)((char *)a1 + v29) = (uint64_t)v31;
    v32 = (char *)a1 + v30;
    v33 = (char *)a2 + v30;
    v34 = sub_245E06668();
    v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    v36 = v31;
    v35(v32, v33, v34);
    v37 = a3[9];
    v38 = (char *)a1 + v37;
    v39 = (char *)a2 + v37;
    v40 = sub_245E06548();
    v41 = *(_QWORD *)(v40 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
    {
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
      memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
    }
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericClientConfiguration(uint64_t a1, int *a2)
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
  uint64_t result;

  v4 = sub_245E06710();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + a2[5];
  v7 = sub_245E065B4();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v9 = a1 + a2[6];
  if (*(_QWORD *)(v9 + 8) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v10 = a1 + a2[8];
  v11 = sub_245E06668();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = a1 + a2[9];
  v13 = sub_245E06548();
  v14 = *(_QWORD *)(v13 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  return result;
}

char *initializeWithCopy for SKUISetupGenericClientConfiguration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  id v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v6 = sub_245E06710();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_245E065B4();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *((_QWORD *)v17 + 1);
  if (v18 == 1)
  {
    v19 = *((_OWORD *)v17 + 1);
    *(_OWORD *)v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v19;
    *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
    *((_QWORD *)v16 + 6) = *((_QWORD *)v17 + 6);
  }
  else
  {
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    v20 = *((_QWORD *)v17 + 3);
    *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
    *((_QWORD *)v16 + 3) = v20;
    v21 = (void *)*((_QWORD *)v17 + 4);
    v22 = (void *)*((_QWORD *)v17 + 5);
    *((_QWORD *)v16 + 4) = v21;
    *((_QWORD *)v16 + 5) = v22;
    v23 = (void *)*((_QWORD *)v17 + 6);
    *((_QWORD *)v16 + 6) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = v21;
    v25 = v22;
    v26 = v23;
  }
  v27 = a3[7];
  v28 = a3[8];
  v29 = *(void **)&a2[v27];
  *(_QWORD *)&a1[v27] = v29;
  v30 = &a1[v28];
  v31 = &a2[v28];
  v32 = sub_245E06668();
  v33 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
  v34 = v29;
  v33(v30, v31, v32);
  v35 = a3[9];
  v36 = &a1[v35];
  v37 = &a2[v35];
  v38 = sub_245E06548();
  v39 = *(_QWORD *)(v38 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
  {
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
  }
  return a1;
}

char *assignWithCopy for SKUISetupGenericClientConfiguration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(char *, uint64_t, uint64_t);
  int v61;
  uint64_t v62;

  v6 = sub_245E06710();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_245E065B4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_13:
  v21 = a3[6];
  v22 = (uint64_t)&a1[v21];
  v23 = &a2[v21];
  v24 = *(_QWORD *)&a1[v21 + 8];
  v25 = *(_QWORD *)&a2[v21 + 8];
  if (v24 == 1)
  {
    if (v25 == 1)
    {
      v26 = *(_OWORD *)v23;
      v27 = *((_OWORD *)v23 + 1);
      v28 = *((_OWORD *)v23 + 2);
      *(_QWORD *)(v22 + 48) = *((_QWORD *)v23 + 6);
      *(_OWORD *)(v22 + 16) = v27;
      *(_OWORD *)(v22 + 32) = v28;
      *(_OWORD *)v22 = v26;
    }
    else
    {
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *(_QWORD *)(v22 + 8) = *((_QWORD *)v23 + 1);
      *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
      *(_QWORD *)(v22 + 24) = *((_QWORD *)v23 + 3);
      v32 = (void *)*((_QWORD *)v23 + 4);
      *(_QWORD *)(v22 + 32) = v32;
      v33 = (void *)*((_QWORD *)v23 + 5);
      *(_QWORD *)(v22 + 40) = v33;
      v34 = (void *)*((_QWORD *)v23 + 6);
      *(_QWORD *)(v22 + 48) = v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v35 = v32;
      v36 = v33;
      v37 = v34;
    }
  }
  else if (v25 == 1)
  {
    sub_245E016EC(v22);
    v30 = *((_OWORD *)v23 + 1);
    v29 = *((_OWORD *)v23 + 2);
    v31 = *(_OWORD *)v23;
    *(_QWORD *)(v22 + 48) = *((_QWORD *)v23 + 6);
    *(_OWORD *)(v22 + 16) = v30;
    *(_OWORD *)(v22 + 32) = v29;
    *(_OWORD *)v22 = v31;
  }
  else
  {
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *(_QWORD *)(v22 + 8) = *((_QWORD *)v23 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
    *(_QWORD *)(v22 + 24) = *((_QWORD *)v23 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v38 = *(void **)(v22 + 32);
    v39 = (void *)*((_QWORD *)v23 + 4);
    *(_QWORD *)(v22 + 32) = v39;
    v40 = v39;

    v41 = *(void **)(v22 + 40);
    v42 = (void *)*((_QWORD *)v23 + 5);
    *(_QWORD *)(v22 + 40) = v42;
    v43 = v42;

    v44 = *(void **)(v22 + 48);
    v45 = (void *)*((_QWORD *)v23 + 6);
    *(_QWORD *)(v22 + 48) = v45;
    v46 = v45;

  }
  v47 = a3[7];
  v48 = *(void **)&a1[v47];
  v49 = *(void **)&a2[v47];
  *(_QWORD *)&a1[v47] = v49;
  v50 = v49;

  v51 = a3[8];
  v52 = &a1[v51];
  v53 = &a2[v51];
  v54 = sub_245E06668();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 24))(v52, v53, v54);
  v55 = a3[9];
  v56 = &a1[v55];
  v57 = &a2[v55];
  v58 = sub_245E06548();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 48);
  LODWORD(v53) = v60(v56, 1, v58);
  v61 = v60(v57, 1, v58);
  if (!(_DWORD)v53)
  {
    if (!v61)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 24))(v56, v57, v58);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v56, v58);
    goto LABEL_25;
  }
  if (v61)
  {
LABEL_25:
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v56, v57, v58);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  return a1;
}

uint64_t sub_245E016EC(uint64_t a1)
{
  destroy for SKUIStepAutoUnlockSetupConfiguration();
  return a1;
}

char *initializeWithTake for SKUISetupGenericClientConfiguration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_245E06710();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_245E065B4();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = a3[7];
  v17 = &a1[v15];
  v18 = &a2[v15];
  v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  v20 = *((_OWORD *)v18 + 2);
  *((_QWORD *)v17 + 6) = *((_QWORD *)v18 + 6);
  v21 = *(_QWORD *)&a2[v16];
  *((_OWORD *)v17 + 2) = v20;
  *(_QWORD *)&a1[v16] = v21;
  v22 = a3[8];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = sub_245E06668();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
  v26 = a3[9];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = sub_245E06548();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  return a1;
}

char *assignWithTake for SKUISetupGenericClientConfiguration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  int v42;
  uint64_t v43;

  v6 = sub_245E06710();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_245E065B4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_13:
  v21 = a3[6];
  v22 = (uint64_t)&a1[v21];
  v23 = &a2[v21];
  if (*(_QWORD *)&a1[v21 + 8] == 1)
  {
LABEL_16:
    v25 = *((_OWORD *)v23 + 1);
    *(_OWORD *)v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + 16) = v25;
    *(_OWORD *)(v22 + 32) = *((_OWORD *)v23 + 2);
    *(_QWORD *)(v22 + 48) = *((_QWORD *)v23 + 6);
    goto LABEL_18;
  }
  v24 = *((_QWORD *)v23 + 1);
  if (v24 == 1)
  {
    sub_245E016EC(v22);
    goto LABEL_16;
  }
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_QWORD *)(v22 + 8) = v24;
  swift_bridgeObjectRelease();
  v26 = *((_QWORD *)v23 + 3);
  *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
  *(_QWORD *)(v22 + 24) = v26;
  swift_bridgeObjectRelease();
  v27 = *(void **)(v22 + 32);
  *(_QWORD *)(v22 + 32) = *((_QWORD *)v23 + 4);

  v28 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = *((_QWORD *)v23 + 5);

  v29 = *(void **)(v22 + 48);
  *(_QWORD *)(v22 + 48) = *((_QWORD *)v23 + 6);

LABEL_18:
  v30 = a3[7];
  v31 = *(void **)&a1[v30];
  *(_QWORD *)&a1[v30] = *(_QWORD *)&a2[v30];

  v32 = a3[8];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = sub_245E06668();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
  v36 = a3[9];
  v37 = &a1[v36];
  v38 = &a2[v36];
  v39 = sub_245E06548();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  LODWORD(v34) = v41(v37, 1, v39);
  v42 = v41(v38, 1, v39);
  if (!(_DWORD)v34)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v37, v38, v39);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    goto LABEL_23;
  }
  if (v42)
  {
LABEL_23:
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v37, v38, v39);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericClientConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E01CAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v15 = sub_245E06668();
    v10 = *(_QWORD *)(v15 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v15;
      v12 = a3[8];
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = a3[9];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClientConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E01DC0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F290);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F298);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[7]) = a2;
        return result;
      }
      v16 = sub_245E06668();
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[8];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F288);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[9];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_245E01EB8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_245E02FE4(319, &qword_25751F6B0, (void (*)(uint64_t))MEMORY[0x24BE85B78]);
  if (v0 <= 0x3F)
  {
    sub_245E02FE4(319, &qword_25751F6B8, (void (*)(uint64_t))MEMORY[0x24BE859A0]);
    if (v1 <= 0x3F)
    {
      sub_245E06668();
      if (v2 <= 0x3F)
      {
        sub_245E02FE4(319, qword_25751F6C0, (void (*)(uint64_t))MEMORY[0x24BE85908]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericClientReport(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245E066A4();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_245E065E4();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    v17 = a3[6];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *((_QWORD *)v19 + 1);
    if (v20 == 1)
    {
      v21 = *((_OWORD *)v19 + 1);
      *(_OWORD *)v18 = *(_OWORD *)v19;
      *((_OWORD *)v18 + 1) = v21;
    }
    else
    {
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *((_QWORD *)v18 + 1) = v20;
      v22 = *((_QWORD *)v19 + 3);
      *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
      *((_QWORD *)v18 + 3) = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v23 = a3[7];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = sub_245E06578();
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericClientReport(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v4 = sub_245E066A4();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + a2[5];
  v7 = sub_245E065E4();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  if (*(_QWORD *)(a1 + a2[6] + 8) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v9 = a1 + a2[7];
  v10 = sub_245E06578();
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  return result;
}

char *initializeWithCopy for SKUISetupGenericClientReport(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_245E066A4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_245E065E4();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *((_QWORD *)v17 + 1);
  if (v18 == 1)
  {
    v19 = *((_OWORD *)v17 + 1);
    *(_OWORD *)v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v19;
  }
  else
  {
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    v20 = *((_QWORD *)v17 + 3);
    *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
    *((_QWORD *)v16 + 3) = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = sub_245E06578();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

char *assignWithCopy for SKUISetupGenericClientReport(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  int v35;
  uint64_t v36;

  v6 = sub_245E066A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_245E065E4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_13:
  v21 = a3[6];
  v22 = (uint64_t)&a1[v21];
  v23 = &a2[v21];
  v24 = *(_QWORD *)&a1[v21 + 8];
  v25 = *(_QWORD *)&a2[v21 + 8];
  if (v24 == 1)
  {
    if (v25 == 1)
    {
      v26 = *((_OWORD *)v23 + 1);
      *(_OWORD *)v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + 16) = v26;
    }
    else
    {
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *(_QWORD *)(v22 + 8) = *((_QWORD *)v23 + 1);
      *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
      *(_QWORD *)(v22 + 24) = *((_QWORD *)v23 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v25 == 1)
  {
    sub_245E02848(v22);
    v27 = *((_OWORD *)v23 + 1);
    *(_OWORD *)v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + 16) = v27;
  }
  else
  {
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *(_QWORD *)(v22 + 8) = *((_QWORD *)v23 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
    *(_QWORD *)(v22 + 24) = *((_QWORD *)v23 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v28 = a3[7];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = sub_245E06578();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 24))(v29, v30, v31);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v31);
    goto LABEL_25;
  }
  if (v35)
  {
LABEL_25:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  return a1;
}

uint64_t sub_245E02848(uint64_t a1)
{
  destroy for SKUIStepAutoUnlockSetupReport();
  return a1;
}

char *initializeWithTake for SKUISetupGenericClientReport(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_245E066A4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_245E065E4();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = a3[7];
  v17 = &a1[v15];
  v18 = &a2[v15];
  v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  v20 = &a1[v16];
  v21 = &a2[v16];
  v22 = sub_245E06578();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *assignWithTake for SKUISetupGenericClientReport(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;

  v6 = sub_245E066A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_245E065E4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_13:
  v21 = a3[6];
  v22 = (uint64_t)&a1[v21];
  v23 = &a2[v21];
  if (*(_QWORD *)&a1[v21 + 8] == 1)
  {
LABEL_16:
    v25 = *((_OWORD *)v23 + 1);
    *(_OWORD *)v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + 16) = v25;
    goto LABEL_18;
  }
  v24 = *((_QWORD *)v23 + 1);
  if (v24 == 1)
  {
    sub_245E02848(v22);
    goto LABEL_16;
  }
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_QWORD *)(v22 + 8) = v24;
  swift_bridgeObjectRelease();
  v26 = *((_QWORD *)v23 + 3);
  *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
  *(_QWORD *)(v22 + 24) = v26;
  swift_bridgeObjectRelease();
LABEL_18:
  v27 = a3[7];
  v28 = &a1[v27];
  v29 = &a2[v27];
  v30 = sub_245E06578();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v28, v29, v30);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_23;
  }
  if (v34)
  {
LABEL_23:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericClientReport()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E02D40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 2147483645)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[7];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return ((_DWORD)v14 - 1) & ~(((int)v14 - 1) >> 31);
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClientReport()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E02E30(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2A8);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483645)
      {
        *(_QWORD *)(a1 + a4[6] + 8) = (a2 + 1);
        return result;
      }
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751F2B8);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_245E02F0C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_245E02FE4(319, &qword_25751F758, (void (*)(uint64_t))MEMORY[0x24BE85AD8]);
  if (v0 <= 0x3F)
  {
    sub_245E02FE4(319, &qword_25751F760, (void (*)(uint64_t))MEMORY[0x24BE859D8]);
    if (v1 <= 0x3F)
    {
      sub_245E02FE4(319, qword_25751F768, (void (*)(uint64_t))MEMORY[0x24BE85938]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_245E02FE4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_245E06908();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t *a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_DWORD *)(*(_QWORD *)(type metadata accessor for SKUISetupGenericClient.Command(0) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v5 = sub_245E06488();
    else
      v5 = sub_245E06428();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for SKUISetupGenericClient.Command(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    v2 = sub_245E06488();
  else
    v2 = sub_245E06428();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  type metadata accessor for SKUISetupGenericClient.Command(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_245E06488();
  else
    v4 = sub_245E06428();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_245DE9930(a1, type metadata accessor for SKUISetupGenericClient.Command);
    type metadata accessor for SKUISetupGenericClient.Command(0);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_245E06488();
    else
      v4 = sub_245E06428();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  type metadata accessor for SKUISetupGenericClient.Command(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_245E06488();
  else
    v4 = sub_245E06428();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for SKUISetupGenericClientExternalCommandRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_245DE9930(a1, type metadata accessor for SKUISetupGenericClient.Command);
    type metadata accessor for SKUISetupGenericClient.Command(0);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_245E06488();
    else
      v4 = sub_245E06428();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericClientExternalCommandRequestMessage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E033F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKUISetupGenericClient.Command(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClientExternalCommandRequestMessage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E03438(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKUISetupGenericClient.Command(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_245E03478()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SKUISetupGenericClient.Command(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClientExternalCommandRequestHandler()
{
  return &type metadata for SKUISetupGenericClientExternalCommandRequestHandler;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys()
{
  return &type metadata for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SKUISetupGenericClientReport.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClientReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E035E0 + 4 * byte_245E08749[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_245E03614 + 4 * byte_245E08744[v4]))();
}

uint64_t sub_245E03614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E0361C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E03624);
  return result;
}

uint64_t sub_245E03630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E03638);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_245E0363C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E03644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClientReport.CodingKeys()
{
  return &type metadata for SKUISetupGenericClientReport.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SKUISetupGenericClient.Command.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E036AC + 4 * byte_245E08753[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E036E0 + 4 * byte_245E0874E[v4]))();
}

uint64_t sub_245E036E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E036E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E036F0);
  return result;
}

uint64_t sub_245E036FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E03704);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E03708(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E03710(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClient.Command.CodingKeys()
{
  return &type metadata for SKUISetupGenericClient.Command.CodingKeys;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys()
{
  return &type metadata for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys;
}

uint64_t _s10SetupKitUI51SKUISetupGenericClientExternalCommandRequestMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245E0377C + 4 * byte_245E08758[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245E0379C + 4 * byte_245E0875D[v4]))();
}

_BYTE *sub_245E0377C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245E0379C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E037A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E037AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E037B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E037BC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys()
{
  return &type metadata for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys;
}

unint64_t sub_245E037DC()
{
  unint64_t result;

  result = qword_257522FD0[0];
  if (!qword_257522FD0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08D44, &type metadata for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys);
    atomic_store(result, qword_257522FD0);
  }
  return result;
}

unint64_t sub_245E03824()
{
  unint64_t result;

  result = qword_2575231E0[0];
  if (!qword_2575231E0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08DFC, &type metadata for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys);
    atomic_store(result, qword_2575231E0);
  }
  return result;
}

unint64_t sub_245E0386C()
{
  unint64_t result;

  result = qword_2575233F0[0];
  if (!qword_2575233F0[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08EB4, &type metadata for SKUISetupGenericClient.Command.CodingKeys);
    atomic_store(result, qword_2575233F0);
  }
  return result;
}

unint64_t sub_245E038B4()
{
  unint64_t result;

  result = qword_257523600[0];
  if (!qword_257523600[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08F6C, &type metadata for SKUISetupGenericClientReport.CodingKeys);
    atomic_store(result, qword_257523600);
  }
  return result;
}

unint64_t sub_245E038FC()
{
  unint64_t result;

  result = qword_257523810[0];
  if (!qword_257523810[0])
  {
    result = MEMORY[0x24954969C](&unk_245E09024, &type metadata for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys);
    atomic_store(result, qword_257523810);
  }
  return result;
}

unint64_t sub_245E03944()
{
  unint64_t result;

  result = qword_257523920;
  if (!qword_257523920)
  {
    result = MEMORY[0x24954969C](&unk_245E08F94, &type metadata for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257523920);
  }
  return result;
}

unint64_t sub_245E0398C()
{
  unint64_t result;

  result = qword_257523928[0];
  if (!qword_257523928[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08FBC, &type metadata for SKUISetupGenericClientExternalCommandRequestMessage.CodingKeys);
    atomic_store(result, qword_257523928);
  }
  return result;
}

unint64_t sub_245E039D4()
{
  unint64_t result;

  result = qword_2575239B0;
  if (!qword_2575239B0)
  {
    result = MEMORY[0x24954969C](&unk_245E08EDC, &type metadata for SKUISetupGenericClientReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575239B0);
  }
  return result;
}

unint64_t sub_245E03A1C()
{
  unint64_t result;

  result = qword_2575239B8[0];
  if (!qword_2575239B8[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08F04, &type metadata for SKUISetupGenericClientReport.CodingKeys);
    atomic_store(result, qword_2575239B8);
  }
  return result;
}

unint64_t sub_245E03A64()
{
  unint64_t result;

  result = qword_257523A40;
  if (!qword_257523A40)
  {
    result = MEMORY[0x24954969C](&unk_245E08D6C, &type metadata for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257523A40);
  }
  return result;
}

unint64_t sub_245E03AAC()
{
  unint64_t result;

  result = qword_257523A48[0];
  if (!qword_257523A48[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08D94, &type metadata for SKUISetupGenericClient.Command.AuthenticationAttemptCodingKeys);
    atomic_store(result, qword_257523A48);
  }
  return result;
}

unint64_t sub_245E03AF4()
{
  unint64_t result;

  result = qword_257523AD0;
  if (!qword_257523AD0)
  {
    result = MEMORY[0x24954969C](&unk_245E08CB4, &type metadata for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257523AD0);
  }
  return result;
}

unint64_t sub_245E03B3C()
{
  unint64_t result;

  result = qword_257523AD8[0];
  if (!qword_257523AD8[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08CDC, &type metadata for SKUISetupGenericClient.Command.AuthenticationConfigureCodingKeys);
    atomic_store(result, qword_257523AD8);
  }
  return result;
}

unint64_t sub_245E03B84()
{
  unint64_t result;

  result = qword_257523B60;
  if (!qword_257523B60)
  {
    result = MEMORY[0x24954969C](&unk_245E08E24, &type metadata for SKUISetupGenericClient.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257523B60);
  }
  return result;
}

unint64_t sub_245E03BCC()
{
  unint64_t result;

  result = qword_257523B68[0];
  if (!qword_257523B68[0])
  {
    result = MEMORY[0x24954969C](&unk_245E08E4C, &type metadata for SKUISetupGenericClient.Command.CodingKeys);
    atomic_store(result, qword_257523B68);
  }
  return result;
}

uint64_t sub_245E03C10()
{
  return 12383;
}

uint64_t sub_245E03C1C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_245E06A64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245E03C88(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x8000000245E0A700 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000245E0A720)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_245E06A64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_245E03D70(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000245E0A740 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000245E0A760 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000245E0A780 || (sub_245E06A64() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7574655369666977 && a2 == 0xEF74726F70655270)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_245E06A64();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_245E03F2C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_245E06A64();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245E03FB0()
{
  return 0x646E616D6D6F63;
}

unint64_t sub_245E03FC8()
{
  unint64_t result;

  result = qword_25751F820;
  if (!qword_25751F820)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUISetupGenericClientExternalCommandRequestHandler, &type metadata for SKUISetupGenericClientExternalCommandRequestHandler);
    atomic_store(result, (unint64_t *)&qword_25751F820);
  }
  return result;
}

unint64_t sub_245E0400C()
{
  unint64_t result;

  result = qword_25751F850;
  if (!qword_25751F850)
  {
    result = MEMORY[0x24954969C](&protocol conformance descriptor for SKUIStepAutoUnlockSetupReport, &type metadata for SKUIStepAutoUnlockSetupReport);
    atomic_store(result, (unint64_t *)&qword_25751F850);
  }
  return result;
}

uint64_t sub_245E04050()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E0407C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_245DEB5B0;
  v6[6] = v5;
  v6[7] = v4;
  v6[5] = a1;
  return swift_task_switch();
}

uint64_t sub_245E040EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E04110(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245DEB5B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25751F8A0 + dword_25751F8A0))(a1, v4);
}

uint64_t sub_245E04190()
{
  uint64_t v0;

  v0 = sub_245E0632C();
  __swift_allocate_value_buffer(v0, qword_257523BF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257523BF8);
  sub_245E06620();
  return sub_245E06320();
}

uint64_t SKUIStepAutoUnlockSetupClient.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = swift_allocObject();
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  return v3;
}

uint64_t SKUIStepAutoUnlockSetupClient.init(client:environment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  swift_weakInit();
  swift_weakAssign();
  swift_release();
  v4 = v2 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v5 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
  return v2;
}

uint64_t SKUIStepAutoUnlockSetupClient.perform(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  *(_QWORD *)(v3 + 248) = a1;
  *(_QWORD *)(v3 + 256) = v2;
  v5 = sub_245E0662C();
  *(_QWORD *)(v3 + 264) = v5;
  *(_QWORD *)(v3 + 272) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 280) = swift_task_alloc();
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  v6 = sub_245E06404();
  *(_QWORD *)(v3 + 296) = v6;
  *(_QWORD *)(v3 + 304) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 320) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 336) = v7;
  *(_OWORD *)(v3 + 352) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v3 + 368) = *(_QWORD *)(a2 + 48);
  sub_245DE38DC(&qword_25751F8D0, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupClient, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupClient);
  *(_QWORD *)(v3 + 376) = sub_245E0680C();
  *(_QWORD *)(v3 + 384) = v8;
  return swift_task_switch();
}

uint64_t sub_245E04438()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[3];
  uint64_t v31;
  _OWORD v32[3];
  uint64_t v33;

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 392) = Strong;
  if (Strong)
  {
    if (qword_257523BF0 != -1)
      swift_once();
    v3 = *(void **)(v0 + 360);
    v2 = *(void **)(v0 + 368);
    v4 = *(void **)(v0 + 352);
    v5 = sub_245E0632C();
    *(_QWORD *)(v0 + 400) = __swift_project_value_buffer(v5, (uint64_t)qword_257523BF8);
    v6 = v2;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v7 = v4;
    v8 = v3;
    v9 = v6;
    v10 = v7;
    v11 = v8;
    v12 = sub_245E06314();
    v13 = sub_245E068E4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = v10;
      v15 = *(_QWORD *)(v0 + 368);
      v27 = *(_OWORD *)(v0 + 336);
      v28 = *(_OWORD *)(v0 + 352);
      v26 = *(_OWORD *)(v0 + 320);
      v16 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      *(_DWORD *)v16 = 136315138;
      *(_QWORD *)&v32[0] = v29;
      *(_OWORD *)(v0 + 72) = v26;
      *(_OWORD *)(v0 + 88) = v27;
      *(_OWORD *)(v0 + 104) = v28;
      *(_QWORD *)(v0 + 120) = v15;
      v10 = v14;
      sub_245DFFA58();
      v17 = sub_245E06A4C();
      *(_QWORD *)(v0 + 240) = sub_245DE3004(v17, v18, (uint64_t *)v32);
      sub_245E06914();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      _os_log_impl(&dword_245DDF000, v12, v13, "AutoUnlockSetup start: configuration=%s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v29, -1, -1);
      MEMORY[0x24954972C](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

    }
    v20 = *(_QWORD *)(v0 + 368);
    v21 = *(_OWORD *)(v0 + 336);
    v32[0] = *(_OWORD *)(v0 + 320);
    v32[1] = v21;
    v32[2] = *(_OWORD *)(v0 + 352);
    v33 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22 = v10;
    v23 = v11;
    v24 = v9;
    sub_245DEF3B0((uint64_t)v32, (uint64_t)v30);
    v25 = v30[1];
    *(_OWORD *)(v0 + 408) = v30[0];
    *(_OWORD *)(v0 + 424) = v25;
    *(_OWORD *)(v0 + 440) = v30[2];
    *(_QWORD *)(v0 + 456) = v31;
    sub_245E06770();
    sub_245DE38DC(&qword_25751EA30, (uint64_t (*)(uint64_t))MEMORY[0x24BE85C08], MEMORY[0x24BE85C18]);
    sub_245E0680C();
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 104))(*(_QWORD *)(v0 + 280), *MEMORY[0x24BE85A48], *(_QWORD *)(v0 + 264));
    sub_245E0671C();
    sub_245E06728();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245E0485C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 456);
  v5 = *(_OWORD *)(v0 + 424);
  v6 = *(_OWORD *)(v0 + 440);
  v4 = *(_OWORD *)(v0 + 408);
  *(_QWORD *)(v0 + 464) = sub_245E06734();
  *(_OWORD *)(v0 + 16) = v4;
  *(_OWORD *)(v0 + 32) = v5;
  *(_OWORD *)(v0 + 48) = v6;
  *(_QWORD *)(v0 + 64) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 472) = v2;
  sub_245DF0248();
  *v2 = v0;
  v2[1] = sub_245E04918;
  return sub_245E0650C();
}

uint64_t sub_245E04918()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 480) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[38] + 8))(v2[39], v2[37]);
  return swift_task_switch();
}

uint64_t sub_245E0498C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  void *v21;
  void *v22;
  uint64_t v23;

  v1 = *(void **)(v0 + 352);
  if (v1)
  {
    v2 = *(void **)(v0 + 440);
    v21 = *(void **)(v0 + 448);
    v22 = *(void **)(v0 + 456);
    v3 = *(_QWORD *)(v0 + 288);
    v4 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 272);
    sub_245E0671C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v3, *MEMORY[0x24BE85A50], v4);
    v6 = v1;
    v7 = (void *)sub_245E06728();
    swift_willThrow();

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v8 = v7;
    v9 = v7;
    v10 = sub_245E06314();
    v11 = sub_245E068D8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v23 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue();
      v14 = sub_245E06A94();
      *(_QWORD *)(v0 + 216) = sub_245DE3004(v14, v15, &v23);
      sub_245E06914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245DDF000, v10, v11, "### AutoUnlockSetup failed: error=%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954972C](v13, -1, -1);
      MEMORY[0x24954972C](v12, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v16 = sub_245E06314();
    v17 = sub_245E068E4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_245DDF000, v16, v17, "AutoUnlockSetup finish", v18, 2u);
      MEMORY[0x24954972C](v18, -1, -1);
    }

    nullsub_1();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v19;
    sub_245DF03F8();
    *v19 = v0;
    v19[1] = sub_245E04CE8;
    return sub_245E0650C();
  }
}

uint64_t sub_245E04CE8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 496) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E04D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 152);
  v18 = *(_QWORD *)(v0 + 144);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v4 = sub_245E06314();
  v5 = sub_245E068E4();
  v17 = v2;
  if (os_log_type_enabled(v4, v5))
  {
    v15 = *(void **)(v0 + 448);
    v16 = *(void **)(v0 + 456);
    v14 = *(void **)(v0 + 440);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v19 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 160) = v2;
    *(_QWORD *)(v0 + 168) = v1;
    *(_QWORD *)(v0 + 176) = v18;
    *(_QWORD *)(v0 + 184) = v3;
    sub_245DFFB14();
    v8 = sub_245E06A4C();
    *(_QWORD *)(v0 + 224) = sub_245DE3004(v8, v9, &v19);
    sub_245E06914();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245DDF000, v4, v5, "AutoUnlockSetup success: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v7, -1, -1);
    MEMORY[0x24954972C](v6, -1, -1);
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v16 = *(void **)(v0 + 456);
    v10 = *(void **)(v0 + 440);
    v11 = *(void **)(v0 + 448);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v12 = *(_QWORD **)(v0 + 248);
  *v12 = v17;
  v12[1] = v1;
  v12[2] = v18;
  v12[3] = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E04FE0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 456);
  v3 = *(void **)(v0 + 440);
  v2 = *(void **)(v0 + 448);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = *(void **)(v0 + 480);
  v5 = v4;
  v6 = v4;
  v7 = sub_245E06314();
  v8 = sub_245E068D8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245E06A94();
    *(_QWORD *)(v0 + 216) = sub_245DE3004(v11, v12, &v14);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v7, v8, "### AutoUnlockSetup failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v10, -1, -1);
    MEMORY[0x24954972C](v9, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E051D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 456);
  v3 = *(void **)(v0 + 440);
  v2 = *(void **)(v0 + 448);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = *(void **)(v0 + 496);
  v5 = v4;
  v6 = v4;
  v7 = sub_245E06314();
  v8 = sub_245E068D8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245E06A94();
    *(_QWORD *)(v0 + 216) = sub_245DE3004(v11, v12, &v14);
    sub_245E06914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245DDF000, v7, v8, "### AutoUnlockSetup failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954972C](v10, -1, -1);
    MEMORY[0x24954972C](v9, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SKUIStepAutoUnlockSetupClient()
{
  uint64_t result;

  result = qword_257523D20;
  if (!qword_257523D20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SKUIStepAutoUnlockSetupClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_weakDestroy();
  return v0;
}

uint64_t SKUIStepAutoUnlockSetupClient.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v2 = sub_245E0665C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_245E054C0()
{
  sub_245DE38DC(&qword_25751F980, (uint64_t (*)(uint64_t))type metadata accessor for SKUIStepAutoUnlockSetupClient, (uint64_t)&protocol conformance descriptor for SKUIStepAutoUnlockSetupClient);
  return sub_245E06638();
}

uint64_t sub_245E05510@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC10SetupKitUI29SKUIStepAutoUnlockSetupClient_environment;
  v4 = sub_245E0665C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_245E05558()
{
  return type metadata accessor for SKUIStepAutoUnlockSetupClient();
}

uint64_t sub_245E05560()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245E0665C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SKUIStepAutoUnlockSetupClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKUIStepAutoUnlockSetupClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_245E059D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id logger()
{
  if (sCUOSLogCreateOnce_logger != -1)
    dispatch_once(&sCUOSLogCreateOnce_logger, &__block_literal_global);
  return (id)sCUOSLogHandle_logger;
}

void __logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SetupKit", "SKUIHMDeviceSetup");
  v1 = (void *)sCUOSLogHandle_logger;
  sCUOSLogHandle_logger = (uint64_t)v0;

}

id TROperationQueueFunction()
{
  return (id)classTROperationQueue;
}

Class initTROperationQueue()
{
  Class result;

  if (TouchRemoteLibrary_sOnce != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_42);
  result = objc_getClass("TROperationQueue");
  classTROperationQueue = (uint64_t)result;
  getTROperationQueueClass = (uint64_t (*)())TROperationQueueFunction;
  return result;
}

uint64_t sub_245E06290()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t sub_245E0629C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_245E062A8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245E062B4()
{
  return MEMORY[0x24BE29C70]();
}

uint64_t sub_245E062C0()
{
  return MEMORY[0x24BE29C88]();
}

uint64_t sub_245E062CC()
{
  return MEMORY[0x24BE29CC0]();
}

uint64_t sub_245E062D8()
{
  return MEMORY[0x24BE29CD8]();
}

uint64_t sub_245E062E4()
{
  return MEMORY[0x24BE29D00]();
}

uint64_t sub_245E062F0()
{
  return MEMORY[0x24BE29D28]();
}

uint64_t sub_245E062FC()
{
  return MEMORY[0x24BE29D38]();
}

uint64_t sub_245E06308()
{
  return MEMORY[0x24BE29D60]();
}

uint64_t sub_245E06314()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245E06320()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245E0632C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245E06338()
{
  return MEMORY[0x24BE6D380]();
}

uint64_t sub_245E06344()
{
  return MEMORY[0x24BE6D4B0]();
}

uint64_t sub_245E06350()
{
  return MEMORY[0x24BE6D4D0]();
}

uint64_t sub_245E0635C()
{
  return MEMORY[0x24BE6D500]();
}

uint64_t sub_245E06368()
{
  return MEMORY[0x24BE6D710]();
}

uint64_t sub_245E06374()
{
  return MEMORY[0x24BE6D718]();
}

uint64_t sub_245E06380()
{
  return MEMORY[0x24BE6D720]();
}

uint64_t sub_245E0638C()
{
  return MEMORY[0x24BE6D728]();
}

uint64_t sub_245E06398()
{
  return MEMORY[0x24BE6D730]();
}

uint64_t sub_245E063A4()
{
  return MEMORY[0x24BE6D738]();
}

uint64_t sub_245E063B0()
{
  return MEMORY[0x24BE6D740]();
}

uint64_t sub_245E063BC()
{
  return MEMORY[0x24BE6D768]();
}

uint64_t sub_245E063C8()
{
  return MEMORY[0x24BE6D770]();
}

uint64_t sub_245E063D4()
{
  return MEMORY[0x24BE6D778]();
}

uint64_t sub_245E063E0()
{
  return MEMORY[0x24BE6D788]();
}

uint64_t sub_245E063EC()
{
  return MEMORY[0x24BE6D790]();
}

uint64_t sub_245E063F8()
{
  return MEMORY[0x24BE6D7C0]();
}

uint64_t sub_245E06404()
{
  return MEMORY[0x24BE6D7C8]();
}

uint64_t sub_245E06410()
{
  return MEMORY[0x24BE6D7E8]();
}

uint64_t sub_245E0641C()
{
  return MEMORY[0x24BE6D8B8]();
}

uint64_t sub_245E06428()
{
  return MEMORY[0x24BE6D8C0]();
}

uint64_t sub_245E06434()
{
  return MEMORY[0x24BE6D8E8]();
}

uint64_t sub_245E06440()
{
  return MEMORY[0x24BE6D8F8]();
}

uint64_t sub_245E0644C()
{
  return MEMORY[0x24BE6D920]();
}

uint64_t sub_245E06458()
{
  return MEMORY[0x24BE6D930]();
}

uint64_t sub_245E06464()
{
  return MEMORY[0x24BE6D958]();
}

uint64_t sub_245E06470()
{
  return MEMORY[0x24BE6D970]();
}

uint64_t sub_245E0647C()
{
  return MEMORY[0x24BE6D988]();
}

uint64_t sub_245E06488()
{
  return MEMORY[0x24BE6D990]();
}

uint64_t sub_245E06494()
{
  return MEMORY[0x24BE6DB00]();
}

uint64_t sub_245E064A0()
{
  return MEMORY[0x24BE6DB10]();
}

uint64_t sub_245E064AC()
{
  return MEMORY[0x24BE6DB18]();
}

uint64_t sub_245E064B8()
{
  return MEMORY[0x24BE6DB20]();
}

uint64_t sub_245E064C4()
{
  return MEMORY[0x24BE6DB28]();
}

uint64_t sub_245E064D0()
{
  return MEMORY[0x24BE6DB30]();
}

uint64_t sub_245E064DC()
{
  return MEMORY[0x24BE6DBA0]();
}

uint64_t sub_245E064E8()
{
  return MEMORY[0x24BE6DBA8]();
}

uint64_t sub_245E064F4()
{
  return MEMORY[0x24BE6DBB0]();
}

uint64_t sub_245E06500()
{
  return MEMORY[0x24BE6DBB8]();
}

uint64_t sub_245E0650C()
{
  return MEMORY[0x24BE6DBC8]();
}

uint64_t sub_245E06518()
{
  return MEMORY[0x24BE6DC08]();
}

uint64_t sub_245E06524()
{
  return MEMORY[0x24BE6DC58]();
}

uint64_t sub_245E06530()
{
  return MEMORY[0x24BE6DC70]();
}

uint64_t sub_245E0653C()
{
  return MEMORY[0x24BE6DC80]();
}

uint64_t sub_245E06548()
{
  return MEMORY[0x24BE85908]();
}

uint64_t sub_245E06554()
{
  return MEMORY[0x24BE85918]();
}

uint64_t sub_245E06560()
{
  return MEMORY[0x24BE85920]();
}

uint64_t sub_245E0656C()
{
  return MEMORY[0x24BE85930]();
}

uint64_t sub_245E06578()
{
  return MEMORY[0x24BE85938]();
}

uint64_t sub_245E06584()
{
  return MEMORY[0x24BE85968]();
}

uint64_t sub_245E06590()
{
  return MEMORY[0x24BE85978]();
}

uint64_t sub_245E0659C()
{
  return MEMORY[0x24BE85988]();
}

uint64_t sub_245E065A8()
{
  return MEMORY[0x24BE85990]();
}

uint64_t sub_245E065B4()
{
  return MEMORY[0x24BE859A0]();
}

uint64_t sub_245E065C0()
{
  return MEMORY[0x24BE859B8]();
}

uint64_t sub_245E065CC()
{
  return MEMORY[0x24BE859C0]();
}

uint64_t sub_245E065D8()
{
  return MEMORY[0x24BE859D0]();
}

uint64_t sub_245E065E4()
{
  return MEMORY[0x24BE859D8]();
}

uint64_t sub_245E065F0()
{
  return MEMORY[0x24BE85A08]();
}

uint64_t sub_245E065FC()
{
  return MEMORY[0x24BE85A18]();
}

uint64_t sub_245E06608()
{
  return MEMORY[0x24BE85A28]();
}

uint64_t sub_245E06614()
{
  return MEMORY[0x24BE85A30]();
}

uint64_t sub_245E06620()
{
  return MEMORY[0x24BE85A40]();
}

uint64_t sub_245E0662C()
{
  return MEMORY[0x24BE85A58]();
}

uint64_t sub_245E06638()
{
  return MEMORY[0x24BE85A60]();
}

uint64_t sub_245E06644()
{
  return MEMORY[0x24BE85A68]();
}

uint64_t sub_245E06650()
{
  return MEMORY[0x24BE85A70]();
}

uint64_t sub_245E0665C()
{
  return MEMORY[0x24BE85A78]();
}

uint64_t sub_245E06668()
{
  return MEMORY[0x24BE85A88]();
}

uint64_t sub_245E06674()
{
  return MEMORY[0x24BE85AA0]();
}

uint64_t sub_245E06680()
{
  return MEMORY[0x24BE85AB8]();
}

uint64_t sub_245E0668C()
{
  return MEMORY[0x24BE85AC0]();
}

uint64_t sub_245E06698()
{
  return MEMORY[0x24BE85AD0]();
}

uint64_t sub_245E066A4()
{
  return MEMORY[0x24BE85AD8]();
}

uint64_t sub_245E066B0()
{
  return MEMORY[0x24BE85B08]();
}

uint64_t sub_245E066BC()
{
  return MEMORY[0x24BE85B18]();
}

uint64_t sub_245E066C8()
{
  return MEMORY[0x24BE85B28]();
}

uint64_t sub_245E066D4()
{
  return MEMORY[0x24BE85B30]();
}

uint64_t sub_245E066E0()
{
  return MEMORY[0x24BE85B40]();
}

uint64_t sub_245E066EC()
{
  return MEMORY[0x24BE85B50]();
}

uint64_t sub_245E066F8()
{
  return MEMORY[0x24BE85B60]();
}

uint64_t sub_245E06704()
{
  return MEMORY[0x24BE85B68]();
}

uint64_t sub_245E06710()
{
  return MEMORY[0x24BE85B78]();
}

uint64_t sub_245E0671C()
{
  return MEMORY[0x24BE85B90]();
}

uint64_t sub_245E06728()
{
  return MEMORY[0x24BE85BB0]();
}

uint64_t sub_245E06734()
{
  return MEMORY[0x24BE85BB8]();
}

uint64_t sub_245E06740()
{
  return MEMORY[0x24BE85BC0]();
}

uint64_t sub_245E0674C()
{
  return MEMORY[0x24BE85BD8]();
}

uint64_t sub_245E06758()
{
  return MEMORY[0x24BE85BF0]();
}

uint64_t sub_245E06764()
{
  return MEMORY[0x24BE85C00]();
}

uint64_t sub_245E06770()
{
  return MEMORY[0x24BE85C08]();
}

uint64_t sub_245E0677C()
{
  return MEMORY[0x24BE85C20]();
}

uint64_t sub_245E06788()
{
  return MEMORY[0x24BE85C28]();
}

uint64_t sub_245E06794()
{
  return MEMORY[0x24BE85C50]();
}

uint64_t sub_245E067A0()
{
  return MEMORY[0x24BE85C68]();
}

uint64_t sub_245E067AC()
{
  return MEMORY[0x24BE85C78]();
}

uint64_t sub_245E067B8()
{
  return MEMORY[0x24BE85C80]();
}

uint64_t sub_245E067C4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245E067D0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245E067DC()
{
  return MEMORY[0x24BE29E30]();
}

uint64_t sub_245E067E8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245E067F4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245E06800()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245E0680C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245E06818()
{
  return MEMORY[0x24BEE6818]();
}

uint64_t sub_245E06824()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_245E06830()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_245E0683C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245E06848()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245E06854()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_245E06860()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_245E0686C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_245E06878()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_245E06884()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_245E06890()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_245E0689C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_245E068A8()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_245E068B4()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_245E068C0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_245E068CC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245E068D8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245E068E4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245E068F0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_245E068FC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245E06908()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245E06914()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245E06920()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245E0692C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_245E06938()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245E06944()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245E06950()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_245E0695C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_245E06968()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245E06974()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_245E06980()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245E0698C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245E06998()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245E069A4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245E069B0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245E069BC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_245E069C8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_245E069D4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_245E069E0()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_245E069EC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_245E069F8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245E06A04()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_245E06A10()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_245E06A1C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_245E06A28()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_245E06A34()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_245E06A40()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_245E06A4C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245E06A58()
{
  return MEMORY[0x24BE29EB0]();
}

uint64_t sub_245E06A64()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245E06A70()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245E06A7C()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_245E06A88()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_245E06A94()
{
  return MEMORY[0x24BE29EC0]();
}

uint64_t sub_245E06AA0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_245E06AAC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245E06AB8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245E06AC4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245E06AD0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_245E06ADC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_245E06AE8()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_245E06AF4()
{
  return MEMORY[0x24BE85C98]();
}

uint64_t sub_245E06B00()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_245E06B0C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t CUNextID64()
{
  return MEMORY[0x24BE29178]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x24BE29690]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

