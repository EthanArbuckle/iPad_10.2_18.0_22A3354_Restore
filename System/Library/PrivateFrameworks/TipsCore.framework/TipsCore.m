id TPSAnalyticsChecklistSessionController.init()()
{
  _BYTE *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  objc_super v5;

  v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch] = 0;
  v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession] = 0;
  v1 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount];
  *(_QWORD *)v1 = 0;
  v1[8] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent] = 0;
  v2 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartTime];
  v3 = sub_19A990ADC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout] = 0x409C200000000000;
  *(_QWORD *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionBackgroundTimeout] = 0x4082C00000000000;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TPSAnalyticsChecklistSessionController();
  return objc_msgSendSuper2(&v5, sel_init);
}

void sub_19A908BEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE3B5900)
  {
    sub_19A990ADC();
    v0 = sub_19A991034();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE3B5900);
  }
}

id static TPSAnalyticsChecklistSessionController.sharedInstance.getter()
{
  if (qword_1EE3B5950 != -1)
    swift_once();
  return (id)qword_1EE3B5940;
}

uint64_t sub_19A908C80()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A990B6C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_19A908D2C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED03D5A8)
  {
    sub_19A990A34();
    v0 = sub_19A991034();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED03D5A8);
  }
}

void sub_19A908D80()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED03D2E0)
  {
    sub_19A990C20();
    v0 = sub_19A991034();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED03D2E0);
  }
}

uint64_t sub_19A908DD4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a1;
  swift_beginAccess();
  return sub_19A908E20(v4, a2);
}

uint64_t sub_19A908E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_19A908E68()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSAnalyticsChecklistSessionController()), sel_init);
  qword_1EE3B5940 = (uint64_t)result;
  return result;
}

unint64_t sub_19A908EF8()
{
  unint64_t result;

  result = qword_1ED03D5C8;
  if (!qword_1ED03D5C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED03D5C8);
  }
  return result;
}

uint64_t UserGuide.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19A908FD4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_19A909024()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  MEMORY[0x1E0C80A78]();
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_19A990C20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A92658C((uint64_t)v2, v4);
  swift_endAccess();
  if (*(_QWORD *)(v0 + 120))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
    sub_19A990EF0();
    swift_release();
  }
  *(_QWORD *)(v0 + 120) = 0;
  return swift_release();
}

uint64_t sub_19A909134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x19AECE39C](v1);
  v3 = (void *)v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
  swift_retain();

  return swift_task_switch();
}

void sub_19A909218(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t type metadata accessor for UserGuideTopic()
{
  return objc_opt_self();
}

Swift::Void __swiftcall NetworkMonitorProxy.stop()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  sub_19A90A440(v1, (uint64_t)&unk_1EE3B6730, v2);
  os_unfair_lock_unlock(v3);
  swift_release_n();
}

uint64_t sub_19A9092E0()
{
  uint64_t v0;
  objc_class *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t result;
  objc_super v8;

  if (qword_1ED03D320 != -1)
    swift_once();
  v0 = qword_1ED03D310;
  v1 = (objc_class *)type metadata accessor for NetworkMonitorProxy();
  v2 = (char *)objc_allocWithZone(v1);
  v3 = OBJC_IVAR___TPSNetworkPathMonitor_serialTasks;
  type metadata accessor for SerialTaskExecutor();
  v4 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D368);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)&v2[v3] = v4;
  *(_QWORD *)&v2[OBJC_IVAR___TPSNetworkPathMonitor_monitor] = v0;
  v8.receiver = v2;
  v8.super_class = v1;
  swift_retain_n();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  result = swift_release();
  qword_1ED03D330 = (uint64_t)v6;
  return result;
}

unint64_t sub_19A9093D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  type metadata accessor for NetworkMonitor();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_19A990BCC();
  swift_allocObject();
  *(_QWORD *)(v0 + 112) = sub_19A990BC0();
  *(_QWORD *)(v0 + 120) = 0;
  v1 = v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  v2 = sub_19A990C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers;
  result = sub_19A925A54(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v0 + v3) = result;
  qword_1ED03D310 = v0;
  return result;
}

id TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  objc_class *ObjectType;
  objc_super v24;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = &v7[OBJC_IVAR___TPSAssetsInfo_videoIdentifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = (uint64_t)&v7[OBJC_IVAR___TPSAssetsInfo_videoURL];
  v13 = sub_19A990A34();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v15 = &v7[OBJC_IVAR___TPSAssetsInfo_imageIdentifier];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = (uint64_t)&v7[OBJC_IVAR___TPSAssetsInfo_imageURL];
  v14((uint64_t)&v7[OBJC_IVAR___TPSAssetsInfo_imageURL], 1, 1, v13);
  swift_beginAccess();
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v17 = v7;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_19A909670(a3, v12);
  swift_endAccess();
  swift_beginAccess();
  *(_QWORD *)v15 = a4;
  *((_QWORD *)v15 + 1) = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_19A909670(a6, v16);
  swift_endAccess();

  v24.receiver = v17;
  v24.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v24, sel_init);
  sub_19A909630(a6);
  sub_19A909630(a3);
  return v18;
}

uint64_t sub_19A909630(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19A909670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A9096B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(sub_19A990B0C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = v0 + v3;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_19A90F6C4;
  return sub_19A90974C(v4, v5, v7, v8);
}

uint64_t sub_19A90974C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B58A0);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A9097BC()
{
  id v0;
  int v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unsigned __int8 v13;
  _OWORD v14[2];
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v0 = objc_msgSend((id)objc_opt_self(), sel_clientBundleIdentifier);
  if (v0)
  {
    sub_19A990D58();

    sub_19A990D88();
    swift_bridgeObjectRelease();
  }
  v1 = os_variant_allows_internal_security_policies();
  swift_unknownObjectRelease();
  if (!v1)
    return 0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = (void *)sub_19A990D34();
  v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_19A91E3C0((uint64_t)v14, (uint64_t)&v15);
  if (!v17)
  {
    sub_19A91E1E0((uint64_t)&v15);
    return 1;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 1;
  v5 = v13;
  if (qword_1ED03D5E8 != -1)
    swift_once();
  v15 = 0;
  v16 = 0xE000000000000000;
  v6 = (id)qword_1ED03D5F0;
  sub_19A991160();
  swift_bridgeObjectRelease();
  v15 = 0xD00000000000002ELL;
  v16 = 0x800000019A9A0950;
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v8 = v15;
  v7 = v16;
  v9 = sub_19A990F98();
  if (os_log_type_enabled(v6, v9))
  {
    swift_bridgeObjectRetain_n();
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v15 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v14[0] = sub_19A91E7D8(v8, v7, &v15);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v6, v9, "%s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v11, -1, -1);
    MEMORY[0x19AECE318](v10, -1, -1);
  }

  swift_bridgeObjectRelease();
  return v5;
}

Swift::Void __swiftcall UserGuide.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)sub_19A990D34();
  v4 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  v5 = v1 + OBJC_IVAR___TPSUserGuide_version;
  swift_beginAccess();
  if (*(_QWORD *)(v5 + 8))
  {
    swift_bridgeObjectRetain();
    v6 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v6, v7);
  swift_unknownObjectRelease();

  v8 = (void *)sub_19A990D34();
  v9 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9);

  v10 = (void *)sub_19A990D34();
  v11 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v10, v11);

  if (*(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_platform + 8))
    v12 = sub_19A990D34();
  else
    v12 = 0;
  v13 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v12, v13);
  swift_unknownObjectRelease();

  v14 = *(unsigned __int8 *)(v1 + OBJC_IVAR___TPSUserGuide_platformIndependent);
  v15 = (void *)sub_19A990D34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v14, v15);

  v16 = (void *)sub_19A990E30();
  v17 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v16, v17);

}

uint64_t UserGuide.init(coder:)(void *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v2 = sub_19A990FEC();
  if (v2)
  {
    v3 = (void *)v2;
    v5 = 0;
    v6 = 0;
    sub_19A990D4C();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_19A90A170(uint64_t a1, unint64_t *a2)
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

id sub_19A90A1A8(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_19A9909BC();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_19A90A280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x19AECE39C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v5 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 72);
    v6 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    swift_retain();

    v8 = sub_19A990B0C();
    *(_QWORD *)(v0 + 96) = v8;
    v9 = *(_QWORD *)(v8 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, v6, v8);
    v10 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56);
    *(_QWORD *)(v0 + 104) = v10;
    v10(v4, 0, 1, v8);
    v11 = swift_allocObject();
    *(_QWORD *)(v0 + 112) = v11;
    *(_QWORD *)(v11 + 16) = v7;
    *(_QWORD *)(v11 + 24) = v5;
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    v13 = sub_19A990B0C();
    v14 = *(_QWORD *)(v0 + 80);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v14, 1, 1, v13);
    sub_19A968180(v14);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A90A3E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v0 + 104))(v1, 0, 1, *(_QWORD *)(v0 + 96));
  sub_19A968180(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A90A440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D350);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_19A990EE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  v10[5] = a2;
  v10[6] = a3;
  swift_retain();
  swift_retain();
  *(_QWORD *)(a1 + 24) = sub_19A9768D0((uint64_t)v7, (uint64_t)&unk_1EE3B6768, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_19A90A538(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19A90A574()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[9];
  sub_19A90A5E8(v1, (uint64_t)sub_19A968160, v0[14], v0[10]);
  swift_release();
  swift_release();
  sub_19A968180(v1);
  return swift_task_switch();
}

uint64_t sub_19A90A5E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;

  v9 = sub_19A990B0C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B58A0);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A90ABB4(a1, (uint64_t)v14, &qword_1EE3B58A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
  {
    sub_19A990B00();
    sub_19A90A538((uint64_t)v14, &qword_1EE3B58A0);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a4, v14, v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  v16 = (uint64_t *)(v4 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v16;
  *v16 = 0x8000000000000000;
  sub_19A90A7BC((uint64_t)sub_19A977480, v15, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
  *v16 = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_endAccess();
}

uint64_t sub_19A90A7BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v5 = (_QWORD **)v4;
  v28 = a2;
  v9 = sub_19A990B0C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_19A90A928(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = *v5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (uint64_t *)(v21[7] + 16 * v15);
      result = swift_release();
      v24 = v28;
      *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_19A97A4A0();
    goto LABEL_7;
  }
  sub_19A90ABF8(v18, a4 & 1);
  v25 = sub_19A90A928(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    result = sub_19A9912E0();
    __break(1u);
    return result;
  }
  v15 = v25;
  v21 = *v5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_19A90AB14(v15, (uint64_t)v12, a1, v28, v21);
}

unint64_t sub_19A90A928(uint64_t a1)
{
  uint64_t v2;

  sub_19A990B0C();
  sub_19A90A994(&qword_1EE3B5910, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v2 = sub_19A990CEC();
  return sub_19A90A9D4(a1, v2);
}

uint64_t sub_19A90A994(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x19AECE27C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_19A90A9D4(uint64_t a1, uint64_t a2)
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
  v5 = sub_19A990B0C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
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
      sub_19A90A994(&qword_1EE3B5918, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v14 = sub_19A990D10();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_19A90AB14(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v11 = sub_19A990B0C();
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

uint64_t sub_19A90ABB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_19A90ABF8(uint64_t a1, int a2)
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
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  int v39;
  __int128 v40;

  v3 = v2;
  v5 = sub_19A990B0C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5988);
  v39 = a2;
  v10 = sub_19A9911F0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v38 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v36 = v2;
  v37 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = v38;
    v24 = v38[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_34;
      v24 = v38[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_34:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v38[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v37)
              goto LABEL_34;
            v24 = v38[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v39 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v40 = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v40 = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v21);
      swift_retain();
    }
    sub_19A90A994(&qword_1EE3B5910, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_19A990CEC();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_OWORD *)(*(_QWORD *)(v11 + 56) + 16 * v19) = v40;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = v38;
  if ((v39 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v9 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_19A90B0A4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  return sub_19A990FC8();
}

void sub_19A90C6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A90D3D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A90EDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t type metadata accessor for UserGuide()
{
  uint64_t result;

  result = qword_1ED03D1F0;
  if (!qword_1ED03D1F0)
    return swift_getSingletonMetadata();
  return result;
}

ValueMetadata *type metadata accessor for TipsLog()
{
  return &type metadata for TipsLog;
}

id sub_19A90EF1C@<X0>(_QWORD *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  void *v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  *a3 = *a2;
  return v5;
}

id static TipsLog.default.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D5E8, (void **)&qword_1ED03D5F0, a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_19A90F138(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19A910830(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  _Unwind_Resume(a1);
}

void sub_19A912174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 232), 8);
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}

void sub_19A9136AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A913CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t type metadata accessor for TPSAnalyticsChecklistSessionController()
{
  uint64_t result;

  result = qword_1EE3B5970;
  if (!qword_1EE3B5970)
    return swift_getSingletonMetadata();
  return result;
}

void sub_19A914D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getPPCRedirectClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PingPongClientLibraryCore_frameworkLibrary_0)
  {
    PingPongClientLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!PingPongClientLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PPCRedirect");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPPCRedirectClass_block_invoke_cold_1();
    free(v3);
  }
  getPPCRedirectClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A915584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19A9156CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A916084(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_19A9160D8(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x19AECE39C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if (a1)
      a1 = (void *)sub_19A9909B0();
    objc_msgSend(v5, sel_finishWithError_, a1);

  }
}

id TPSAsyncBlockOperation.init(asyncBlock:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for TPSAsyncBlockOperation()
{
  return objc_opt_self();
}

void sub_19A916514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A9165B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A916654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AECE264]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_19A9168BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_19A9168C4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_19A9168C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void (*v5)(uint64_t, void *);
  _QWORD v7[6];

  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_19A916084;
  v7[3] = &block_descriptor_0;
  v4 = _Block_copy(v7);
  v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
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

void sub_19A91843C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A9189D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A918D58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A918EA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A919070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A919268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A91931C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9193D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A91947C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A919524(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9195CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9196A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A919DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A919E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A919F28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  _Unwind_Resume(a1);
}

void sub_19A919FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A91A0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A91A6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A91A7C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A91A9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A91AB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t logInfo(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19A9830D0(a1, a2, a3, MEMORY[0x1E0DF2270]);
}

Swift::Void __swiftcall TipsLog.info(_:)(Swift::String a1)
{
  sub_19A91E22C(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x1E0DF2270]);
}

id sub_19A91BDE0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  void *v3;
  __int128 v5;
  uint64_t v6;

  sub_19A91DE2C(a3, &v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = (void *)sub_19A990E30();
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v5);
  }
  return 0;
}

void sub_19A91C9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61,char a62)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a61);
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void sub_19A91CD4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A91CFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A91D158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A91DC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_19A91DDA4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  void *v3;
  __int128 v5;
  uint64_t v6;

  sub_19A91DE2C(a3, &v5);
  if (v6)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = (void *)sub_19A990D34();
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v5);
  }
  return 0;
}

uint64_t sub_19A91DE2C@<X0>(unsigned __int8 a1@<W0>, _OWORD *a2@<X8>)
{
  uint64_t result;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;

  *a2 = 0u;
  a2[1] = 0u;
  if (qword_1ED03D568 != -1)
    swift_once();
  result = swift_beginAccess();
  if (byte_1ED03D560 == 1)
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    sub_19A91E408(a1);
    v6 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v5, sel_objectForKey_, v6);

    if (v7)
    {
      sub_19A9910A0();
      swift_unknownObjectRelease();
      sub_19A91E1E0((uint64_t)a2);
    }
    else
    {
      sub_19A91E1E0((uint64_t)a2);
      v15 = 0u;
      v16 = 0u;
    }
    sub_19A91E3C0((uint64_t)&v15, (uint64_t)a2);
    sub_19A91E378((uint64_t)a2, (uint64_t)&v15);
    if (*((_QWORD *)&v16 + 1))
    {
      sub_19A90A170(0, &qword_1EE3B68B0);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        if (qword_1ED03D5E8 != -1)
          swift_once();
        *(_QWORD *)&v15 = 0;
        *((_QWORD *)&v15 + 1) = 0xE000000000000000;
        v8 = (id)qword_1ED03D5F0;
        sub_19A991160();
        sub_19A990DAC();
        sub_19A9911A8();
        sub_19A990DAC();
        v9 = objc_msgSend(v14, sel_description);
        sub_19A990D58();

        sub_19A990DAC();
        swift_bridgeObjectRelease();
        v10 = v15;
        v11 = sub_19A990F98();
        if (os_log_type_enabled(v8, v11))
        {
          swift_bridgeObjectRetain_n();
          v12 = (uint8_t *)swift_slowAlloc();
          v13 = swift_slowAlloc();
          *(_QWORD *)&v15 = v13;
          *(_DWORD *)v12 = 136315138;
          swift_bridgeObjectRetain();
          sub_19A91E7D8(v10, *((unint64_t *)&v10 + 1), (uint64_t *)&v15);
          sub_19A991058();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19A906000, v8, v11, "%s", v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x19AECE318](v13, -1, -1);
          MEMORY[0x19AECE318](v12, -1, -1);
        }

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      return sub_19A91E1E0((uint64_t)&v15);
    }
  }
  return result;
}

uint64_t sub_19A91E1E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D570);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t logDebug(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19A9830D0(a1, a2, a3, MEMORY[0x1E0DF2278]);
}

uint64_t sub_19A91E22C(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  NSObject **v3;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t result;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *v3;
  v7 = a3();
  result = os_log_type_enabled(v6, v7);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n();
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(a1, a2, &v11);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v10, -1, -1);
    return MEMORY[0x19AECE318](v9, -1, -1);
  }
  return result;
}

Swift::Void __swiftcall TipsLog.debug(_:)(Swift::String a1)
{
  sub_19A91E22C(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x1E0DF2278]);
}

uint64_t sub_19A91E378(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A91E3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A91E408(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_19A91E444 + 4 * byte_19A99B030[a1]))(0xD000000000000011, 0x800000019A99E910);
}

uint64_t sub_19A91E444()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_19A91E7D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_19A91E8E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_19A91E8A8((uint64_t)v12, *a3);
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
      sub_19A91E8A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19A91E8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19A91E8E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_19A991064();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_19A95EA48(a5, a6);
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
  v8 = sub_19A991190();
  if (!v8)
  {
    sub_19A9911B4();
    __break(1u);
LABEL_17:
    result = sub_19A991208();
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

Swift::Void __swiftcall TipsLog.log(_:)(Swift::String a1)
{
  sub_19A91E22C(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x1E0DF2290]);
}

id sub_19A91ED6C(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

void sub_19A91EF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A91F3A4()
{
  objc_end_catch();
  JUMPOUT(0x19A91F3ACLL);
}

uint64_t NetworkMonitorProxy.addObserver(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  os_unfair_lock_s *v16;
  _BYTE v18[16];

  v4 = v3;
  v8 = sub_19A990B0C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78]();
  v11 = *(_QWORD *)(v4 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(&v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v9 + 32))(v14 + v13, &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v8);
  v15 = (_QWORD *)(v14 + ((v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = a2;
  v15[1] = a3;
  v16 = (os_unfair_lock_s *)(*(_QWORD *)(v11 + 16) + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v16);
  sub_19A90A440(v11, (uint64_t)&unk_1EE3B6740, v14);
  os_unfair_lock_unlock(v16);
  swift_release();
  return swift_release();
}

id TPSXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CC7A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_contentWithCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_logAnalyticsEvent_, 0, 0);

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_logAnalyticsEvents_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_contentForVariant_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_fetchAssetsWithAssetsConfiguration_completionHandler_, 0, 1);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_userGuideMapWithCompletionHandler_, 0, 1);

  +[TPSSearchQueryXPCInterfaceBuilder configure:](TPSSearchQueryXPCInterfaceBuilder, "configure:", v0);
  return v0;
}

void sub_19A921F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19A922414(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_19A9245C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DataMigrationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!DataMigrationLibraryCore_frameworkLibrary)
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = DataMigrationLibraryCore_frameworkLibrary;
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_19A9259FC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_19A9259FC(a1, &qword_1ED03D360);
}

unint64_t sub_19A925A54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D2D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5988);
  v6 = sub_19A9911FC();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_19A90ABB4(v12, (uint64_t)v5, &qword_1ED03D2D8);
    result = sub_19A90A928((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_19A990B0C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_OWORD *)(v7[7] + 16 * v16) = *(_OWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
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

uint64_t UserGuide.version.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuide_version);
}

uint64_t UserGuide.platformIndependent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___TPSUserGuide_platformIndependent);
}

uint64_t log(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19A9830D0(a1, a2, a3, MEMORY[0x1E0DF2290]);
}

void sub_19A925C58()
{
  unint64_t v0;

  sub_19A908BEC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xD8))(a1, a2 & 1);
}

uint64_t sub_19A925D38(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  result = swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t sub_19A925DCC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t type metadata accessor for NetworkMonitorProxy()
{
  return objc_opt_self();
}

uint64_t sub_19A925E34()
{
  uint64_t v0;

  sub_19A909024();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A925E70()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A90F6C4;
  v2[5] = v0;
  return swift_task_switch();
}

uint64_t type metadata accessor for SerialTaskExecutor()
{
  return objc_opt_self();
}

void sub_19A925F20()
{
  unint64_t v0;

  sub_19A908D80();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for NetworkMonitor()
{
  uint64_t result;

  result = qword_1ED03D1C0;
  if (!qword_1ED03D1C0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_19A925FF8()
{
  unint64_t v0;

  sub_19A908D2C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for TPSAssetsInfo()
{
  uint64_t result;

  result = qword_1ED03D5B8;
  if (!qword_1ED03D5B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19A9260B0()
{
  return type metadata accessor for TPSAssetsInfo();
}

uint64_t TPSAssetsInfo.videoURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19A908DD4(&OBJC_IVAR___TPSAssetsInfo_videoURL, a1);
}

uint64_t TPSAssetsInfo.imageURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19A908DD4(&OBJC_IVAR___TPSAssetsInfo_imageURL, a1);
}

uint64_t TPSAssetsInfo.videoIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

uint64_t TPSAssetsInfo.imageIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

uint64_t sub_19A9260E8(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x636974796C616E41, 0xE900000000000073, &qword_1ED03D598);
}

id static TipsLog.indexing.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D170, (void **)&qword_1ED03D168, a1);
}

uint64_t sub_19A926128(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x746C7561666544, 0xE700000000000000, &qword_1ED03D5F0);
}

uint64_t sub_19A926148(uint64_t a1)
{
  return sub_19A9603E8(a1, 1635017028, 0xE400000000000000, &qword_1ED03D5D8);
}

uint64_t sub_19A926374()
{
  uint64_t result;

  result = sub_19A9097BC();
  byte_1ED03D560 = result & 1;
  return result;
}

id sub_19A9263A4(unsigned __int8 a1)
{
  id v2;
  id v3;
  void *v4;
  void *v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  v2 = 0;
  if (byte_1ED03D560 == 1)
  {
    sub_19A91DE2C(a1, &v7);
    if (v8)
    {
      sub_19A959AA0(&v7, v9);
      sub_19A91E8A8((uint64_t)v9, (uint64_t)&v7);
      sub_19A90A170(0, &qword_1EE3B68A8);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v2 = v6;
LABEL_10:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
        return v2;
      }
      sub_19A91E8A8((uint64_t)v9, (uint64_t)&v7);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
        v4 = (void *)sub_19A990D34();
        swift_bridgeObjectRelease();
        v2 = objc_msgSend(v3, sel_numberFromString_, v4);

        goto LABEL_10;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    }
    else
    {
      sub_19A91E1E0((uint64_t)&v7);
    }
    return 0;
  }
  return v2;
}

uint64_t sub_19A92658C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double OUTLINED_FUNCTION_0(double a1)
{
  double v1;

  return v1 - a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  void *v0;

  return objc_msgSend(v0, "creationTime");
}

void sub_19A92A03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TPSAnalyticsXPCServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3C9FF0);
}

id TPSMiniTipContentManagerServiceInterfaceServerInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CC740);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_contentWithContentIdentifiers_bundleID_context_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_validateAndPrepareContentForDisplay_bundleID_context_skipUsageCheck_completionHandler_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_validateAndPrepareContentForDisplay_bundleID_context_skipUsageCheck_completionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_logAnalyticsEvent_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_logAnalyticsEvents_, 0, 0);

  return v0;
}

void sub_19A93382C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A9377D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A937828(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9378C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9379C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A937A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A937AF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A937CA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A937EF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938044(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938184(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938420(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A93852C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9386B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9387A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9389D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938AF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938C54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938D60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938EA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A938FB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A939268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A939340(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A939538(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9395F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A939688(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A939718(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A9397D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A93AC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A93E480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A940508(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A94059C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A940D08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19A940F64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19A941264(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19A941D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19A942390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_19A9462FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A946644(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19A946B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_19A94ADDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A94B4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return objc_opt_class();
}

void sub_19A94CC08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  _Unwind_Resume(a1);
}

void sub_19A94D8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A94DB64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPPCExtensibleSSOAuthenticatorClass_block_invoke(uint64_t a1)
{
  Class result;

  PingPongClientLibrary();
  result = objc_getClass("PPCExtensibleSSOAuthenticator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPPCExtensibleSSOAuthenticatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPPCExtensibleSSOAuthenticatorClass_block_invoke_cold_1();
    return (Class)PingPongClientLibrary();
  }
  return result;
}

uint64_t PingPongClientLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PingPongClientLibraryCore_frameworkLibrary)
    PingPongClientLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PingPongClientLibraryCore_frameworkLibrary;
  if (!PingPongClientLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_19A954B68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  _Unwind_Resume(a1);
}

void sub_19A954D6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  _Unwind_Resume(a1);
}

void sub_19A954F30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  _Unwind_Resume(a1);
}

void sub_19A954F9C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_19A957D3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A957DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

_QWORD *TPSAnalyticsChecklistSession.__allocating_init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, float a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 69) = 0;
  *(_QWORD *)(v10 + 40) = a1;
  *(_QWORD *)(v10 + 48) = a2;
  *(_QWORD *)(v10 + 56) = a3;
  *(float *)(v10 + 64) = a5;
  *(_BYTE *)(v10 + 68) = a4;
  return TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019A99F150);
}

_QWORD *TPSAnalyticsChecklistSession.init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, float a5)
{
  uint64_t v5;

  *(_BYTE *)(v5 + 69) = 0;
  *(_QWORD *)(v5 + 40) = a1;
  *(_QWORD *)(v5 + 48) = a2;
  *(_QWORD *)(v5 + 56) = a3;
  *(float *)(v5 + 64) = a5;
  *(_BYTE *)(v5 + 68) = a4;
  return TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019A99F150);
}

unint64_t sub_19A958A24()
{
  unint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;

  v0 = sub_19A958DF4(MEMORY[0x1E0DEE9D8], (uint64_t *)&unk_1EE3B6388);
  v1 = sub_19A990F5C();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v1, 0xD000000000000012, 0x800000019A99E8B0, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  v3 = sub_19A990F5C();
  v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v3, 0xD000000000000010, 0x800000019A99E8D0, v4, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  v5 = sub_19A990F5C();
  v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v5, 0xD000000000000016, 0x800000019A99E8F0, v6, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  v7 = sub_19A990F20();
  v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v7, 0x6570735F656D6974, 0xEA0000000000746ELL, v8, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  v9 = sub_19A990E84();
  v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v9, 0x69745F7473726966, 0xEF67616C665F656DLL, v10, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  objc_msgSend((id)objc_opt_self(), sel_isSeniorUser);
  v11 = sub_19A990E84();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_19A9598CC(v11, 0x67616C665F353675, 0xE800000000000000, v12, (void (*)(void))sub_19A97A494, (uint64_t *)&unk_1EE3B6388);
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_19A958C90(uint64_t a1)
{
  return sub_19A958DF4(a1, &qword_1EE3B6380);
}

unint64_t sub_19A958C9C(uint64_t a1)
{
  return sub_19A958DF4(a1, &qword_1EE3B6360);
}

unint64_t sub_19A958CA8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6368);
  v2 = sub_19A9911FC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_19A90ABB4(v6, (uint64_t)&v15, (uint64_t *)&unk_1EE3B6370);
    v7 = v15;
    v8 = v16;
    result = sub_19A979BFC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_19A959AA0(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_19A958DDC(uint64_t a1)
{
  return sub_19A958DF4(a1, &qword_1EE3B6358);
}

unint64_t sub_19A958DE8(uint64_t a1)
{
  return sub_19A958DF4(a1, &qword_1EE3B6350);
}

unint64_t sub_19A958DF4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_19A9911FC();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_19A979BFC(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
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

void TPSAnalyticsChecklistSession.__allocating_init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void TPSAnalyticsChecklistSession.init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t TPSAnalyticsChecklistSession.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t TPSAnalyticsChecklistSession.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void sub_19A958FB4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id sub_19A958FC0()
{
  id *v0;

  return *v0;
}

uint64_t sub_19A958FC8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void sub_19A958FD0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_19A958FD8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_19A958FEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_19A959000@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_19A959014(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_19A959044@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_19A959070@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_19A959094(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_19A9590A8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_19A9590BC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_19A9590D0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_19A9590E4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_19A9590F8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_19A95910C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_19A959120()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_19A959130()
{
  return sub_19A9910AC();
}

_QWORD *sub_19A959148(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_19A95915C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

_QWORD *sub_19A95916C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_19A959178()
{
  return sub_19A990D58();
}

uint64_t sub_19A959188()
{
  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  return sub_19A9909A4();
}

uint64_t sub_19A9591C8()
{
  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  return sub_19A990974();
}

uint64_t sub_19A959208(void *a1)
{
  id v2;

  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  v2 = a1;
  return sub_19A990968();
}

uint64_t sub_19A95926C()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_19A99101C();

  return v2;
}

uint64_t sub_19A9592A0()
{
  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  return sub_19A990998();
}

uint64_t sub_19A9592F0()
{
  sub_19A991340();
  sub_19A990CF8();
  return sub_19A991364();
}

BOOL sub_19A95934C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_19A959360@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_19A959A68(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_19A95939C()
{
  sub_19A90A994(&qword_1EE3B63B0, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A598);
  return sub_19A9912F8();
}

uint64_t sub_19A9593DC()
{
  sub_19A90A994(&qword_1EE3B63B0, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A598);
  return sub_19A9912EC();
}

uint64_t sub_19A959420()
{
  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  return sub_19A99095C();
}

uint64_t sub_19A959460()
{
  sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
  return sub_19A990980();
}

uint64_t sub_19A9594B8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_19A9911F0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_19A991340();
    sub_19A990DA0();
    result = sub_19A991364();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t type metadata accessor for TPSAnalyticsChecklistSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for TPSAnalyticsChecklistSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSession.__allocating_init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

void type metadata accessor for TPSSearchQueryOptions(uint64_t a1)
{
  sub_19A9259FC(a1, &qword_1EE3B62C8);
}

uint64_t sub_19A959808()
{
  return sub_19A90A994(&qword_1EE3B62D0, (uint64_t (*)(uint64_t))type metadata accessor for TPSSearchQueryOptions, (uint64_t)&unk_19A99A2CC);
}

uint64_t sub_19A959834()
{
  return sub_19A90A994(&qword_1EE3B62D8, (uint64_t (*)(uint64_t))type metadata accessor for TPSSearchQueryOptions, (uint64_t)&unk_19A99A298);
}

uint64_t sub_19A959860()
{
  return sub_19A90A994(&qword_1EE3B62E0, (uint64_t (*)(uint64_t))type metadata accessor for TPSSearchQueryOptions, (uint64_t)&unk_19A99A2F8);
}

uint64_t sub_19A95988C()
{
  return sub_19A90A994(&qword_1EE3B62E8, (uint64_t (*)(uint64_t))type metadata accessor for TPSSearchQueryOptions, (uint64_t)&unk_19A99A334);
}

void sub_19A9598B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_19A9598CC(a1, a2, a3, a4, (void (*)(void))sub_19A97A928, &qword_1EE3B6380);
}

void sub_19A9598CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v9 = v6;
  v14 = *v6;
  v16 = sub_19A979BFC(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];

      *(_QWORD *)(v23 + 8 * v16) = a1;
      return;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v26 = (uint64_t *)(v22[6] + 16 * v16);
    *v26 = a2;
    v26[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v22[2] = v29;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_19A9594B8(v19, a4 & 1, a6);
  v24 = sub_19A979BFC(a2, a3);
  if ((v20 & 1) == (v25 & 1))
  {
    v16 = v24;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_19A9912E0();
  __break(1u);
}

void sub_19A959A40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_19A9598CC(a1, a2, a3, a4, (void (*)(void))sub_19A97A934, &qword_1EE3B6360);
}

void sub_19A959A54(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_19A9598CC(a1, a2, a3, a4, (void (*)(void))sub_19A97A940, &qword_1EE3B6350);
}

uint64_t sub_19A959A68(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

_OWORD *sub_19A959AA0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CSSearchQueryError(uint64_t a1)
{
  sub_19A9259FC(a1, &qword_1EE3B6398);
}

uint64_t sub_19A959AC4()
{
  return sub_19A90A994(&qword_1EE3B63A0, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A4B0);
}

uint64_t sub_19A959AF0()
{
  return sub_19A90A994(&qword_1EE3B63A8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A4DC);
}

uint64_t sub_19A959B1C()
{
  return sub_19A90A994(&qword_1EE3B63B0, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A598);
}

uint64_t sub_19A959B48()
{
  return sub_19A90A994(&qword_1EE3B63B8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A564);
}

uint64_t sub_19A959B74()
{
  return sub_19A90A994(&qword_1EE3B63C0, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A520);
}

uint64_t sub_19A959BA0()
{
  return sub_19A90A994(&qword_1EE3B63C8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_19A99A684);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_19A9259FC(a1, (unint64_t *)&unk_1EE3B63F0);
}

uint64_t sub_19A959BE0()
{
  return sub_19A90A994(&qword_1EE3B63D0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_19A99A648);
}

unint64_t sub_19A959C10()
{
  unint64_t result;

  result = qword_1EE3B63D8;
  if (!qword_1EE3B63D8)
  {
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EE3B63D8);
  }
  return result;
}

uint64_t sub_19A959C54()
{
  return sub_19A90A994(&qword_1EE3B63E0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_19A99A6C0);
}

uint64_t sub_19A959C80()
{
  return sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v4;
  void *v5;
  id v9;
  void *v10;
  id v11;
  id v12;

  v5 = v4;
  sub_19A959DDC(a1);
  v9 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v10 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithArray_, v10);

  sub_19A990F38();
  v12 = (id)sub_19A990F2C();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v12, a2, a3, a4 & 1);

}

uint64_t sub_19A959DDC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_19A98E300(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D3E0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19A98E300(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_19A98E300(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_19A959AA0(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_19A959F10()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t sub_19A959F28(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t (*sub_19A959F34())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_19A959F84()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t sub_19A959F9C(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t (*sub_19A959FA8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A959FFC()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t sub_19A95A014(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t (*sub_19A95A020())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_19A95A070()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t sub_19A95A088(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t (*sub_19A95A094())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_19A95A0E4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + *a3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3 + 8))
    return 0;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_19A95A158()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t sub_19A95A170(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (a3)
  {
    v6 = sub_19A990D58();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A95A1E8(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t sub_19A95A1F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A95A24C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19A95A2B0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static LinkedDocument.supportsSecureCoding.getter()
{
  return 1;
}

id sub_19A95A39C(uint64_t a1)
{
  char *v1;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  char *v11;
  unint64_t v12;
  char v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char *v25;
  unint64_t v26;
  char v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  char v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  objc_super v57;

  v3 = &v1[OBJC_IVAR___TPSLinkedDocument_bundleId];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v1[OBJC_IVAR___TPSLinkedDocument_documentId];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v1[OBJC_IVAR___TPSLinkedDocument_platform];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v1[OBJC_IVAR___TPSLinkedDocument_product];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v1[OBJC_IVAR___TPSLinkedDocument_productVersion];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = (void *)sub_19A990CBC();
  v57.receiver = v1;
  v57.super_class = (Class)type metadata accessor for LinkedDocument();
  v9 = objc_msgSendSuper2(&v57, sel_initWithDictionary_, v8);
  v10 = v9;

  if (!v10)
  {
    swift_bridgeObjectRelease();
    return 0;
  }

  *(_QWORD *)&v50 = 0x6449656C646E7562;
  *((_QWORD *)&v50 + 1) = 0xE800000000000000;
  v11 = (char *)v10;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v12 = sub_19A979C60((uint64_t)v56), (v13 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v50);
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
  }
  sub_19A95BA78((uint64_t)v56);
  if (*((_QWORD *)&v51 + 1))
  {
    v14 = swift_dynamicCast();
    if (v14)
      v15 = v54;
    else
      v15 = 0;
    if (v14)
      v16 = *((_QWORD *)&v54 + 1);
    else
      v16 = 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v50);
    v15 = 0;
    v16 = 0;
  }
  v17 = &v11[OBJC_IVAR___TPSLinkedDocument_bundleId];
  swift_beginAccess();
  *(_QWORD *)v17 = v15;
  *((_QWORD *)v17 + 1) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v50 = 0x746E656D75636F64;
  *((_QWORD *)&v50 + 1) = 0xEA00000000006449;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v18 = sub_19A979C60((uint64_t)v56), (v19 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v52);
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_19A95BA78((uint64_t)v56);
  if (!*((_QWORD *)&v53 + 1))
  {
    *(_QWORD *)&v54 = 0x64496369706F74;
    *((_QWORD *)&v54 + 1) = 0xE700000000000000;
    sub_19A991124();
    if (*(_QWORD *)(a1 + 16) && (v23 = sub_19A979C60((uint64_t)&v50), (v24 & 1) != 0))
    {
      sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v23, (uint64_t)&v54);
    }
    else
    {
      v55 = 0u;
      v54 = 0u;
    }
    sub_19A95BA78((uint64_t)&v50);
    sub_19A91E1E0((uint64_t)&v52);
    if (*((_QWORD *)&v55 + 1))
      goto LABEL_22;
LABEL_33:
    sub_19A91E1E0((uint64_t)&v54);
    v21 = 0;
    v22 = 0;
    goto LABEL_34;
  }
  sub_19A959AA0(&v52, &v54);
  if (!*((_QWORD *)&v55 + 1))
    goto LABEL_33;
LABEL_22:
  v20 = swift_dynamicCast();
  if (v20)
    v21 = v56[0];
  else
    v21 = 0;
  if (v20)
    v22 = v56[1];
  else
    v22 = 0;
LABEL_34:
  v25 = &v11[OBJC_IVAR___TPSLinkedDocument_documentId];
  swift_beginAccess();
  *(_QWORD *)v25 = v21;
  *((_QWORD *)v25 + 1) = v22;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v50 = 0x6D726F6674616C70;
  *((_QWORD *)&v50 + 1) = 0xE800000000000000;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v26 = sub_19A979C60((uint64_t)v56), (v27 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v26, (uint64_t)&v50);
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
  }
  sub_19A95BA78((uint64_t)v56);
  if (*((_QWORD *)&v51 + 1))
  {
    v28 = swift_dynamicCast();
    if (v28)
      v29 = v52;
    else
      v29 = 0;
    if (v28)
      v30 = *((_QWORD *)&v52 + 1);
    else
      v30 = 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v50);
    v29 = 0;
    v30 = 0;
  }
  v31 = &v11[OBJC_IVAR___TPSLinkedDocument_platform];
  swift_beginAccess();
  *(_QWORD *)v31 = v29;
  *((_QWORD *)v31 + 1) = v30;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v50 = 0x746375646F7270;
  *((_QWORD *)&v50 + 1) = 0xE700000000000000;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v32 = sub_19A979C60((uint64_t)v56), (v33 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v32, (uint64_t)&v50);
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
  }
  sub_19A95BA78((uint64_t)v56);
  if (*((_QWORD *)&v51 + 1))
  {
    v34 = swift_dynamicCast();
    if (v34)
      v35 = v48;
    else
      v35 = 0;
    if (v34)
      v36 = v49;
    else
      v36 = 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v50);
    v35 = 0;
    v36 = 0;
  }
  v37 = &v11[OBJC_IVAR___TPSLinkedDocument_product];
  swift_beginAccess();
  *(_QWORD *)v37 = v35;
  *((_QWORD *)v37 + 1) = v36;
  swift_bridgeObjectRelease();
  strcpy((char *)&v50, "productVersion");
  HIBYTE(v50) = -18;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v38 = sub_19A979C60((uint64_t)v56), (v39 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v38, (uint64_t)&v50);
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19A95BA78((uint64_t)v56);
  if (*((_QWORD *)&v51 + 1))
  {
    v40 = swift_dynamicCast();
    if (v40)
      v41 = v46;
    else
      v41 = 0;
    if (v40)
      v42 = v47;
    else
      v42 = 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v50);
    v41 = 0;
    v42 = 0;
  }
  v43 = &v11[OBJC_IVAR___TPSLinkedDocument_productVersion];
  swift_beginAccess();
  *(_QWORD *)v43 = v41;
  *((_QWORD *)v43 + 1) = v42;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)v17 + 1) || *((_QWORD *)v25 + 1) || *((_QWORD *)v31 + 1))
  {

    return v9;
  }
  v45 = *((_QWORD *)v37 + 1);

  if (v45)
    return v9;

  return 0;
}

id sub_19A95AA38(void *a1)
{
  char *v1;
  char *v2;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  objc_class *v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  void *v24;
  char *v25;
  objc_super v27;

  v2 = v1;
  v4 = &v2[OBJC_IVAR___TPSLinkedDocument_bundleId];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v2[OBJC_IVAR___TPSLinkedDocument_documentId];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v2[OBJC_IVAR___TPSLinkedDocument_platform];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v2[OBJC_IVAR___TPSLinkedDocument_product];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v2[OBJC_IVAR___TPSLinkedDocument_productVersion];
  v9 = (objc_class *)type metadata accessor for LinkedDocument();
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v27.receiver = v2;
  v27.super_class = v9;
  v10 = objc_msgSendSuper2(&v27, sel_initWithCoder_, a1);
  if (v10)
  {
    sub_19A95BA3C();
    v11 = (char *)v10;
    v12 = sub_19A990FEC();
    if (v12)
    {
      v13 = (void *)v12;
      sub_19A990D4C();

    }
    v14 = &v11[OBJC_IVAR___TPSLinkedDocument_bundleId];
    swift_beginAccess();
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    swift_bridgeObjectRelease();
    v15 = sub_19A990FEC();
    if (v15)
    {
      v16 = (void *)v15;
      sub_19A990D4C();

    }
    v17 = &v11[OBJC_IVAR___TPSLinkedDocument_documentId];
    swift_beginAccess();
    *(_QWORD *)v17 = 0;
    *((_QWORD *)v17 + 1) = 0;
    swift_bridgeObjectRelease();
    v18 = sub_19A990FEC();
    if (v18)
    {
      v19 = (void *)v18;
      sub_19A990D4C();

    }
    v20 = &v11[OBJC_IVAR___TPSLinkedDocument_platform];
    swift_beginAccess();
    *(_QWORD *)v20 = 0;
    *((_QWORD *)v20 + 1) = 0;
    swift_bridgeObjectRelease();
    v21 = sub_19A990FEC();
    if (v21)
    {
      v22 = (void *)v21;
      sub_19A990D4C();

    }
    v23 = &v11[OBJC_IVAR___TPSLinkedDocument_product];
    swift_beginAccess();
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0;
    swift_bridgeObjectRelease();
    v24 = (void *)sub_19A990FEC();
    if (v24)
    {
      sub_19A990D4C();

    }
    else
    {

    }
    v25 = &v11[OBJC_IVAR___TPSLinkedDocument_productVersion];
    swift_beginAccess();
    *(_QWORD *)v25 = 0;
    *((_QWORD *)v25 + 1) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return v10;
}

void sub_19A95AD90(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v18.receiver = v1;
  v18.super_class = (Class)type metadata accessor for LinkedDocument();
  objc_msgSendSuper2(&v18, sel_encodeWithCoder_, a1);
  v3 = &v1[OBJC_IVAR___TPSLinkedDocument_bundleId];
  swift_beginAccess();
  if (*((_QWORD *)v3 + 1))
  {
    swift_bridgeObjectRetain();
    v4 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  swift_unknownObjectRelease();

  v6 = &v1[OBJC_IVAR___TPSLinkedDocument_documentId];
  swift_beginAccess();
  if (*((_QWORD *)v6 + 1))
  {
    swift_bridgeObjectRetain();
    v7 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  v9 = &v1[OBJC_IVAR___TPSLinkedDocument_platform];
  swift_beginAccess();
  if (*((_QWORD *)v9 + 1))
  {
    swift_bridgeObjectRetain();
    v10 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  v12 = &v1[OBJC_IVAR___TPSLinkedDocument_product];
  swift_beginAccess();
  if (*((_QWORD *)v12 + 1))
  {
    swift_bridgeObjectRetain();
    v13 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);
  swift_unknownObjectRelease();

  v15 = &v1[OBJC_IVAR___TPSLinkedDocument_productVersion];
  swift_beginAccess();
  if (*((_QWORD *)v15 + 1))
  {
    swift_bridgeObjectRetain();
    v16 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_encodeObject_forKey_, v16, v17);
  swift_unknownObjectRelease();

}

char *sub_19A95B118@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  char *v2;
  objc_class *v5;
  uint64_t (*v6)();
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *result;
  uint64_t v28;
  uint64_t (*v29)();
  objc_super v30;

  v5 = (objc_class *)type metadata accessor for LinkedDocument();
  v30.receiver = v2;
  v30.super_class = v5;
  objc_msgSendSuper2(&v30, sel_copyWithZone_, a1);
  sub_19A9910A0();
  swift_unknownObjectRelease();
  if (swift_dynamicCast())
  {
    v6 = v29;
    v7 = &v2[OBJC_IVAR___TPSLinkedDocument_bundleId];
    swift_beginAccess();
    v9 = *(_QWORD *)v7;
    v8 = *((_QWORD *)v7 + 1);
    v10 = (_QWORD *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_bundleId);
    swift_beginAccess();
    *v10 = v9;
    v10[1] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v11 = &v2[OBJC_IVAR___TPSLinkedDocument_documentId];
    swift_beginAccess();
    v13 = *(_QWORD *)v11;
    v12 = *((_QWORD *)v11 + 1);
    v14 = (_QWORD *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_documentId);
    swift_beginAccess();
    *v14 = v13;
    v14[1] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v15 = &v2[OBJC_IVAR___TPSLinkedDocument_platform];
    swift_beginAccess();
    v17 = *(_QWORD *)v15;
    v16 = *((_QWORD *)v15 + 1);
    v18 = (_QWORD *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_platform);
    swift_beginAccess();
    *v18 = v17;
    v18[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v19 = &v2[OBJC_IVAR___TPSLinkedDocument_product];
    swift_beginAccess();
    v21 = *(_QWORD *)v19;
    v20 = *((_QWORD *)v19 + 1);
    v22 = (_QWORD *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_product);
    swift_beginAccess();
    *v22 = v21;
    v22[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v23 = &v2[OBJC_IVAR___TPSLinkedDocument_productVersion];
    swift_beginAccess();
    v25 = *(_QWORD *)v23;
    v24 = *((_QWORD *)v23 + 1);
    v26 = (_QWORD *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_productVersion);
    swift_beginAccess();
    *v26 = v25;
    v26[1] = v24;
    swift_bridgeObjectRetain();
    result = (char *)swift_bridgeObjectRelease();
  }
  else
  {
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v2;
    v5 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6488);
    a2[1] = (uint64_t (*)())v28;
    result = v2;
    v6 = sub_19A95B714;
  }
  a2[3] = (uint64_t (*)())v5;
  *a2 = v6;
  return result;
}

id LinkedDocument.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LinkedDocument.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LinkedDocument.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkedDocument();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s8TipsCore14LinkedDocumentC06linkedD14FromDictionary10dictionarySDys11AnyHashableVypGSgAH_tFZ_0(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  _QWORD v8[2];
  _BYTE v9[40];
  __int128 v10;
  __int128 v11;

  strcpy((char *)v8, "linkedDocument");
  HIBYTE(v8[1]) = -18;
  sub_19A991124();
  if (*(_QWORD *)(a1 + 16) && (v2 = sub_19A979C60((uint64_t)v9), (v3 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  sub_19A95BA78((uint64_t)v9);
  if (!*((_QWORD *)&v11 + 1))
    goto LABEL_14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6490);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v4 = v8[0];
  v8[0] = 0x7372747461;
  v8[1] = 0xE500000000000000;
  sub_19A991124();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_19A979C60((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_19A91E8A8(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19A95BA78((uint64_t)v9);
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_14:
    sub_19A91E1E0((uint64_t)&v10);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
    return v8[0];
  return 0;
}

uint64_t type metadata accessor for LinkedDocument()
{
  return objc_opt_self();
}

uint64_t sub_19A95B6F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_19A95B714()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_copy);
  sub_19A9910A0();
  return swift_unknownObjectRelease();
}

uint64_t sub_19A95B750@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_bundleId, a2);
}

uint64_t sub_19A95B75C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t sub_19A95B778@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_documentId, a2);
}

uint64_t sub_19A95B784(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t sub_19A95B7A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_platform, a2);
}

uint64_t sub_19A95B7AC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t sub_19A95B7C8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_product, a2);
}

uint64_t sub_19A95B7D4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t sub_19A95B7F0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_productVersion, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A95B84C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t method lookup function for LinkedDocument()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LinkedDocument.bundleId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of LinkedDocument.bundleId.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of LinkedDocument.bundleId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LinkedDocument.platform.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LinkedDocument.platform.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LinkedDocument.platform.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of LinkedDocument.product.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of LinkedDocument.product.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of LinkedDocument.product.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_19A95BA3C()
{
  unint64_t result;

  result = qword_1ED03D3F0;
  if (!qword_1ED03D3F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED03D3F0);
  }
  return result;
}

uint64_t sub_19A95BA78(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t URL.TipSchemeAction.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 40);
  if (*(_BYTE *)(v0 + 64))
  {
    if (*(_BYTE *)(v0 + 64) != 1)
      return sub_19A99134C();
    v4 = *(_QWORD *)(v0 + 56);
    sub_19A99134C();
    if (v1)
    {
      sub_19A991358();
      swift_bridgeObjectRetain();
      sub_19A990DA0();
      swift_bridgeObjectRelease();
      if (v2)
        goto LABEL_5;
    }
    else
    {
      sub_19A991358();
      if (v2)
      {
LABEL_5:
        sub_19A991358();
        swift_bridgeObjectRetain();
        sub_19A990DA0();
        swift_bridgeObjectRelease();
        if (v3)
          goto LABEL_6;
LABEL_15:
        sub_19A991358();
        if (v4)
          goto LABEL_19;
        return sub_19A991358();
      }
    }
    sub_19A991358();
    if (v3)
    {
LABEL_6:
      sub_19A991358();
      swift_bridgeObjectRetain();
      sub_19A990DA0();
      swift_bridgeObjectRelease();
      if (!v4)
        return sub_19A991358();
LABEL_19:
      sub_19A991358();
      swift_bridgeObjectRetain();
      sub_19A990DA0();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_15;
  }
  sub_19A99134C();
  if (v1)
  {
    sub_19A991358();
    swift_bridgeObjectRetain();
    sub_19A990DA0();
    swift_bridgeObjectRelease();
    if (v2)
      goto LABEL_10;
  }
  else
  {
    sub_19A991358();
    if (v2)
    {
LABEL_10:
      sub_19A991358();
      swift_bridgeObjectRetain();
      sub_19A990DA0();
      swift_bridgeObjectRelease();
      if (!v3)
        return sub_19A991358();
      goto LABEL_19;
    }
  }
  sub_19A991358();
  if (v3)
    goto LABEL_19;
  return sub_19A991358();
}

uint64_t URL.TipSchemeAction.hashValue.getter()
{
  sub_19A991340();
  URL.TipSchemeAction.hash(into:)();
  return sub_19A991364();
}

uint64_t sub_19A95BD20()
{
  sub_19A991340();
  URL.TipSchemeAction.hash(into:)();
  return sub_19A991364();
}

uint64_t sub_19A95BD7C()
{
  sub_19A991340();
  URL.TipSchemeAction.hash(into:)();
  return sub_19A991364();
}

uint64_t URL.isTipsScheme.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = sub_19A990A10();
  v2 = v1;
  v3 = sub_19A990D58();
  if (v2)
  {
    if (v0 == v3 && v2 == v4)
      v6 = 1;
    else
      v6 = sub_19A991298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  swift_bridgeObjectRelease();
  return v6 & 1;
}

double URL.action.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  double result;
  char v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[3];

  v2 = sub_19A990A10();
  v4 = v3;
  v5 = sub_19A990D58();
  if (!v4)
    goto LABEL_18;
  if (v2 == v5 && v4 == v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_19A991298();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_19;
  }
  v9 = sub_19A9909F8();
  v11 = v10;
  v12 = sub_19A990D58();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    sub_19A990D58();
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v12 != v9 || v11 != v13)
  {
    v15 = sub_19A991298();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_22;
    if (sub_19A990D58() == v9 && v11 == v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = sub_19A991298();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
        goto LABEL_19;
    }
    v22 = _s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0();
    if (v22)
    {
      v23 = v22;
      v25 = *(_QWORD *)&v22[OBJC_IVAR___TPSUserGuide_identifier];
      v24 = *(_QWORD *)&v22[OBJC_IVAR___TPSUserGuide_identifier + 8];
      swift_getKeyPath();
      *(_QWORD *)&v35[0] = v23;
      sub_19A95CC28();
      swift_bridgeObjectRetain();
      sub_19A990B3C();
      swift_release();
      v26 = &v23[OBJC_IVAR___TPSUserGuide__topicIdentifier];
      swift_beginAccess();
      v28 = *(_QWORD *)v26;
      v27 = *((_QWORD *)v26 + 1);
      v29 = &v23[OBJC_IVAR___TPSUserGuide_version];
      swift_beginAccess();
      v31 = *(_QWORD *)v29;
      v30 = *((_QWORD *)v29 + 1);
      v32 = &v23[OBJC_IVAR___TPSUserGuide_referrer];
      swift_beginAccess();
      v34 = *(_QWORD *)v32;
      v33 = *((_QWORD *)v32 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();

      *(_QWORD *)a1 = v25;
      *(_QWORD *)(a1 + 8) = v24;
      *(_QWORD *)(a1 + 16) = v28;
      *(_QWORD *)(a1 + 24) = v27;
      *(_QWORD *)(a1 + 32) = v31;
      *(_QWORD *)(a1 + 40) = v30;
      *(_QWORD *)(a1 + 48) = v34;
      *(_QWORD *)(a1 + 56) = v33;
      v17 = 1;
      goto LABEL_20;
    }
LABEL_19:
    result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    v17 = 2;
LABEL_20:
    *(_BYTE *)(a1 + 64) = v17;
    return result;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  swift_bridgeObjectRelease();
  sub_19A95C160((uint64_t *)v35);
  result = *(double *)v35;
  v18 = v35[1];
  v19 = v35[2];
  *(_OWORD *)a1 = v35[0];
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = v19;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  return result;
}

void sub_19A95C160(uint64_t *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  id v30;
  id v31;
  id v32;
  char *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B64A8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_19A9908F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_19A990A10();
  v10 = v9;
  v11 = sub_19A990D58();
  if (v10)
  {
    if (v8 == v11 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_19A991298();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        goto LABEL_12;
    }
    sub_19A990890();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_19A95D0D4((uint64_t)v3);
LABEL_12:
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      goto LABEL_13;
    }
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_19A990878();
    v20 = (void *)objc_opt_self();
    sub_19A990860();
    v21 = (void *)sub_19A990E30();
    swift_bridgeObjectRelease();
    v35 = 0;
    v36[0] = 0;
    v34 = 0;
    objc_msgSend(v20, sel_getValuesFromOpenURLSchemeQueryItems_tipIdentifier_collectionIdentifier_referrer_, v21, v36, &v35, &v34);

    v22 = v34;
    v17 = (void *)v36[0];
    v31 = v35;
    if (v35)
    {
      v15 = sub_19A990D58();
      v16 = v23;
      v32 = v17;
      if (v17)
        goto LABEL_16;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v32 = (id)v36[0];
      if (v36[0])
      {
LABEL_16:
        v17 = (void *)sub_19A990D58();
        v10 = v24;
        v33 = v7;
        if (v22)
        {
LABEL_17:
          v18 = sub_19A990D58();
          v19 = v25;
LABEL_21:
          v29 = *(void (**)(char *, uint64_t))(v5 + 8);
          v30 = v22;
          v26 = v31;
          v27 = v32;
          v29(v33, v4);

          goto LABEL_22;
        }
LABEL_20:
        v18 = 0;
        v19 = 0;
        goto LABEL_21;
      }
    }
    v10 = 0;
    v33 = v7;
    if (v22)
      goto LABEL_17;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  v15 = 0;
  v16 = 0;
  v17 = 0;
LABEL_13:
  v18 = 0;
  v19 = 0;
LABEL_22:
  *a1 = v15;
  a1[1] = v16;
  a1[2] = (uint64_t)v17;
  a1[3] = v10;
  a1[4] = v18;
  a1[5] = v19;
}

uint64_t sub_19A95C46C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_19A95CC28();
  sub_19A990B3C();
  swift_release();
  v4 = (_QWORD *)(v3 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  v5 = v4[1];
  *a2 = *v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A95C504()
{
  swift_getKeyPath();
  sub_19A95CC28();
  swift_bridgeObjectRetain();
  sub_19A990B30();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t _s10Foundation3URLV8TipsCoreE15TipSchemeActionO2eeoiySbAF_AFtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
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
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
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
  char v63;
  char v64;
  char v65;
  char v66;
  uint64_t v67;
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
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[8];
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(unsigned __int8 *)(a1 + 64);
  v11 = *(_QWORD *)a2;
  v12 = *(_QWORD *)(a2 + 8);
  v14 = *(_QWORD *)(a2 + 16);
  v13 = *(_QWORD *)(a2 + 24);
  v15 = *(_QWORD *)(a2 + 32);
  v16 = *(_QWORD *)(a2 + 40);
  v17 = *(_QWORD *)(a2 + 48);
  v18 = *(_QWORD *)(a2 + 56);
  v19 = *(unsigned __int8 *)(a2 + 64);
  v87[0] = *(_QWORD *)a1;
  v87[1] = v3;
  v85 = v6;
  v86 = v5;
  v87[2] = v5;
  v87[3] = v4;
  v87[4] = v6;
  v87[5] = v7;
  v87[6] = v8;
  v87[7] = v9;
  v83 = v9;
  v84 = v8;
  v88 = v10;
  v89 = v11;
  v90 = v12;
  v91 = v14;
  v92 = v13;
  v93 = v15;
  v94 = v16;
  v95 = v17;
  v96 = v18;
  v97 = v19;
  if (!v10)
  {
    if (v19)
      goto LABEL_19;
    if (v3)
    {
      if (!v12)
        goto LABEL_56;
      if (v2 != v11 || v3 != v12)
      {
        v70 = v2;
        v77 = v4;
        v22 = v7;
        v23 = sub_19A991298();
        v2 = v70;
        v4 = v77;
        v7 = v22;
        if ((v23 & 1) == 0)
          goto LABEL_56;
      }
    }
    else if (v12)
    {
      goto LABEL_56;
    }
    if (v4)
    {
      if (v13)
      {
        if (v86 == v14 && v4 == v13
          || (v72 = v2, v79 = v4, v34 = v7, v35 = sub_19A991298(), v2 = v72, v4 = v79, v7 = v34, (v35 & 1) != 0))
        {
LABEL_38:
          if (v7)
          {
            if (!v16)
            {
              v40 = v11;
              v41 = v12;
              v42 = v14;
              v25 = v4;
              v43 = v13;
              v44 = v15;
              v27 = v7;
              v45 = 0;
              goto LABEL_57;
            }
            v73 = v2;
            v80 = v4;
            if (v85 == v15 && v7 == v16)
            {
              v36 = v13;
              v37 = v7;
              sub_19A95CCE8(v11, v12, v14, v36, v85, v7, v17, v18, 0);
              sub_19A95CCE8(v73, v3, v86, v80, v85, v37, v84, v83, 0);
              goto LABEL_43;
            }
            v68 = v7;
            v65 = sub_19A991298();
            sub_19A95CCE8(v11, v12, v14, v13, v15, v16, v17, v18, 0);
            sub_19A95CCE8(v73, v3, v86, v80, v85, v68, v84, v83, 0);
            sub_19A95D130((uint64_t)v87);
            if ((v65 & 1) == 0)
              return 0;
          }
          else
          {
            v47 = v11;
            v48 = v4;
            v49 = v17;
            v50 = v2;
            sub_19A95CCE8(v47, v12, v14, v13, v15, v16, v49, v18, 0);
            sub_19A95CCE8(v50, v3, v86, v48, v85, 0, v84, v83, 0);
            swift_bridgeObjectRetain();
            sub_19A95D130((uint64_t)v87);
            if (v16)
              goto LABEL_61;
          }
          return 1;
        }
      }
    }
    else if (!v13)
    {
      goto LABEL_38;
    }
LABEL_56:
    v40 = v11;
    v41 = v12;
    v42 = v14;
    v25 = v4;
    v43 = v13;
    v44 = v15;
    v27 = v7;
    v45 = v16;
LABEL_57:
    v46 = v17;
    v29 = v2;
    sub_19A95CCE8(v40, v41, v42, v43, v44, v45, v46, v18, 0);
    v64 = 0;
    goto LABEL_21;
  }
  if (v10 != 1)
  {
    if (v19 != 2 || v12 | v11 | v14 | v13 | v15 | v16 | v17 | v18)
      goto LABEL_19;
LABEL_43:
    sub_19A95D130((uint64_t)v87);
    return 1;
  }
  if (v19 == 1)
  {
    if (v3)
    {
      if (!v12)
        goto LABEL_59;
      if (v2 != v11 || v3 != v12)
      {
        v69 = v2;
        v76 = v4;
        v20 = v7;
        v21 = sub_19A991298();
        v2 = v69;
        v4 = v76;
        v7 = v20;
        if ((v21 & 1) == 0)
          goto LABEL_59;
      }
    }
    else if (v12)
    {
      goto LABEL_59;
    }
    if (v4)
    {
      if (!v13)
        goto LABEL_59;
      if (v86 != v14 || v4 != v13)
      {
        v71 = v2;
        v78 = v4;
        v32 = v7;
        v33 = sub_19A991298();
        v2 = v71;
        v4 = v78;
        v7 = v32;
        if ((v33 & 1) == 0)
          goto LABEL_59;
      }
    }
    else if (v13)
    {
      goto LABEL_59;
    }
    if (v7)
    {
      if (v16)
      {
        if (v85 == v15 && v7 == v16)
          goto LABEL_50;
        v74 = v2;
        v81 = v4;
        v38 = v7;
        v39 = sub_19A991298();
        v2 = v74;
        v4 = v81;
        v7 = v38;
        if ((v39 & 1) != 0)
          goto LABEL_50;
      }
    }
    else if (!v16)
    {
LABEL_50:
      if (v83)
      {
        if (v18)
        {
          v67 = v7;
          v75 = v2;
          v82 = v4;
          if (v84 == v17 && v83 == v18)
          {
            v30 = 1;
            sub_19A95CCE8(v11, v12, v14, v13, v15, v16, v84, v83, 1);
            sub_19A95CCE8(v75, v3, v86, v82, v85, v67, v84, v83, 1);
            sub_19A95D130((uint64_t)v87);
            return v30;
          }
          v66 = sub_19A991298();
          v30 = 1;
          sub_19A95CCE8(v11, v12, v14, v13, v15, v16, v17, v18, 1);
          sub_19A95CCE8(v75, v3, v86, v82, v85, v67, v84, v83, 1);
          sub_19A95D130((uint64_t)v87);
          if ((v66 & 1) != 0)
            return v30;
          return 0;
        }
        v57 = v11;
        v58 = v4;
        v59 = v13;
        v60 = v15;
        v61 = v7;
        v62 = v2;
        sub_19A95CCE8(v57, v12, v14, v59, v60, v16, v17, 0, 1);
        sub_19A95CCE8(v62, v3, v86, v58, v85, v61, v84, v83, 1);
        goto LABEL_22;
      }
      v30 = 1;
      v51 = v11;
      v52 = v4;
      v53 = v15;
      v54 = v7;
      v55 = v17;
      v56 = v2;
      sub_19A95CCE8(v51, v12, v14, v13, v53, v16, v55, v18, 1);
      sub_19A95CCE8(v56, v3, v86, v52, v85, v54, v84, 0, 1);
      swift_bridgeObjectRetain();
      sub_19A95D130((uint64_t)v87);
      if (!v18)
        return v30;
LABEL_61:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_59:
    LOBYTE(v10) = 1;
    v63 = 1;
    goto LABEL_20;
  }
LABEL_19:
  v63 = v19;
LABEL_20:
  v24 = v11;
  v25 = v4;
  v26 = v15;
  v27 = v7;
  v28 = v17;
  v29 = v2;
  sub_19A95CCE8(v24, v12, v14, v13, v26, v16, v28, v18, v63);
  v64 = v10;
LABEL_21:
  sub_19A95CCE8(v29, v3, v86, v25, v85, v27, v84, v83, v64);
LABEL_22:
  sub_19A95D130((uint64_t)v87);
  return 0;
}

unint64_t sub_19A95CC28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6498;
  if (!qword_1EE3B6498)
  {
    v1 = type metadata accessor for UserGuide();
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for UserGuide, v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6498);
  }
  return result;
}

unint64_t sub_19A95CC74()
{
  unint64_t result;

  result = qword_1EE3B64A0;
  if (!qword_1EE3B64A0)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for URL.TipSchemeAction, &type metadata for URL.TipSchemeAction);
    atomic_store(result, (unint64_t *)&qword_1EE3B64A0);
  }
  return result;
}

uint64_t _s15TipSchemeActionOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_19A95CCE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  if (a9)
  {
    if (a9 != 1)
      return result;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t _s15TipSchemeActionOwxx(uint64_t a1)
{
  return sub_19A95CD98(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
}

uint64_t sub_19A95CD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = a2;
  if (a9)
  {
    if (a9 != 1)
      return result;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s15TipSchemeActionOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_19A95CCE8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  return a1;
}

uint64_t _s15TipSchemeActionOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_19A95CCE8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_BYTE *)(a1 + 64);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  sub_19A95CD98(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s15TipSchemeActionOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;

  v3 = *(_BYTE *)(a2 + 64);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 64);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(_BYTE *)(a1 + 64) = v3;
  sub_19A95CD98(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s15TipSchemeActionOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s15TipSchemeActionOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_BYTE *)(result + 64) = -(char)a2;
  }
  return result;
}

uint64_t sub_19A95D080(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 64) <= 1u)
    return *(unsigned __int8 *)(a1 + 64);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_19A95D098(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_QWORD *)(result + 56) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for URL.TipSchemeAction()
{
  return &type metadata for URL.TipSchemeAction;
}

uint64_t sub_19A95D0D4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B64A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19A95D114()
{
  uint64_t *v0;

  return sub_19A969444(v0[2], v0[3], v0[4]);
}

uint64_t sub_19A95D130(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v8 = *(_QWORD *)(a1 + 120);
  v9 = *(_QWORD *)(a1 + 128);
  v10 = *(_BYTE *)(a1 + 136);
  sub_19A95CD98(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  sub_19A95CD98(v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return a1;
}

id TPSAnalyticsChecklistSessionController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_19A95D278()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19A95D304(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_19A95D34C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_19A95D3D4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19A95D460(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_19A95D4A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_19A95D4EC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_19A95D574()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_19A95D600(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_19A95D648())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A95D6D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_19A95D75C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_19A95D7A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_19A95D7E8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  char *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  __int128 aBlock;
  void (*v27)(uint64_t, void *);
  void *v28;
  uint64_t (*v29)(uint64_t);
  uint64_t v30;

  v1 = v0;
  v2 = sub_19A990ADC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession];
  swift_beginAccess();
  if ((*v6 & 1) == 0)
  {
    type metadata accessor for TipsDefaultsManager();
    sub_19A91DE2C(0x2Bu, &aBlock);
    if (v28)
    {
      if ((swift_dynamicCast() & 1) != 0 && v25 != 0.0)
        *(double *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout] = v25;
    }
    else
    {
      sub_19A90A538((uint64_t)&aBlock, &qword_1ED03D570);
    }
    if (qword_1ED03D590 != -1)
      swift_once();
    v7 = (id)qword_1ED03D598;
    v8 = sub_19A990F98();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v24 = v2;
      v11 = v10;
      *(_QWORD *)&aBlock = v10;
      *(_DWORD *)v9 = 136315138;
      v25 = COERCE_DOUBLE(sub_19A91E7D8(0xD000000000000031, 0x800000019A99F400, (uint64_t *)&aBlock));
      sub_19A991058();
      _os_log_impl(&dword_19A906000, v7, v8, "%s", v9, 0xCu);
      swift_arrayDestroy();
      v12 = v11;
      v2 = v24;
      MEMORY[0x19AECE318](v12, -1, -1);
      MEMORY[0x19AECE318](v9, -1, -1);
    }

    v13 = (void *)objc_opt_self();
    sub_19A990AD0();
    v14 = (void *)sub_19A990AA0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v15 = (void *)sub_19A990D34();
    objc_msgSend(v13, sel_persistObject_forKey_, v14, v15);

    *v6 = 1;
    v16 = (void *)objc_opt_self();
    v17 = *(double *)&v1[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout];
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v1;
    v29 = sub_19A95EA40;
    v30 = v18;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v27 = sub_19A95DD88;
    v28 = &block_descriptor;
    v19 = _Block_copy(&aBlock);
    v20 = v1;
    swift_release();
    v21 = objc_msgSend(v16, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v19, v17);
    _Block_release(v19);
    v22 = *(void **)&v20[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer];
    *(_QWORD *)&v20[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer] = v21;

  }
}

uint64_t sub_19A95DB88(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v9[2];

  if (qword_1ED03D590 != -1)
    swift_once();
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  v3 = (id)qword_1ED03D598;
  sub_19A991160();
  sub_19A990DAC();
  v4 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout;
  sub_19A990F14();
  v5 = sub_19A990F98();
  if (os_log_type_enabled(v3, v5))
  {
    swift_bridgeObjectRetain_n();
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v9[0] = v7;
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(0, 0xE000000000000000, v9);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v3, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v7, -1, -1);
    MEMORY[0x19AECE318](v6, -1, -1);
  }

  swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = *(_QWORD *)(a2 + v4);
  return sub_19A95E20C();
}

void sub_19A95DD88(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_19A95DE0C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  double v19;
  double v20;
  void (*v21)(char *, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30[4];

  v1 = v0;
  v2 = sub_19A990ADC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v27 - v13;
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_19A990D34();
  v17 = objc_msgSend(v15, sel_persistedObjectForKey_, v16);

  if (v17)
  {
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v29, 0, sizeof(v29));
  }
  sub_19A91E3C0((uint64_t)v29, (uint64_t)v30);
  if (v30[3])
  {
    v18 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v14, v18 ^ 1u, 1, v2);
  }
  else
  {
    sub_19A90A538((uint64_t)v30, &qword_1ED03D570);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v14, 1, 1, v2);
  }
  sub_19A95ED9C((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
  {
    sub_19A90A538((uint64_t)v12, &qword_1ED03D380);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v12, v2);
    sub_19A990AD0();
    sub_19A990A94();
    v20 = v19;
    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v6, v2);
    if (v20 >= 600.0)
    {
      if (qword_1ED03D590 != -1)
        swift_once();
      v22 = (id)qword_1ED03D598;
      v23 = sub_19A990F98();
      if (os_log_type_enabled(v22, v23))
      {
        v28 = v1;
        v24 = (uint8_t *)swift_slowAlloc();
        v25 = swift_slowAlloc();
        v30[0] = v25;
        *(_DWORD *)v24 = 136315138;
        *(_QWORD *)&v29[0] = sub_19A91E7D8(0xD000000000000033, 0x800000019A99F480, v30);
        v1 = v28;
        sub_19A991058();
        _os_log_impl(&dword_19A906000, v22, v23, "%s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECE318](v25, -1, -1);
        MEMORY[0x19AECE318](v24, -1, -1);
      }

      *(_QWORD *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = 0x4082C00000000000;
      sub_19A95E20C();
    }
    v21(v8, v2);
  }
  return sub_19A90A538((uint64_t)v14, &qword_1ED03D380);
}

uint64_t sub_19A95E20C()
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
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  float v36;
  char *v37;
  char v38;
  uint64_t v39;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[3];
  _OWORD v46[2];
  _BYTE v47[24];
  uint64_t v48;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19A990ADC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v41 - v10;
  v12 = (void *)objc_opt_self();
  v13 = (void *)sub_19A990D34();
  v14 = objc_msgSend(v12, sel_persistedObjectForKey_, v13);

  if (v14)
  {
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v46, 0, sizeof(v46));
  }
  sub_19A91E3C0((uint64_t)v46, (uint64_t)v47);
  if (!v48)
  {
    sub_19A90A538((uint64_t)v47, &qword_1ED03D570);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    return sub_19A90A538((uint64_t)v4, &qword_1ED03D380);
  }
  v15 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, v15 ^ 1u, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_19A90A538((uint64_t)v4, &qword_1ED03D380);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
  v16 = (_BYTE *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  if (*v16 == 1)
  {
    v17 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount);
    swift_beginAccess();
    if (*((_BYTE *)v17 + 8) != 1)
    {
      v18 = *v17;
      objc_msgSend(*(id *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer), sel_invalidate);
      v19 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent;
      v20 = *(double *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent);
      v43 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent;
      if (v20 == 0.0)
      {
        if (qword_1ED03D590 != -1)
          swift_once();
        v21 = (id)qword_1ED03D598;
        v22 = sub_19A990F98();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          v24 = swift_slowAlloc();
          v45[0] = v24;
          v42 = v18;
          *(_DWORD *)v23 = 136315138;
          v41 = v23 + 4;
          v44 = sub_19A91E7D8(0xD000000000000046, 0x800000019A99F4E0, v45);
          v18 = v42;
          sub_19A991058();
          _os_log_impl(&dword_19A906000, v21, v22, "%s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x19AECE318](v24, -1, -1);
          MEMORY[0x19AECE318](v23, -1, -1);
        }

        sub_19A990AD0();
        sub_19A990A94();
        v26 = v25;
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        v19 = v43;
        *(_QWORD *)(v1 + v43) = v26;
      }
      if (qword_1ED03D590 != -1)
        swift_once();
      v27 = (id)qword_1ED03D598;
      v28 = sub_19A990F98();
      if (os_log_type_enabled(v27, v28))
      {
        v42 = v18;
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v45[0] = v30;
        *(_DWORD *)v29 = 136315138;
        v44 = sub_19A91E7D8(0xD00000000000001FLL, 0x800000019A99F4C0, v45);
        v18 = v42;
        sub_19A991058();
        _os_log_impl(&dword_19A906000, v27, v28, "%s", v29, 0xCu);
        swift_arrayDestroy();
        v31 = v30;
        v19 = v43;
        MEMORY[0x19AECE318](v31, -1, -1);
        MEMORY[0x19AECE318](v29, -1, -1);
      }

      v32 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
      swift_beginAccess();
      v33 = *v32;
      v34 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
      swift_beginAccess();
      v35 = *v34;
      v36 = *(double *)(v1 + v19);
      v37 = (char *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
      swift_beginAccess();
      v38 = *v37;
      type metadata accessor for TPSAnalyticsChecklistSession();
      v39 = swift_allocObject();
      *(_BYTE *)(v39 + 69) = 0;
      *(_QWORD *)(v39 + 40) = v18;
      *(_QWORD *)(v39 + 48) = v33;
      *(_QWORD *)(v39 + 56) = v35;
      *(float *)(v39 + 64) = v36;
      *(_BYTE *)(v39 + 68) = v38;
      TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019A99F150);
      sub_19A97606C();
      swift_release();
      sub_19A95E880();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

void sub_19A95E880()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  swift_beginAccess();
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
  *(_QWORD *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = 0;
  v2 = (_QWORD *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  *v2 = 0;
  v3 = (_QWORD *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  *v3 = 0;
  v4 = (_BYTE *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  *v4 = 0;
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_19A990F5C();
  v7 = (void *)sub_19A990D34();
  objc_msgSend(v5, sel_persistObject_forKey_, v6, v7);

}

id TPSAnalyticsChecklistSessionController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAnalyticsChecklistSessionController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19A95EA1C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_19A95EA40(uint64_t a1)
{
  uint64_t v1;

  return sub_19A95DB88(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_19A95EA48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_19A95EADC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_19A95EC50(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_19A95EC50(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19A95EADC(uint64_t a1, unint64_t a2)
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
      v3 = sub_19A96EDC8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_19A99116C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_19A9911B4();
      __break(1u);
LABEL_10:
      v2 = sub_19A990DB8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_19A991208();
    __break(1u);
LABEL_14:
    result = sub_19A9911B4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

uint64_t sub_19A95EC50(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B64E0);
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
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A95ED9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A95EDE4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch, a2);
}

uint64_t sub_19A95EDF0(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
}

uint64_t sub_19A95EDFC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession, a2);
}

uint64_t keypath_getTm_0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_19A95EE54(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
}

uint64_t keypath_setTm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_19A95EEA8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 8);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_19A95EF00(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  result = swift_beginAccess();
  *(_QWORD *)v4 = v2;
  *(_BYTE *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_19A95EF5C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount, a2);
}

uint64_t sub_19A95EF68(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
}

uint64_t sub_19A95EF74@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted, a2);
}

uint64_t keypath_get_5Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_19A95EFCC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
}

uint64_t keypath_set_6Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_19A95F020()
{
  return type metadata accessor for TPSAnalyticsChecklistSessionController();
}

uint64_t method lookup function for TPSAnalyticsChecklistSessionController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.startSession()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.continueSession()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.stopSession()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t TPSSavedTipEntry.tipIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
}

uint64_t TPSSavedTipEntry.tipIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
}

uint64_t (*TPSSavedTipEntry.tipIdentifier.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t TPSSavedTipEntry.savedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  v4 = sub_19A990ADC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TPSSavedTipEntry.savedDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  v4 = sub_19A990ADC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*TPSSavedTipEntry.savedDate.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_19A95F504()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TPSSavedTipEntry.lastUsedVersion.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
}

uint64_t sub_19A95F580(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v6 = sub_19A990D58();
  v8 = v7;
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t TPSSavedTipEntry.lastUsedVersion.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
}

uint64_t (*TPSSavedTipEntry.lastUsedVersion.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TPSSavedTipEntry.__allocating_init(tipIdentifier:savedDate:lastUsedVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  objc_super v19;

  v11 = (char *)objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v11[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  v14 = sub_19A990ADC();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  v16 = &v11[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
  *(_QWORD *)v16 = a4;
  *((_QWORD *)v16 + 1) = a5;
  v19.receiver = v11;
  v19.super_class = v5;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v17;
}

id TPSSavedTipEntry.init(tipIdentifier:savedDate:lastUsedVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  objc_class *ObjectType;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v12 = &v5[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v5[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  v14 = sub_19A990ADC();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  v16 = &v5[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
  *(_QWORD *)v16 = a4;
  *((_QWORD *)v16 + 1) = a5;
  v19.receiver = v5;
  v19.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v17;
}

id TPSSavedTipEntry.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TPSSavedTipEntry.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPSSavedTipEntry.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static TPSSavedTipEntry.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall TPSSavedTipEntry.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v2 = v1;
  v4 = sub_19A990ADC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9);

  v10 = v2 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  v11 = (void *)sub_19A990AA0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v13 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v13, v14);

}

id TPSSavedTipEntry.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPSSavedTipEntry.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v30 - v8;
  v10 = sub_19A990ADC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v14 = sub_19A990FEC();
  if (!v14 || (v15 = (void *)v14, v34 = 0, v35 = 0, sub_19A990D4C(), v15, !v35))
  {

LABEL_13:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v33 = v35;
  v32 = v34;
  sub_19A90A170(0, &qword_1EE3B64F8);
  v16 = sub_19A990FEC();
  if (!v16)
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    goto LABEL_11;
  }
  v17 = (void *)v16;
  v31 = v13;
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v18(v7, 1, 1, v10);
  sub_19A9600B4();
  sub_19A991214();

  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v19(v7, 1, v10) == 1)
  {
LABEL_11:
    v18(v9, 1, 1, v10);
    goto LABEL_12;
  }
  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v20(v9, v7, v10);
  v18(v9, 0, 1, v10);
  if (v19(v9, 1, v10) == 1)
  {
LABEL_12:

    swift_bridgeObjectRelease();
    sub_19A960074((uint64_t)v9);
    goto LABEL_13;
  }
  v21 = v31;
  v20(v31, v9, v10);
  v22 = sub_19A990FEC();
  if (!v22 || (v23 = (void *)v22, v34 = 0, v35 = 0, sub_19A990D4C(), v23, !v35))
  {

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v10);
    goto LABEL_13;
  }
  v24 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v25 = (void *)sub_19A990AA0();
  v26 = v21;
  v27 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v2, sel_initWithTipIdentifier_savedDate_lastUsedVersion_, v24, v25, v27);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v26, v10);
  return v28;
}

uint64_t sub_19A960074(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_19A9600B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6500;
  if (!qword_1EE3B6500)
  {
    v1 = sub_19A990ADC();
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0CB08E8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6500);
  }
  return result;
}

uint64_t sub_19A9600FC()
{
  return type metadata accessor for TPSSavedTipEntry();
}

uint64_t type metadata accessor for TPSSavedTipEntry()
{
  uint64_t result;

  result = qword_1ED03D3A0;
  if (!qword_1ED03D3A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19A960140()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A990ADC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TPSSavedTipEntry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSSavedTipEntry.__allocating_init(tipIdentifier:savedDate:lastUsedVersion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

Swift::Void __swiftcall TipsLog.error(_:)(Swift::String a1)
{
  sub_19A91E22C(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x1E0DF2280]);
}

Swift::Void __swiftcall TipsLog.fault(_:)(Swift::String a1)
{
  sub_19A91E22C(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x1E0DF2288]);
}

id static TipsLog.analytics.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D590, (void **)&qword_1ED03D598, a1);
}

uint64_t sub_19A960224(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x6E6F6D656144, 0xE600000000000000, &qword_1ED03CFD0);
}

id static TipsLog.daemon.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03CFD8, (void **)&qword_1ED03CFD0, a1);
}

id static TipsLog.data.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D5D0, (void **)&qword_1ED03D5D8, a1);
}

uint64_t sub_19A960278(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x7265766F63736944, 0xEF7974696C696261, &qword_1ED03CFB0);
}

id static TipsLog.discoverability.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03CFC8, (void **)&qword_1ED03CFB0, a1);
}

uint64_t sub_19A9602C0(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x6E69746567726154, 0xE900000000000067, (uint64_t *)&unk_1ED03CFE0);
}

id static TipsLog.targeting.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(qword_1ED03CFF0, qword_1ED03CFE0, a1);
}

uint64_t sub_19A960300(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x74694B706954, 0xE600000000000000, (uint64_t *)&unk_1ED03D578);
}

id static TipsLog.tipkit.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D588, (void **)&unk_1ED03D578, a1);
}

uint64_t sub_19A960338(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x656D6F636C6557, 0xE700000000000000, (uint64_t *)&unk_1ED03D180);
}

id static TipsLog.welcome.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D190, (void **)&unk_1ED03D180, a1);
}

uint64_t sub_19A960374(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x746567646957, 0xE600000000000000, (uint64_t *)&unk_1ED03D1A0);
}

id static TipsLog.widget.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1ED03D198, (void **)&unk_1ED03D1A0, a1);
}

uint64_t sub_19A9603AC(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x676E697865646E49, 0xE800000000000000, &qword_1ED03D168);
}

uint64_t sub_19A9603CC(uint64_t a1)
{
  return sub_19A9603E8(a1, 0x686372616553, 0xE600000000000000, &qword_1EE3B6508);
}

uint64_t sub_19A9603E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;

  sub_19A908EF8();
  result = sub_19A991028();
  *a4 = result;
  return result;
}

id static TipsLog.search.getter@<X0>(void **a1@<X8>)
{
  return sub_19A90EF1C(&qword_1EE3B6098, (void **)&qword_1EE3B6508, a1);
}

uint64_t Trimmed.wrappedValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19A96049C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v13[2];

  v4 = sub_19A990830();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[1];
  v13[0] = *a1;
  v13[1] = v8;
  swift_bridgeObjectRetain();
  sub_19A990824();
  sub_19A960644();
  v9 = sub_19A99107C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t Trimmed.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[2];

  v3 = v2;
  v6 = sub_19A990830();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = a1;
  v14[1] = a2;
  sub_19A990824();
  sub_19A960644();
  v10 = sub_19A99107C();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *v3 = v10;
  v3[1] = v12;
  return result;
}

unint64_t sub_19A960644()
{
  unint64_t result;

  result = qword_1ED03D348;
  if (!qword_1ED03D348)
  {
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED03D348);
  }
  return result;
}

void (*Trimmed.wrappedValue.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = sub_19A990830();
  v3[7] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[8] = v5;
  v3[9] = malloc(*(_QWORD *)(v5 + 64));
  v6 = v1[1];
  *v3 = *v1;
  v3[1] = v6;
  swift_bridgeObjectRetain();
  return sub_19A9606FC;
}

void sub_19A9606FC(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v6 = (*a1)[8];
  v5 = (void *)(*a1)[9];
  v8 = (uint64_t *)(*a1)[6];
  v7 = (*a1)[7];
  v9 = *a1;
  if ((a2 & 1) != 0)
  {
    v9[2] = v3;
    v9[3] = v4;
    swift_bridgeObjectRetain();
    sub_19A990824();
    sub_19A960644();
    v10 = sub_19A99107C();
    v12 = v11;
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v8 = v10;
    v8[1] = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[4] = v3;
    v9[5] = v4;
    sub_19A990824();
    sub_19A960644();
    v13 = sub_19A99107C();
    v15 = v14;
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v8 = v13;
    v8[1] = v15;
  }
  free(v5);
  free(v2);
}

TipsCore::Trimmed __swiftcall Trimmed.init(wrappedValue:)(Swift::String wrappedValue)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TipsCore::Trimmed result;
  _QWORD v15[2];

  object = wrappedValue._object;
  countAndFlagsBits = wrappedValue._countAndFlagsBits;
  v4 = v1;
  v5 = sub_19A990830();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v15[0] = countAndFlagsBits;
  v15[1] = object;
  sub_19A990824();
  sub_19A960644();
  v9 = sub_19A99107C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  v12 = swift_bridgeObjectRelease();
  *v4 = v9;
  v4[1] = v11;
  result.value._object = v13;
  result.value._countAndFlagsBits = v12;
  return result;
}

uint64_t sub_19A9608E4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

_QWORD *initializeBufferWithCopyOfBuffer for Trimmed(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Trimmed()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Trimmed(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for Trimmed(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Trimmed(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Trimmed(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Trimmed()
{
  return &type metadata for Trimmed;
}

uint64_t sub_19A960ADC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_19A960B30(uint64_t a1, void *aBlock)
{
  void (*v2)(void (*)(uint64_t), uint64_t);
  void *v3;
  uint64_t v4;

  v2 = *(void (**)(void (*)(uint64_t), uint64_t))(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_19A960FF8, v4);
  swift_release();
  return swift_release();
}

void sub_19A960BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_19A9909B0();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_19A960C74@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t *a1)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_19A961050;
  a2[1] = (uint64_t (*)(uint64_t *))v6;
  return swift_retain();
}

uint64_t sub_19A960CF4(uint64_t *a1, void (*a2)(uint64_t (*)(uint64_t a1), uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  swift_retain();
  a2(sub_19A961058, v5);
  return swift_release();
}

uint64_t sub_19A960D60(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = (uint64_t (**)(uint64_t, uint64_t))(*a2 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  *v6 = sub_19A961024;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_19A960DF0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *))
{
  uint64_t v6;
  _QWORD v8[2];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v8[0] = sub_19A96102C;
  v8[1] = v6;
  swift_retain();
  a3(v8);
  return swift_release();
}

id TPSAsyncBlockOperation.__allocating_init(asyncBlock:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_19A960EC8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id TPSAsyncBlockOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TPSAsyncBlockOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPSAsyncBlockOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TPSAsyncBlockOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSAsyncBlockOperation.asyncBlock.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TPSAsyncBlockOperation.__allocating_init(asyncBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_19A960FCC(void *a1)
{
  uint64_t v1;

  sub_19A9160D8(a1, v1);
}

uint64_t sub_19A960FD4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_19A960FF8(uint64_t a1)
{
  uint64_t v1;

  sub_19A960BA0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_19A961000()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A961024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_19A960DF0(a1, a2, *(void (**)(_QWORD *))(v2 + 16));
}

uint64_t sub_19A96102C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_19A961050(uint64_t *a1)
{
  uint64_t v1;

  return sub_19A960CF4(a1, *(void (**)(uint64_t (*)(uint64_t), uint64_t))(v1 + 16));
}

uint64_t sub_19A961058(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t SearchResult.Item.documentIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
}

uint64_t SearchResult.Item.collectionIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_collectionIdentifier);
}

uint64_t SearchResult.Item.correlationIdentifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
}

uint64_t SearchResult.Item.contentType.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_contentType);
}

uint64_t SearchResult.Item.title.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_title);
}

uint64_t SearchResult.Item.body.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchResultItem_body);
}

double SearchResult.Item.relevance.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSSearchResultItem_relevance;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_19A961258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  objc_super v17;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v9[OBJC_IVAR___TPSSearchResultItem_contentType];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = &v9[OBJC_IVAR___TPSSearchResultItem_title];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v9[OBJC_IVAR___TPSSearchResultItem_body];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  *(_QWORD *)&v9[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
  v14 = &v9[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v9[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v17.receiver = v9;
  v17.super_class = v4;
  return objc_msgSendSuper2(&v17, sel_init);
}

id SearchResult.Item.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SearchResult.Item.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t SearchResult.items.getter()
{
  return sub_19A961664();
}

uint64_t SearchResult.suggestions.getter()
{
  return sub_19A961664();
}

uint64_t sub_19A961664()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

id SearchResult.query.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  return *v1;
}

id sub_19A9617F4(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  objc_super v15;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___TPSSearchResult_items];
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v7[OBJC_IVAR___TPSSearchResult_items] = MEMORY[0x1E0DEE9D8];
  v10 = &v7[OBJC_IVAR___TPSSearchResult_suggestions];
  *(_QWORD *)&v7[OBJC_IVAR___TPSSearchResult_suggestions] = v9;
  *(_QWORD *)&v7[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *(_QWORD *)v8 = a2;
  v11 = v7;
  v12 = a1;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v10 = a3;

  swift_bridgeObjectRelease();
  v15.receiver = v11;
  v15.super_class = v3;
  v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

void SearchResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s8TipsCore12SearchResultC4ItemCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static SearchResult.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchResult.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (id *)(v1 + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v4, v5);

  swift_beginAccess();
  type metadata accessor for SearchResult.Item();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v6, v7);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9);

}

uint64_t type metadata accessor for SearchResult.Item()
{
  return objc_opt_self();
}

id SearchResult.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _BYTE v13[24];
  uint64_t v14;

  v2 = v1;
  type metadata accessor for SearchQuery();
  v4 = sub_19A990FEC();
  if (!v4)
  {

LABEL_14:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v5 = (void *)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D160);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19A99A940;
  v7 = sub_19A90A170(0, (unint64_t *)&unk_1ED03D150);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = type metadata accessor for SearchResult.Item();
  sub_19A990FF8();
  swift_bridgeObjectRelease();
  if (!v14)
  {

LABEL_11:
    sub_19A91E1E0((uint64_t)v13);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6578);
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_13:
    goto LABEL_14;
  }
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_19A99A940;
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  sub_19A990FF8();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v9 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v2, sel_initWithQuery_items_suggestions_, v5, v9, v10);

  return v11;
}

uint64_t SearchResult.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_19A991160();
  sub_19A990DAC();
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  v0 = type metadata accessor for SearchResult.Item();
  v1 = swift_bridgeObjectRetain();
  MEMORY[0x19AECD550](v1, v0);
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  MEMORY[0x19AECD550](v2, MEMORY[0x1E0DEA968]);
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static SearchResult.Item.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchResult.Item.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double *v19;
  double v20;
  void *v21;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  v7 = v1 + OBJC_IVAR___TPSSearchResultItem_correlationIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v7 + 8))
  {
    swift_bridgeObjectRetain();
    v8 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9);
  swift_unknownObjectRelease();

  v10 = v1 + OBJC_IVAR___TPSSearchResultItem_contentType;
  swift_beginAccess();
  if (*(_QWORD *)(v10 + 8))
  {
    swift_bridgeObjectRetain();
    v11 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);
  swift_unknownObjectRelease();

  v13 = v1 + OBJC_IVAR___TPSSearchResultItem_title;
  swift_beginAccess();
  if (*(_QWORD *)(v13 + 8))
  {
    swift_bridgeObjectRetain();
    v14 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v14, v15);
  swift_unknownObjectRelease();

  v16 = v1 + OBJC_IVAR___TPSSearchResultItem_body;
  swift_beginAccess();
  if (*(_QWORD *)(v16 + 8))
  {
    swift_bridgeObjectRetain();
    v17 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v17, v18);
  swift_unknownObjectRelease();

  v19 = (double *)(v1 + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  v20 = *v19;
  v21 = (void *)sub_19A990D34();
  -[objc_class encodeDouble:forKey:](with.super.isa, sel_encodeDouble_forKey_, v21, v20);

}

id SearchResult.Item.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

char *SearchResult.Item.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v2 = v1;
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v4 = sub_19A990FEC();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  v6 = sub_19A990FEC();
  if (!v6)
  {

    a1 = v5;
LABEL_6:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v7 = (void *)v6;
  v8 = objc_msgSend(v2, sel_initWithIdentifier_collectionIdentifier_, v5, v6);

  v9 = (char *)v8;
  v10 = sub_19A990FEC();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = sub_19A990D58();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
  swift_beginAccess();
  *v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRelease();
  v16 = sub_19A990FEC();
  if (v16)
  {
    v17 = (void *)v16;
    v18 = sub_19A990D58();
    v20 = v19;

  }
  else
  {
    v18 = 0;
    v20 = 0;
  }
  v21 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_contentType];
  swift_beginAccess();
  *v21 = v18;
  v21[1] = v20;
  swift_bridgeObjectRelease();
  v22 = sub_19A990FEC();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = sub_19A990D58();
    v26 = v25;

  }
  else
  {
    v24 = 0;
    v26 = 0;
  }
  v27 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_title];
  swift_beginAccess();
  *v27 = v24;
  v27[1] = v26;
  swift_bridgeObjectRelease();
  v28 = sub_19A990FEC();
  if (v28)
  {
    v29 = (void *)v28;
    v30 = sub_19A990D58();
    v32 = v31;

  }
  else
  {
    v30 = 0;
    v32 = 0;
  }
  v33 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_body];
  swift_beginAccess();
  *v33 = v30;
  v33[1] = v32;
  swift_bridgeObjectRelease();
  v34 = (void *)sub_19A990D34();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v34);
  v36 = v35;

  v37 = &v9[OBJC_IVAR___TPSSearchResultItem_relevance];
  swift_beginAccess();
  *(_QWORD *)v37 = v36;
  return v9;
}

id sub_19A962970(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t SearchResult.Item.description.getter()
{
  sub_19A991160();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  sub_19A990F14();
  return 0;
}

uint64_t type metadata accessor for SearchResult()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchResult()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for SearchResult.Item()
{
  return swift_lookUpClassMethod();
}

id sub_19A962C58(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = &v3[OBJC_IVAR___TPSSearchResult_items];
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v3[OBJC_IVAR___TPSSearchResult_items] = MEMORY[0x1E0DEE9D8];
  v10 = &v3[OBJC_IVAR___TPSSearchResult_suggestions];
  *(_QWORD *)&v3[OBJC_IVAR___TPSSearchResult_suggestions] = v9;
  *(_QWORD *)&v3[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *(_QWORD *)v8 = a2;
  v11 = v3;
  v12 = a1;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v10 = a3;

  swift_bridgeObjectRelease();
  v14.receiver = v11;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

void sub_19A962D50()
{
  strcpy((char *)&qword_1EE3B59A8, "com.apple.tips");
  unk_1EE3B59B7 = -18;
}

uint64_t static TPSTip.uti.getter()
{
  uint64_t v0;

  if (qword_1EE3B58D0 != -1)
    swift_once();
  v0 = qword_1EE3B59A8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_19A962DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19A99A990;
  *(_QWORD *)(v0 + 32) = sub_19A990D58();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_19A990D58();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_19A990D58();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = sub_19A990D58();
  *(_QWORD *)(v0 + 88) = v4;
  *(_QWORD *)(v0 + 96) = sub_19A990D58();
  *(_QWORD *)(v0 + 104) = v5;
  result = sub_19A990D58();
  *(_QWORD *)(v0 + 112) = result;
  *(_QWORD *)(v0 + 120) = v7;
  *(_QWORD *)(v0 + 128) = 0xD000000000000024;
  *(_QWORD *)(v0 + 136) = 0x800000019A99FC00;
  *(_QWORD *)(v0 + 144) = 0xD000000000000023;
  *(_QWORD *)(v0 + 152) = 0x800000019A99FC30;
  qword_1EE3B65B0 = v0;
  return result;
}

double sub_19A962ED0()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_19A99A9A0;
  *(_QWORD *)(v0 + 32) = 39;
  *(_QWORD *)(v0 + 40) = 0xE100000000000000;
  *(_QWORD *)(v0 + 48) = 34;
  *(_QWORD *)(v0 + 56) = 0xE100000000000000;
  *(_QWORD *)(v0 + 64) = 92;
  *(_QWORD *)(v0 + 72) = 0xE100000000000000;
  *(_QWORD *)(v0 + 80) = 42;
  *(_QWORD *)(v0 + 88) = 0xE100000000000000;
  off_1EE3B65B8 = (_UNKNOWN *)v0;
  return result;
}

id sub_19A962F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id result;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  long double (**v38)(double);
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v1 = v0;
  v2 = sub_19A990830();
  v67 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_19A963680();
  v6 = v5;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CA6B30]), sel_init);
  if (qword_1EE3B60A8 != -1)
    swift_once();
  v78 = qword_1EE3B65B0;
  swift_bridgeObjectRetain();
  v8 = swift_bridgeObjectRetain();
  sub_19A963DC4(v8);
  v78 = MEMORY[0x1E0DEE9E8];
  v9 = swift_bridgeObjectRetain();
  sub_19A963F18(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setFetchAttributes_, v10);

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v12 = swift_allocObject();
  v70 = xmmword_19A99A9B0;
  *(_OWORD *)(v12 + 16) = xmmword_19A99A9B0;
  *(_QWORD *)(v12 + 32) = sub_19A990D58();
  *(_QWORD *)(v12 + 40) = v13;
  v14 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setProtectionClasses_, v14);

  v68 = v11;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v70;
  result = objc_msgSend((id)objc_opt_self(), sel_spotlightBundleIdentifier);
  if (result)
  {
    v17 = result;
    v18 = v7;
    v19 = sub_19A990D58();
    v21 = v20;

    *(_QWORD *)(v15 + 32) = v19;
    *(_QWORD *)(v15 + 40) = v21;
    v22 = (void *)sub_19A990E30();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setBundleIDs_, v22);

    v23 = (_BYTE *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
    swift_beginAccess();
    v24 = v18;
    if ((*v23 & 1) == 0
      || (v25 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle), swift_beginAccess(), *v25 != 2))
    {
      v26 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
      swift_beginAccess();
      v27 = *v26;
      v28 = v26[1];
      v77 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      v29 = sub_19A964080(v27, v28, 1);
      sub_19A963DC4(v29);
      v30 = sub_19A964080(v27, v28, 0);
      sub_19A963DC4(v30);
      v31 = *(_QWORD *)(v77 + 16);
      swift_bridgeObjectRelease();
      if (v31)
      {
        v32 = (void *)sub_19A990E30();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        v32 = 0;
      }
      objc_msgSend(v18, sel_setRankingQueries_, v32);

      v24 = v18;
      v33 = objc_msgSend(v18, sel_rankingQueries);
      if (v33)
      {
        v34 = v33;
        v35 = sub_19A990E3C();

        v36 = *(_QWORD *)(v35 + 16);
        swift_bridgeObjectRelease();
        if (v36)
        {
          v37 = swift_allocObject();
          *(_QWORD *)(v37 + 16) = v36;
          v38 = (long double (**)(double))(v1 + OBJC_IVAR___TPSSearchQuery_rankingModifier);
          v39 = *(_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_rankingModifier);
          *v38 = sub_19A96427C;
          v38[1] = (long double (*)(double))v37;
          sub_19A9642B0(v39);
        }
      }
    }
    if ((*v23 & 2) != 0)
    {
      *(_QWORD *)&v70 = v24;
      v40 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
      swift_beginAccess();
      v41 = v40[1];
      v75 = *v40;
      v76 = v41;
      swift_bridgeObjectRetain();
      sub_19A990824();
      sub_19A960644();
      v42 = sub_19A99107C();
      v44 = v43;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v4, v2);
      v75 = v42;
      v76 = v44;
      v45 = sub_19A991094();
      v47 = v46;
      swift_bridgeObjectRelease();
      if (qword_1EE3B60B0 != -1)
        swift_once();
      v48 = *((_QWORD *)off_1EE3B65B8 + 2);
      if (v48)
      {
        v66 = v41;
        v67 = v6;
        v65 = swift_bridgeObjectRetain();
        v49 = (uint64_t *)(v65 + 40);
        do
        {
          v51 = *(v49 - 1);
          v50 = *v49;
          v75 = v45;
          v76 = v47;
          v73 = v51;
          v74 = v50;
          v71 = 92;
          v72 = 0xE100000000000000;
          swift_bridgeObjectRetain();
          sub_19A990DAC();
          v45 = sub_19A991088();
          v53 = v52;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v47 = v53;
          v49 += 2;
          --v48;
        }
        while (v48);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v75 = v45;
      v76 = v47;
      sub_19A990DAC();
      v54 = (void *)sub_19A990D34();
      swift_bridgeObjectRelease();
      v24 = (void *)v70;
      objc_msgSend((id)v70, sel_setCompletionString_, v54);

      objc_msgSend(v24, sel_setCompletionResultCount_, 10);
      v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = xmmword_19A99A9C0;
      *(_QWORD *)(v55 + 32) = sub_19A990D58();
      *(_QWORD *)(v55 + 40) = v56;
      *(_QWORD *)(v55 + 48) = sub_19A990D58();
      *(_QWORD *)(v55 + 56) = v57;
      *(_QWORD *)(v55 + 64) = sub_19A990D58();
      *(_QWORD *)(v55 + 72) = v58;
      v59 = (void *)sub_19A990E30();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_setCompletionAttributes_, v59);

    }
    v60 = objc_allocWithZone(MEMORY[0x1E0CA6B28]);
    v61 = v24;
    v62 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v63 = objc_msgSend(v60, sel_initWithQueryString_queryContext_, v62, v61);

    return v63;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_19A963680()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;

  v1 = v0;
  v2 = (unint64_t *)(v0 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  v3 = *v2;
  v4 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  v7 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  v8 = (*v7 >> 2) & 1;
  swift_bridgeObjectRetain();
  sub_19A9638D4(v5, v6, v8, v3);
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    sub_19A991160();
    swift_bridgeObjectRelease();
  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v9 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  sub_19A963BD8(*v9);
  if (v10)
  {
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  return 40;
}

uint64_t sub_19A9638D4(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v27 = a3;
  v7 = sub_19A990830();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a1;
  v33 = a2;
  sub_19A990824();
  sub_19A960644();
  v11 = sub_19A99107C();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v32 = v11;
  v33 = v13;
  v14 = sub_19A991094();
  v16 = v15;
  swift_bridgeObjectRelease();
  if (qword_1EE3B60B0 != -1)
    swift_once();
  v17 = *((_QWORD *)off_1EE3B65B8 + 2);
  if (v17)
  {
    v26 = a4;
    v25 = swift_bridgeObjectRetain();
    v18 = (uint64_t *)(v25 + 40);
    do
    {
      v19 = *(v18 - 1);
      v20 = *v18;
      v32 = v14;
      v33 = v16;
      v30 = v19;
      v31 = v20;
      v28 = 92;
      v29 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_19A990DAC();
      v14 = sub_19A991088();
      v22 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v16 = v22;
      v18 += 2;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    a4 = v26;
  }
  if (a4 <= 1)
  {
    v32 = 39;
    v33 = 0xE100000000000000;
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    return v32;
  }
  if (a4 == 2)
  {
    swift_bridgeObjectRelease();
    v32 = 39;
    v33 = 0xE100000000000000;
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    return v32;
  }
  v32 = a4;
  result = sub_19A9912C8();
  __break(1u);
  return result;
}

uint64_t sub_19A963BD8(uint64_t result)
{
  if (result)
  {
    if (result == 2)
    {
      sub_19A991160();
      swift_bridgeObjectRelease();
      return 0xD000000000000025;
    }
    else if (result == 1)
    {
      sub_19A991160();
      swift_bridgeObjectRelease();
      if (qword_1EE3B58D0 != -1)
        swift_once();
      return 0xD00000000000001FLL;
    }
    else
    {
      result = sub_19A9912C8();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_19A963D2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19A99A9A0;
  *(_QWORD *)(v0 + 32) = sub_19A990D58();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_19A990D58();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_19A990D58();
  *(_QWORD *)(v0 + 72) = v3;
  result = sub_19A990D58();
  *(_QWORD *)(v0 + 80) = result;
  *(_QWORD *)(v0 + 88) = v5;
  off_1EE3B65C0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_19A963DC4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_19A96A420(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A963F18(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *i;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v2 = 0;
  v3 = result + 40;
  v4 = -(uint64_t)v1;
  v5 = MEMORY[0x1E0DEE9D8];
  v15 = result + 40;
  v16 = *(_QWORD *)(result + 16);
  do
  {
    if (v2 <= v1)
      v6 = v1;
    else
      v6 = v2;
    v7 = -(uint64_t)v6;
    for (i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      v10 = *(i - 1);
      v9 = *i;
      swift_bridgeObjectRetain_n();
      v11 = sub_19A981110(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        break;
      result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1)
        return v5;
    }
    result = swift_isUniquelyReferenced_nonNull_native();
    v18 = v5;
    if ((result & 1) == 0)
    {
      result = sub_19A98E31C(0, *(_QWORD *)(v5 + 16) + 1, 1);
      v5 = v18;
    }
    v13 = *(_QWORD *)(v5 + 16);
    v12 = *(_QWORD *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      result = sub_19A98E31C(v12 > 1, v13 + 1, 1);
      v5 = v18;
    }
    *(_QWORD *)(v5 + 16) = v13 + 1;
    v14 = v5 + 16 * v13;
    *(_QWORD *)(v14 + 32) = v10;
    *(_QWORD *)(v14 + 40) = v9;
    v3 = v15;
    v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_19A964080(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  int v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = 0;
  v19 = MEMORY[0x1E0DEE9D8];
  v13 = a3 & 1;
  do
  {
    v4 = qword_1E395DAF8[v3 + 4];
    if (v4 != 2)
    {
      sub_19A9638D4(a1, a2, v13, v4);
      if (qword_1EE3B60B8 != -1)
        swift_once();
      v5 = (char *)off_1EE3B65C0;
      v6 = *((_QWORD *)off_1EE3B65C0 + 2);
      if (v6)
      {
        v16 = v3;
        swift_bridgeObjectRetain_n();
        v7 = (uint64_t *)(v5 + 40);
        v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        do
        {
          v17 = *(v7 - 1);
          v18 = *v7;
          swift_bridgeObjectRetain_n();
          sub_19A990DAC();
          sub_19A990DAC();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_19A96A420(0, v8[2] + 1, 1, v8);
          v10 = v8[2];
          v9 = v8[3];
          if (v10 >= v9 >> 1)
            v8 = sub_19A96A420((_QWORD *)(v9 > 1), v10 + 1, 1, v8);
          v7 += 2;
          v8[2] = v10 + 1;
          v11 = &v8[2 * v10];
          v11[4] = v17;
          v11[5] = v18;
          swift_bridgeObjectRelease();
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v3 = v16;
      }
      else
      {
        swift_bridgeObjectRelease();
        v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      }
      sub_19A963DC4((uint64_t)v8);
    }
    ++v3;
  }
  while (v3 != 3);
  return v19;
}

uint64_t sub_19A96426C()
{
  return swift_deallocObject();
}

long double sub_19A96427C(double a1)
{
  uint64_t v1;

  return a1 / (exp2((double)*(uint64_t *)(v1 + 16)) + -1.0);
}

uint64_t sub_19A9642B0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_19A9642C0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = sub_19A990830();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a1;
  v28 = a2;
  sub_19A990824();
  sub_19A960644();
  v8 = sub_19A99107C();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v27 = v8;
  v28 = v10;
  v11 = sub_19A991094();
  v13 = v12;
  swift_bridgeObjectRelease();
  if (qword_1EE3B60B0 != -1)
    swift_once();
  v14 = *((_QWORD *)off_1EE3B65B8 + 2);
  if (v14)
  {
    v22 = swift_bridgeObjectRetain();
    v15 = (uint64_t *)(v22 + 40);
    do
    {
      v16 = v13;
      v17 = *(v15 - 1);
      v18 = *v15;
      v27 = v11;
      v28 = v16;
      v25 = v17;
      v26 = v18;
      v23 = 92;
      v24 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_19A990DAC();
      v11 = sub_19A991088();
      v13 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 += 2;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t WorkItemDebouncer.__allocating_init(queue:debounceInterval:)(uint64_t a1, double a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = 0;
  *(double *)(result + 32) = a2;
  return result;
}

uint64_t WorkItemDebouncer.init(queue:debounceInterval:)(uint64_t a1, double a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = 0;
  *(double *)(v2 + 32) = a2;
  return v2;
}

uint64_t WorkItemDebouncer.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    sub_19A990C80();
    swift_release();
  }
  *(_QWORD *)(v0 + 24) = 0;
  swift_release();

  swift_release();
  return v0;
}

uint64_t WorkItemDebouncer.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    sub_19A990C80();
    swift_release();
  }
  *(_QWORD *)(v0 + 24) = 0;
  swift_release();

  swift_release();
  return swift_deallocClassInstance();
}

void sub_19A9645B8(const void *a1)
{
  uint64_t v1;
  void *v2;

  v2 = _Block_copy(a1);
  sub_19A9645E4(v2, *(double *)(v1 + 32));
  _Block_release(v2);
}

uint64_t sub_19A9645E4(const void *a1, double a2)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t result;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_19A990C68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v36 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v38 = (char *)v32 - v10;
  v11 = sub_19A990C2C();
  MEMORY[0x1E0C80A78](v11);
  v35 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_19A990C50();
  v13 = *(_QWORD *)(v33 - 8);
  v14 = MEMORY[0x1E0C80A78](v33);
  v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)v32 - v17;
  v19 = _Block_copy(a1);
  v20 = *(_QWORD *)(v2 + 24);
  v39 = v6;
  v37 = v7;
  v34 = v11;
  if (v20)
  {
    swift_retain();
    sub_19A990C80();
    swift_release();
  }
  *(_QWORD *)(v3 + 24) = 0;
  swift_release();
  v21 = swift_allocObject();
  swift_weakInit();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v19;
  *(_QWORD *)(v22 + 24) = v21;
  aBlock[4] = sub_19A964B28;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A964B30;
  aBlock[3] = &block_descriptor_1;
  v23 = _Block_copy(aBlock);
  swift_retain();
  sub_19A990C44();
  v32[1] = _Block_copy(v23);
  v24 = v16;
  v25 = v33;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v24, v18, v33);
  v40 = MEMORY[0x1E0DEE9D8];
  sub_19A964B5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B66C8);
  sub_19A964BA4();
  sub_19A9910B8();
  sub_19A990C8C();
  swift_allocObject();
  v26 = sub_19A990C74();
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v25);
  swift_release();
  *(_QWORD *)(v3 + 24) = v26;
  swift_release();
  v27 = v36;
  sub_19A990C5C();
  v28 = v38;
  MEMORY[0x19AECD3AC](v27, a2);
  v29 = *(uint64_t (**)(char *, uint64_t))(v37 + 8);
  v30 = v39;
  result = v29(v27, v39);
  if (*(_QWORD *)(v3 + 24))
  {
    swift_retain();
    sub_19A990FB0();
    swift_release();
    swift_release();
    return v29(v28, v30);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_19A96494C(const void *a1, double a2)
{
  void *v3;

  v3 = _Block_copy(a1);
  sub_19A9645E4(v3, a2);
  _Block_release(v3);
}

uint64_t sub_19A964984()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    sub_19A990C80();
    swift_release();
  }
  *(_QWORD *)(v0 + 24) = 0;
  return swift_release();
}

uint64_t sub_19A9649CC()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_19A9649D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for WorkItemDebouncer();
  result = sub_19A990B84();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for WorkItem()
{
  return &type metadata for WorkItem;
}

uint64_t type metadata accessor for WorkItemDebouncer()
{
  return objc_opt_self();
}

uint64_t method lookup function for WorkItemDebouncer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkItemDebouncer.__allocating_init(queue:debounceInterval:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of WorkItemDebouncer.execute(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of WorkItemDebouncer.execute(customDelay:block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of WorkItemDebouncer.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t sub_19A964A78()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_19A964A9C(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(a1 + 16))();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_QWORD *)(result + 24) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_19A964AFC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A964B28()
{
  uint64_t v0;

  return sub_19A964A9C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_19A964B30(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

unint64_t sub_19A964B5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B66C0;
  if (!qword_1EE3B66C0)
  {
    v1 = sub_19A990C2C();
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B66C0);
  }
  return result;
}

unint64_t sub_19A964BA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B66D0;
  if (!qword_1EE3B66D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3B66C8);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B66D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AECE270](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

Swift::Bool __swiftcall TPSAppController.hasLocalVariant(tip:)(TPSTip *tip)
{
  void *v1;
  NSString *v2;
  NSString *v3;
  id v4;
  Swift::Bool result;

  v2 = -[TPSDocument correlationID](tip, sel_correlationID);
  result = 0;
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v1, sel_tipForCorrelationIdentifier_, v2);

    if (v4)
      return 1;
  }
  return result;
}

Swift::Void __swiftcall TPSAppController.logSharedTipDisplayed(tip:isEligible:)(TPSTip *tip, Swift::Bool isEligible)
{
  void *v2;
  void *v3;
  NSString *v6;
  id v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  id v25;

  v3 = v2;
  if (isEligible)
  {
    v6 = -[TPSDocument identifier](tip, sel_identifier);
    if (!v6)
    {
      sub_19A990D58();
      v6 = (NSString *)sub_19A990D34();
      swift_bridgeObjectRelease();
    }
    v7 = objc_msgSend(v3, sel_collectionIdentifierForTipIdentifier_, v6);

    sub_19A990D58();
    v9 = v8;

LABEL_10:
    v16 = 0;
    goto LABEL_19;
  }
  v10 = -[TPSDocument correlationID](tip, sel_correlationID);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v3, sel_tipForCorrelationIdentifier_, v10);

    if (v12)
    {
      v13 = objc_msgSend(v12, sel_identifier);
      if (!v13)
      {
        sub_19A990D58();
        v13 = (id)sub_19A990D34();
        swift_bridgeObjectRelease();
      }
      v14 = objc_msgSend(v3, sel_collectionIdentifierForTipIdentifier_, v13);

      sub_19A990D58();
      v9 = v15;

      goto LABEL_10;
    }
  }
  v9 = -[TPSDocument availabilityMessage](tip, sel_availabilityMessage);
  if (v9)
  {
    v17 = sub_19A990D58();
    v16 = v18;

    v19 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0)
      v19 = v17 & 0xFFFFFFFFFFFFLL;
    if (v19)
    {
      v9 = 0;
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
    v9 = 0;
  }
  v16 = 0x800000019A99FD40;
LABEL_19:
  v20 = -[TPSDocument identifier](tip, sel_identifier);
  if (!v20)
  {
    sub_19A990D58();
    v20 = (NSString *)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  v21 = -[TPSDocument correlationID](tip, sel_correlationID);
  if (v9)
  {
    v22 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = -[TPSDocument variantID](tip, sel_variantID);
  if (!v23)
  {
    sub_19A990D58();
    v23 = (NSString *)sub_19A990D34();
    swift_bridgeObjectRelease();
    if (v16)
      goto LABEL_26;
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  if (!v16)
    goto LABEL_28;
LABEL_26:
  v24 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
LABEL_29:
  v25 = objc_msgSend((id)objc_opt_self(), sel_eventWithTipID_correlationID_collectionID_variantID_message_isEligible_, v20, v21, v22, v23, v24, isEligible);

  objc_msgSend(v25, "log");
}

void _sSo16TPSAppControllerC8TipsCoreE28logInvalidSharedTipDisplayed3tipySo6TPSTipC_tF_0(void *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(a1, sel_identifier);
  if (!v2)
  {
    sub_19A990D58();
    v2 = (id)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  v3 = objc_msgSend(a1, sel_variantID);
  if (!v3)
  {
    sub_19A990D58();
    v3 = (id)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  v4 = objc_msgSend((id)objc_opt_self(), sel_eventWithTipID_invalidVariantID_, v2, v3);

  objc_msgSend(v4, "log");
}

void sub_19A9651F8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_msgSend((id)objc_opt_self(), sel_tps_userLanguageCode);
  v1 = sub_19A990D58();
  v3 = v2;

  qword_1EE3B66D8 = v1;
  unk_1EE3B66E0 = v3;
  qword_1EE3B66E8 = 0x3FF0000000000000;
}

TipsCore::TipSpotlightViewType::AssetConfiguration __swiftcall TipSpotlightViewType.AssetConfiguration.init(language:heightToWidthRatio:)(Swift::String language, Swift::Double heightToWidthRatio)
{
  uint64_t v2;
  TipsCore::TipSpotlightViewType::AssetConfiguration result;

  *(Swift::String *)v2 = language;
  *(Swift::Double *)(v2 + 16) = heightToWidthRatio;
  result.language = language;
  result.heightToWidthRatio = heightToWidthRatio;
  return result;
}

uint64_t static TipSpotlightViewType.AssetConfiguration.default.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EE3B60C0 != -1)
    swift_once();
  v2 = unk_1EE3B66E0;
  v3 = qword_1EE3B66E8;
  *a1 = qword_1EE3B66D8;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewType.AssetConfiguration.language.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double TipSpotlightViewType.AssetConfiguration.heightToWidthRatio.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t TipSpotlightViewType.AssetConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5A18);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19A9654F8();
  sub_19A991370();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v18 = 0;
  v9 = sub_19A991220();
  v12 = v10;
  if (v10)
  {
    v13 = v9;
  }
  else
  {
    if (qword_1EE3B60C0 != -1)
      swift_once();
    v13 = qword_1EE3B66D8;
    v12 = unk_1EE3B66E0;
    swift_bridgeObjectRetain();
  }
  v17 = 1;
  swift_bridgeObjectRetain();
  v14 = sub_19A99122C();
  if ((v15 & 1) != 0)
  {
    if (qword_1EE3B60C0 != -1)
      swift_once();
    v14 = qword_1EE3B66E8;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v13;
  a2[1] = v12;
  a2[2] = v14;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_19A9654F8()
{
  unint64_t result;

  result = qword_1ED03D4D0;
  if (!qword_1ED03D4D0)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99AD94, &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4D0);
  }
  return result;
}

uint64_t sub_19A96553C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000012;
  else
    return 0x65676175676E616CLL;
}

uint64_t sub_19A965580()
{
  char *v0;

  return sub_19A96553C(*v0);
}

uint64_t sub_19A965588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_19A967158(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19A9655AC()
{
  return 0;
}

void sub_19A9655B8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_19A9655C4()
{
  sub_19A9654F8();
  return sub_19A991388();
}

uint64_t sub_19A9655EC()
{
  sub_19A9654F8();
  return sub_19A991394();
}

uint64_t TipSpotlightViewType.AssetConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  char v8;
  char v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59C0);
  v7 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19A9654F8();
  sub_19A99137C();
  v9 = 0;
  sub_19A991244();
  if (!v1)
  {
    v8 = 1;
    sub_19A991250();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v5, v3);
}

uint64_t sub_19A965748@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TipSpotlightViewType.AssetConfiguration.init(from:)(a1, a2);
}

uint64_t sub_19A96575C(_QWORD *a1)
{
  return TipSpotlightViewType.AssetConfiguration.encode(to:)(a1);
}

uint64_t TipSpotlightViewProxy.assetConfiguration.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewProxy.assetConfiguration.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  v1[2] = v4;
  return result;
}

uint64_t (*TipSpotlightViewProxy.assetConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightViewProxy.bodyContent.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewProxy.bodyContent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TipSpotlightViewProxy.bodyContent.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightViewProxy.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EE3B60C0 != -1)
    swift_once();
  v2 = unk_1EE3B66E0;
  v3 = qword_1EE3B66E8;
  *a1 = qword_1EE3B66D8;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = 0;
  return swift_bridgeObjectRetain();
}

double TipSpotlightViewProxy.init(assetConfiguration:bodyContent:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *(_QWORD *)(a1 + 8);
  result = *(double *)(a1 + 16);
  *(_QWORD *)a3 = *(_QWORD *)a1;
  *(_QWORD *)(a3 + 8) = v3;
  *(double *)(a3 + 16) = result;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

uint64_t sub_19A96588C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EE3B60C0 != -1)
    swift_once();
  v2 = unk_1EE3B66E0;
  v3 = qword_1EE3B66E8;
  *a1 = qword_1EE3B66D8;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A9658EC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A965900(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  v1[2] = v4;
  return result;
}

uint64_t (*sub_19A965940())()
{
  return nullsub_1;
}

uint64_t sub_19A965950()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A965958(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_19A965980())()
{
  return nullsub_1;
}

uint64_t sub_19A965990@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_19A9659A4(a1, a2);
}

uint64_t sub_19A9659A4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v25 = a2;
  v31 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5A10);
  v26 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE3B60C0 != -1)
    swift_once();
  v7 = qword_1EE3B66D8;
  v8 = unk_1EE3B66E0;
  v9 = qword_1EE3B66E8;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19A9660E8();
  swift_bridgeObjectRetain();
  sub_19A991370();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_19A96612C();
    sub_19A991238();
    v10 = v29;
    if (v29)
    {
      v9 = v30;
      v11 = (uint64_t)v28;
      swift_bridgeObjectRelease();
      v8 = v10;
    }
    else
    {
      v11 = v7;
    }
    LOBYTE(v27) = 1;
    sub_19A966170();
    sub_19A991238();
    v13 = v29;
    if (v29 >> 60 == 15)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
      v14 = 0;
    }
    else
    {
      v24 = v11;
      v15 = (uint64_t)v28;
      v16 = (void *)objc_opt_self();
      v23 = v15;
      v17 = (void *)sub_19A990A7C();
      v28 = 0;
      v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, v17, 0, &v28);

      if (v18)
      {
        v19 = v28;
        sub_19A9910A0();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F8);
        if (swift_dynamicCast())
          v14 = v27;
        else
          v14 = 0;
      }
      else
      {
        v20 = v28;
        v21 = (void *)sub_19A9909BC();

        swift_willThrow();
        v14 = 0;
      }
      swift_bridgeObjectRelease();
      sub_19A966918(v23, v13);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
      v11 = v24;
    }
    v22 = v25;
    *v25 = v11;
    v22[1] = v8;
    v22[2] = v9;
    v22[3] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t TipSpotlightViewProtocol.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v36 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5A10);
  v35 = *(_QWORD *)(v37 - 8);
  v7 = MEMORY[0x1E0C80A78](v37);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  v13 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v13);
  sub_19A9660E8();
  v14 = v38;
  sub_19A991370();
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, a2);
  }
  else
  {
    v38 = a3;
    v16 = v35;
    v15 = v36;
    v17 = v10;
    LOBYTE(v40) = 0;
    sub_19A96612C();
    v18 = v37;
    sub_19A991238();
    v34 = v9;
    v19 = v42;
    if (v42)
    {
      v20 = v43;
      v21 = v41;
      v22 = v16;
    }
    else
    {
      v22 = v16;
      if (qword_1EE3B60C0 != -1)
        swift_once();
      v21 = (id)qword_1EE3B66D8;
      v20 = qword_1EE3B66E8;
      v19 = swift_bridgeObjectRetain();
    }
    v41 = v21;
    v42 = v19;
    v43 = v20;
    (*(void (**)(id *, uint64_t))(v38 + 40))(&v41, a2);
    LOBYTE(v40) = 1;
    sub_19A966170();
    sub_19A991238();
    v24 = v42;
    if (v42 >> 60 == 15)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v34, v18);
    }
    else
    {
      v25 = (uint64_t)v41;
      v26 = (void *)objc_opt_self();
      v36 = v25;
      v27 = v24;
      v28 = (void *)sub_19A990A7C();
      v41 = 0;
      v29 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v28, 0, &v41);

      if (v29)
      {
        v30 = v41;
        sub_19A9910A0();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F8);
        if (swift_dynamicCast())
          v31 = v40;
        else
          v31 = 0;
      }
      else
      {
        v32 = v41;
        v33 = (void *)sub_19A9909BC();

        swift_willThrow();
        v31 = 0;
      }
      (*(void (**)(uint64_t, uint64_t))(v38 + 64))(v31, a2);
      sub_19A966918(v36, v27);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v34, v37);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v15, v12, a2);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
}

unint64_t sub_19A9660E8()
{
  unint64_t result;

  result = qword_1ED03D4B8;
  if (!qword_1ED03D4B8)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99AD44, &type metadata for CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4B8);
  }
  return result;
}

unint64_t sub_19A96612C()
{
  unint64_t result;

  result = qword_1EE3B5A08;
  if (!qword_1EE3B5A08)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for TipSpotlightViewType.AssetConfiguration, &type metadata for TipSpotlightViewType.AssetConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EE3B5A08);
  }
  return result;
}

unint64_t sub_19A966170()
{
  unint64_t result;

  result = qword_1EE3B5A00;
  if (!qword_1EE3B5A00)
  {
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EE3B5A00);
  }
  return result;
}

uint64_t sub_19A9661B4(_QWORD *a1)
{
  uint64_t v1;

  return sub_19A9661D4(a1, *(void **)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 24), *(double *)(v1 + 16));
}

uint64_t sub_19A9661D4(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4, double a5)
{
  void *v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  char v25;
  id v26;
  unint64_t v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59B8);
  v24 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19A9660E8();
  sub_19A99137C();
  v26 = a2;
  v27 = a3;
  v28 = a5;
  v25 = 0;
  sub_19A966970();
  swift_bridgeObjectRetain();
  sub_19A99125C();
  if (v5)

  swift_bridgeObjectRelease();
  if (!a4)
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  v14 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59A0);
  v15 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v26 = 0;
  v16 = objc_msgSend(v14, sel_dataWithJSONObject_options_error_, v15, 0, &v26);

  v17 = v26;
  if (v16)
  {
    v18 = (void *)sub_19A990A88();
    v20 = v19;

    v26 = v18;
    v27 = v20;
    v25 = 1;
    sub_19A9669B4();
    sub_19A99125C();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    return sub_19A96692C((uint64_t)v18, v20);
  }
  else
  {
    v21 = v17;
    v22 = (void *)sub_19A9909BC();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  }
}

uint64_t TipSpotlightViewProtocol.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59B8);
  v21 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19A9660E8();
  sub_19A99137C();
  (*(void (**)(id *__return_ptr, uint64_t, uint64_t))(a3 + 32))(&v26, a2, a3);
  v23 = v26;
  v24 = v27;
  v25 = v28;
  v22 = 0;
  sub_19A966970();
  sub_19A99125C();
  if (v3)

  swift_bridgeObjectRelease();
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3))
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v7);
  v10 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59A0);
  v11 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v26 = 0;
  v12 = objc_msgSend(v10, sel_dataWithJSONObject_options_error_, v11, 0, &v26);

  v13 = v26;
  if (v12)
  {
    v14 = (void *)sub_19A990A88();
    v16 = v15;

    v26 = v14;
    v27 = v16;
    LOBYTE(v23) = 1;
    sub_19A9669B4();
    sub_19A99125C();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v7);
    return sub_19A96692C((uint64_t)v14, v16);
  }
  else
  {
    v17 = v13;
    v18 = (void *)sub_19A9909BC();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v7);
  }
}

uint64_t sub_19A966790(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746E6F4379646F62;
  else
    return 0xD000000000000012;
}

BOOL sub_19A9667D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19A9667F0()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

uint64_t sub_19A966834()
{
  return sub_19A99134C();
}

uint64_t sub_19A96685C()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

uint64_t sub_19A96689C()
{
  char *v0;

  return sub_19A966790(*v0);
}

uint64_t sub_19A9668A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_19A96723C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19A9668C8()
{
  sub_19A9660E8();
  return sub_19A991388();
}

uint64_t sub_19A9668F0()
{
  sub_19A9660E8();
  return sub_19A991394();
}

uint64_t sub_19A966918(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_19A96692C(a1, a2);
  return a1;
}

uint64_t sub_19A96692C(uint64_t a1, unint64_t a2)
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

unint64_t sub_19A966970()
{
  unint64_t result;

  result = qword_1EE3B5998;
  if (!qword_1EE3B5998)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for TipSpotlightViewType.AssetConfiguration, &type metadata for TipSpotlightViewType.AssetConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EE3B5998);
  }
  return result;
}

unint64_t sub_19A9669B4()
{
  unint64_t result;

  result = qword_1EE3B5990;
  if (!qword_1EE3B5990)
  {
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EE3B5990);
  }
  return result;
}

unint64_t sub_19A9669F8(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_19A966A24();
  result = sub_19A966A68();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_19A966A24()
{
  unint64_t result;

  result = qword_1EE3B66F0;
  if (!qword_1EE3B66F0)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for TipSpotlightViewProxy, &type metadata for TipSpotlightViewProxy);
    atomic_store(result, (unint64_t *)&qword_1EE3B66F0);
  }
  return result;
}

unint64_t sub_19A966A68()
{
  unint64_t result;

  result = qword_1EE3B66F8;
  if (!qword_1EE3B66F8)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for TipSpotlightViewProxy, &type metadata for TipSpotlightViewProxy);
    atomic_store(result, (unint64_t *)&qword_1EE3B66F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipSpotlightViewType()
{
  return &type metadata for TipSpotlightViewType;
}

_QWORD *sub_19A966AC0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TipSpotlightViewType.AssetConfiguration(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for TipSpotlightViewType.AssetConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightViewType.AssetConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSpotlightViewType.AssetConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipSpotlightViewType.AssetConfiguration()
{
  return &type metadata for TipSpotlightViewType.AssetConfiguration;
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t destroy for TipSpotlightViewProxy()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TipSpotlightViewProxy(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for TipSpotlightViewProxy(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for TipSpotlightViewProxy(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightViewProxy(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSpotlightViewProxy(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipSpotlightViewProxy()
{
  return &type metadata for TipSpotlightViewProxy;
}

_BYTE *sub_19A966E30(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodingKeys()
{
  return &type metadata for CodingKeys;
}

uint64_t getEnumTagSinglePayload for AssistantSupportClient.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s8TipsCore10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19A966F28 + 4 * byte_19A99AA75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19A966F5C + 4 * byte_19A99AA70[v4]))();
}

uint64_t sub_19A966F5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A966F64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19A966F6CLL);
  return result;
}

uint64_t sub_19A966F78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19A966F80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19A966F84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A966F8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipSpotlightViewType.AssetConfiguration.CodingKeys()
{
  return &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys;
}

unint64_t sub_19A966FAC()
{
  unint64_t result;

  result = qword_1EE3B6700;
  if (!qword_1EE3B6700)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99AC64, &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3B6700);
  }
  return result;
}

unint64_t sub_19A966FF4()
{
  unint64_t result;

  result = qword_1EE3B6708;
  if (!qword_1EE3B6708)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99AD1C, &type metadata for CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3B6708);
  }
  return result;
}

unint64_t sub_19A96703C()
{
  unint64_t result;

  result = qword_1ED03D4C8;
  if (!qword_1ED03D4C8)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99AC8C, &type metadata for CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4C8);
  }
  return result;
}

unint64_t sub_19A967084()
{
  unint64_t result;

  result = qword_1ED03D4C0;
  if (!qword_1ED03D4C0)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99ACB4, &type metadata for CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4C0);
  }
  return result;
}

unint64_t sub_19A9670CC()
{
  unint64_t result;

  result = qword_1ED03D4E0;
  if (!qword_1ED03D4E0)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99ABD4, &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4E0);
  }
  return result;
}

unint64_t sub_19A967114()
{
  unint64_t result;

  result = qword_1ED03D4D8;
  if (!qword_1ED03D4D8)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99ABFC, &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED03D4D8);
  }
  return result;
}

uint64_t sub_19A967158(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65676175676E616CLL && a2 == 0xE800000000000000;
  if (v3 || (sub_19A991298() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000019A99FD90)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_19A991298();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_19A96723C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000019A99FDB0 || (sub_19A991298() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E6F4379646F62 && a2 == 0xEF61746144746E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_19A991298();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id NetworkMonitorProxy.__allocating_init(monitor:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_19A967DB0(a1);
  swift_release();
  return v4;
}

id static NetworkMonitorProxy.shared.getter()
{
  if (qword_1ED03D1D8 != -1)
    swift_once();
  return (id)qword_1ED03D330;
}

id NetworkMonitorProxy.init(monitor:)(uint64_t a1)
{
  id v1;

  v1 = sub_19A967DB0(a1);
  swift_release();
  return v1;
}

Swift::Void __swiftcall NetworkMonitorProxy.start()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  sub_19A90A440(v1, (uint64_t)&unk_1EE3B6720, v2);
  os_unfair_lock_unlock(v3);
  swift_release_n();
}

uint64_t sub_19A96749C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D350);
  *(_QWORD *)(v1 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A9674F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x19AECE39C](v1);
  v3 = (void *)v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 56) = *(_QWORD *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    swift_retain();

    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A967590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 56);
  if (!*(_QWORD *)(v1 + 120))
  {
    v2 = *(_QWORD *)(v0 + 48);
    v3 = sub_19A990EE4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
    v4 = swift_allocObject();
    swift_weakInit();
    v5 = sub_19A968298();
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = v1;
    v6[3] = v5;
    v6[4] = v1;
    v6[5] = v4;
    swift_retain_n();
    *(_QWORD *)(v1 + 120) = sub_19A9768D0(v2, (uint64_t)&unk_1EE3B6778, (uint64_t)v6);
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A9676C8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return swift_task_switch();
}

uint64_t NetworkMonitorProxy.removeObserver(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  _BYTE v12[16];

  v3 = sub_19A990B0C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(&v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v3);
  v8 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v4 + 32))(v9 + v8, &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v3);
  v10 = (os_unfair_lock_s *)(*(_QWORD *)(v6 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_19A90A440(v6, (uint64_t)&unk_1EE3B6750, v9);
  os_unfair_lock_unlock(v10);
  swift_release();
  return swift_release();
}

uint64_t sub_19A967820(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return swift_task_switch();
}

uint64_t sub_19A967838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 64) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x19AECE39C](v1);
  v3 = (void *)v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
  swift_retain();

  return swift_task_switch();
}

uint64_t sub_19A9678C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 72);
  swift_beginAccess();
  v2 = sub_19A979C90(v1);
  swift_endAccess();
  if (v2)
    sub_19A9642B0(v2);
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id NetworkMonitorProxy.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NetworkMonitorProxy.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id NetworkMonitorProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19A967BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t (*v10)(void);

  v6[4] = a5;
  v6[5] = a6;
  if (a4)
  {
    v7 = (_QWORD *)swift_task_alloc();
    v6[6] = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
    *v7 = v6;
    v7[1] = sub_19A967C84;
    return sub_19A990EFC();
  }
  else
  {
    v10 = (uint64_t (*)(void))((char *)a5 + *a5);
    v9 = (_QWORD *)swift_task_alloc();
    v6[7] = v9;
    *v9 = v6;
    v9[1] = sub_19A967D3C;
    return v10();
  }
}

uint64_t sub_19A967C84()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A967CD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  sub_19A909218(*(id *)(v0 + 16), *(_BYTE *)(v0 + 24));
  v3 = (uint64_t (*)(void))(**(int **)(v0 + 32) + *(_QWORD *)(v0 + 32));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_19A967D3C;
  return v3();
}

uint64_t sub_19A967D3C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19A967D84()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

id sub_19A967DB0(uint64_t a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = OBJC_IVAR___TPSNetworkPathMonitor_serialTasks;
  type metadata accessor for SerialTaskExecutor();
  v6 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D368);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)&v2[v5] = v6;
  if (a1)
  {
    v8 = v2;
    v9 = a1;
  }
  else
  {
    type metadata accessor for NetworkMonitor();
    v9 = swift_allocObject();
    v10 = v2;
    swift_defaultActor_initialize();
    sub_19A990BCC();
    swift_allocObject();
    *(_QWORD *)(v9 + 112) = sub_19A990BC0();
    *(_QWORD *)(v9 + 120) = 0;
    v11 = v9 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
    v12 = sub_19A990C20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers;
    *(_QWORD *)(v9 + v13) = sub_19A925A54(MEMORY[0x1E0DEE9D8]);
  }
  *(_QWORD *)&v2[OBJC_IVAR___TPSNetworkPathMonitor_monitor] = v9;
  swift_retain();

  v15.receiver = v2;
  v15.super_class = ObjectType;
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_19A967F00()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_19A967F24()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A90F6C4;
  return sub_19A96749C(v0);
}

uint64_t sub_19A967F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_19A990B0C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A968000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_19A990B0C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_19A968074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_19A990B0C() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = v0 + ((v2 + 24) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_19A90F6C4;
  v5[8] = v3;
  v5[9] = v4;
  return swift_task_switch();
}

uint64_t method lookup function for NetworkMonitorProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NetworkMonitorProxy.__allocating_init(monitor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_19A968104()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_19A968128(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_19A96813C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A968160()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_19A968180(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B58A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19A9681C0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A9681F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (int *)v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_19A90F6C4;
  return sub_19A967BB0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_19A968274()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

unint64_t sub_19A968298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6770;
  if (!qword_1EE3B6770)
  {
    v1 = type metadata accessor for NetworkMonitor();
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for NetworkMonitor, v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6770);
  }
  return result;
}

uint64_t sub_19A9682E0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A968314(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_19A96838C;
  return sub_19A976B8C(a1, v4, v5, v7, v6);
}

uint64_t sub_19A96838C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t UserGuide.topicIdentifier.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  swift_getKeyPath();
  sub_19A95CC28();
  sub_19A990B3C();
  swift_release();
  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void sub_19A968474()
{
  qword_1EE3B6780 = 1802465122;
  *(_QWORD *)algn_1EE3B6788 = 0xE400000000000000;
}

void sub_19A968490()
{
  qword_1EE3B6790 = 0x6369706F74;
  *(_QWORD *)algn_1EE3B6798 = 0xE500000000000000;
}

void sub_19A9684B0()
{
  qword_1EE3B67A0 = 0x726F68636E61;
  *(_QWORD *)algn_1EE3B67A8 = 0xE600000000000000;
}

void sub_19A9684D0()
{
  qword_1EE3B67B0 = 0x6E6F6973726576;
  *(_QWORD *)algn_1EE3B67B8 = 0xE700000000000000;
}

void sub_19A9684F4()
{
  qword_1EE3B67C0 = 0x7265727265666572;
  *(_QWORD *)algn_1EE3B67C8 = 0xE800000000000000;
}

id UserGuide.__allocating_init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  objc_class *v12;
  id v18;

  v18 = objc_allocWithZone(v12);
  return UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t UserGuide.topicIdentifier.setter()
{
  swift_getKeyPath();
  sub_19A95CC28();
  sub_19A990B30();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t static UserGuide.privateURL(bookIdentifier:topicIdentifier:version:referrer:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  return static UserGuide.url(book:topic:anchor:version:referrer:)(a1, a2, a3, 0, 0, a4, a5, a8, a6, a7);
}

uint64_t static UserGuide.url(book:topic:anchor:version:referrer:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  char *v12;
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
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(unint64_t, char *, uint64_t);
  char *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;

  v54 = a7;
  v47 = a4;
  v48 = a6;
  v49 = a3;
  v50 = a5;
  v46 = a2;
  v52 = a8;
  v53 = sub_19A9908F0();
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_19A990860();
  v13 = *(_QWORD *)(v57 - 8);
  v14 = MEMORY[0x1E0C80A78](v57);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v14);
  v56 = (char *)&v46 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v55 = (char *)&v46 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v46 - v22;
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v46 - v24;
  if (!a1)
  {
    v26 = objc_msgSend((id)objc_opt_self(), sel_deviceGuideIdentifier, v46, v47, v48);
    sub_19A990D58();

  }
  v27 = qword_1EE3B60D0;
  swift_bridgeObjectRetain();
  if (v27 != -1)
    swift_once();
  sub_19A99083C();
  swift_bridgeObjectRelease();
  v28 = sub_19A96A52C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v30 = *(_QWORD *)(v28 + 16);
  v29 = *(_QWORD *)(v28 + 24);
  if (v30 >= v29 >> 1)
    v28 = sub_19A96A52C(v29 > 1, v30 + 1, 1, v28);
  *(_QWORD *)(v28 + 16) = v30 + 1;
  v31 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v32 = *(_QWORD *)(v13 + 72);
  v33 = *(void (**)(unint64_t, char *, uint64_t))(v13 + 32);
  v33(v28 + v31 + v32 * v30, v25, v57);
  if (v49)
  {
    v34 = v16;
    if (qword_1EE3B60D8 != -1)
      swift_once();
    sub_19A99083C();
    v36 = *(_QWORD *)(v28 + 16);
    v35 = *(_QWORD *)(v28 + 24);
    v37 = v57;
    if (v36 >= v35 >> 1)
      v28 = sub_19A96A52C(v35 > 1, v36 + 1, 1, v28);
    *(_QWORD *)(v28 + 16) = v36 + 1;
    v33(v28 + v31 + v36 * v32, v23, v37);
  }
  else
  {
    v34 = v16;
    v37 = v57;
  }
  v38 = v54;
  if (v50)
  {
    if (qword_1EE3B60E0 != -1)
      swift_once();
    sub_19A99083C();
    v40 = *(_QWORD *)(v28 + 16);
    v39 = *(_QWORD *)(v28 + 24);
    if (v40 >= v39 >> 1)
      v28 = sub_19A96A52C(v39 > 1, v40 + 1, 1, v28);
    *(_QWORD *)(v28 + 16) = v40 + 1;
    v33(v28 + v31 + v40 * v32, v55, v37);
  }
  if (v38)
  {
    if (qword_1EE3B60E8 != -1)
      swift_once();
    sub_19A99083C();
    v42 = *(_QWORD *)(v28 + 16);
    v41 = *(_QWORD *)(v28 + 24);
    if (v42 >= v41 >> 1)
      v28 = sub_19A96A52C(v41 > 1, v42 + 1, 1, v28);
    *(_QWORD *)(v28 + 16) = v42 + 1;
    v33(v28 + v31 + v42 * v32, v56, v37);
  }
  if (a10)
  {
    if (qword_1EE3B60F0 != -1)
      swift_once();
    sub_19A99083C();
    v44 = *(_QWORD *)(v28 + 16);
    v43 = *(_QWORD *)(v28 + 24);
    if (v44 >= v43 >> 1)
      v28 = sub_19A96A52C(v43 > 1, v44 + 1, 1, v28);
    *(_QWORD *)(v28 + 16) = v44 + 1;
    v33(v28 + v31 + v44 * v32, v34, v37);
  }
  sub_19A9908E4();
  sub_19A990D58();
  sub_19A9908CC();
  sub_19A990D58();
  sub_19A9908B4();
  sub_19A990884();
  sub_19A99089C();
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v12, v53);
}

uint64_t UserGuide.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_text);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_19A968FFC()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UserGuide.symbol.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_symbol);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserGuide.gradientColorStrings.getter()
{
  return swift_bridgeObjectRetain();
}

void *UserGuide.gradient.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___TPSUserGuide_gradient);
  v2 = v1;
  return v1;
}

uint64_t UserGuide.platform.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_platform);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserGuide.referrer.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuide_referrer);
}

uint64_t UserGuide.referrer.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSUserGuide_referrer);
}

uint64_t (*UserGuide.referrer.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t UserGuide.version.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSUserGuide_version);
}

uint64_t (*UserGuide.version.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A969444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = (_QWORD *)(a1 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  *v5 = a2;
  v5[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*UserGuide.topicIdentifier.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR___TPSUserGuide___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_19A95CC28();
  sub_19A990B3C();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_19A990B54();
  swift_release();
  swift_beginAccess();
  return sub_19A969598;
}

void sub_19A969598(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_endAccess();
  *v1 = v1[3];
  swift_getKeyPath();
  sub_19A990B48();
  swift_release();
  free(v1);
}

id UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  char *v12;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  id v29;
  void *v30;
  id v31;
  objc_class *ObjectType;
  objc_super v36;

  ObjectType = (objc_class *)swift_getObjectType();
  v19 = &v12[OBJC_IVAR___TPSUserGuide_referrer];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v12[OBJC_IVAR___TPSUserGuide_version];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v21 = &v12[OBJC_IVAR___TPSUserGuide__topicIdentifier];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v22 = v12;
  sub_19A990B60();
  v23 = &v22[OBJC_IVAR___TPSUserGuide_identifier];
  *(_QWORD *)v23 = a1;
  *((_QWORD *)v23 + 1) = a2;
  swift_beginAccess();
  *(_QWORD *)v20 = a3;
  *((_QWORD *)v20 + 1) = a4;
  swift_bridgeObjectRelease();
  if (a6)
    v24 = a5;
  else
    v24 = 0;
  v25 = 0xE000000000000000;
  if (a6)
    v25 = a6;
  v26 = &v22[OBJC_IVAR___TPSUserGuide_text];
  *(_QWORD *)v26 = v24;
  *((_QWORD *)v26 + 1) = v25;
  v27 = &v22[OBJC_IVAR___TPSUserGuide_symbol];
  *(_QWORD *)v27 = a7;
  *((_QWORD *)v27 + 1) = a8;
  v28 = &v22[OBJC_IVAR___TPSUserGuide_platform];
  *(_QWORD *)v28 = a9;
  *((_QWORD *)v28 + 1) = a10;
  v22[OBJC_IVAR___TPSUserGuide_platformIndependent] = a11;
  *(_QWORD *)&v22[OBJC_IVAR___TPSUserGuide_gradientColorStrings] = a12;
  v29 = objc_allocWithZone((Class)TPSGradient);
  swift_bridgeObjectRetain();
  v30 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v29, sel_initWithColorStrings_, v30);

  *(_QWORD *)&v22[OBJC_IVAR___TPSUserGuide_gradient] = v31;
  v36.receiver = v22;
  v36.super_class = ObjectType;
  return objc_msgSendSuper2(&v36, sel_init);
}

uint64_t UserGuide.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_19A990B24();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_19A990D28();
  MEMORY[0x1E0C80A78](v2);
  sub_19A990D1C();
  v3 = objc_msgSend((id)objc_opt_self(), sel_tipsCoreFrameworkBundle);
  sub_19A990B18();
  sub_19A990D70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19A99A9B0;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_text);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR___TPSUserGuide_text + 8);
  *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v4 + 64) = sub_19A96AED0();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v5;
  swift_bridgeObjectRetain();
  v7 = sub_19A990D40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t UserGuide.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  strcpy((char *)v9, "(identifier:");
  BYTE5(v9[1]) = 0;
  HIWORD(v9[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v10 = v9[0];
  v11 = v9[1];
  v2 = v0 + OBJC_IVAR___TPSUserGuide_version;
  swift_beginAccess();
  if (*(_QWORD *)(v2 + 8))
  {
    swift_bridgeObjectRetain();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  v8 = v1;
  sub_19A95CC28();
  sub_19A990B3C();
  swift_release();
  v3 = v1 + OBJC_IVAR___TPSUserGuide__topicIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    sub_19A991160();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_platform + 8))
  {
    sub_19A990DAC();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
  }
  sub_19A991160();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v4 = *(void **)(v1 + OBJC_IVAR___TPSUserGuide_gradient);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, sel_description, 0x656964617267202CLL, 0xEB000000003A746ELL, v8);
    sub_19A990D58();

    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();

    swift_bridgeObjectRelease();
  }
  return v10;
}

id UserGuide.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UserGuide.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UserGuide.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id UserGuide.copy(with:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  id result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_identifier + 8);
  v19 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_identifier);
  v5 = (uint64_t *)(v1 + OBJC_IVAR___TPSUserGuide_version);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_text + 8);
  v17 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_text);
  v18 = v6;
  v9 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_symbol);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_symbol + 8);
  v16 = v9;
  v11 = *(_QWORD *)(v2 + OBJC_IVAR___TPSUserGuide_platform);
  v12 = *(_QWORD *)(v2 + OBJC_IVAR___TPSUserGuide_platform + 8);
  v13 = *(_BYTE *)(v2 + OBJC_IVAR___TPSUserGuide_platformIndependent);
  v14 = *(_QWORD *)(v2 + OBJC_IVAR___TPSUserGuide_gradientColorStrings);
  objc_allocWithZone(ObjectType);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v19, v4, v18, v7, v17, v8, v16, v10, v11, v12, v13, v14);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t static UserGuide.supportsSecureCoding.getter()
{
  return 1;
}

id UserGuide.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t UserGuide.hash.getter()
{
  return sub_19A990E00();
}

uint64_t UserGuide.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  char v4;
  char *v6;
  _BYTE v7[24];
  uint64_t v8;

  swift_getObjectType();
  sub_19A91E378(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_19A90A538((uint64_t)v7, &qword_1ED03D570);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v4 = 0;
    return v4 & 1;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_identifier) == *(_QWORD *)&v6[OBJC_IVAR___TPSUserGuide_identifier]
    && *(_QWORD *)(v1 + OBJC_IVAR___TPSUserGuide_identifier + 8) == *(_QWORD *)&v6[OBJC_IVAR___TPSUserGuide_identifier
                                                                                 + 8])
  {

    v4 = 1;
  }
  else
  {
    v4 = sub_19A991298();

  }
  return v4 & 1;
}

_QWORD *sub_19A96A420(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19A96AF50(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_19A96A52C(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v17;
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
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B59E0);
  v10 = *(_QWORD *)(sub_19A990860() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_19A9911B4();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_19A990860() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_19A96B040(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *_s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t KeyPath;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;

  v0 = sub_19A990860();
  v60 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B64A8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19A9908F0();
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A990890();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_19A90A538((uint64_t)v4, &qword_1EE3B64A8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v9 = sub_19A9908C0();
  v11 = v10;
  v12 = sub_19A990D58();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  if (v9 == v12 && v11 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_19A991298();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      goto LABEL_51;
  }
  v16 = sub_19A990878();
  if (!v16)
  {
LABEL_51:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  v51 = v8;
  v17 = *(_QWORD *)(v16 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    v37 = 0;
    v36 = 0;
    v53 = 0;
    v54 = 0;
    v39 = 0;
    v38 = 0;
    v57 = 0;
LABEL_58:
    v40 = objc_msgSend((id)objc_opt_self(), sel_deviceGuideIdentifier);
    v18 = sub_19A990D58();
    v19 = v41;

    goto LABEL_59;
  }
  v47 = v6;
  v48 = v5;
  v49 = 0;
  v50 = 0;
  v53 = 0;
  v54 = 0;
  v52 = 0;
  v55 = 0;
  v56 = 0;
  v18 = 0;
  v19 = 0;
  v20 = *(unsigned __int8 *)(v60 + 80);
  v46 = v16;
  v21 = v16 + ((v20 + 32) & ~v20);
  v59 = *(_QWORD *)(v60 + 72);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  v57 = 0;
  v58 = v22;
  do
  {
    v23 = v18;
    v58(v2, v21, v0);
    v24 = sub_19A990854();
    v26 = v25;
    v27 = sub_19A990848();
    v29 = v28;
    if (qword_1EE3B60D0 != -1)
      swift_once();
    v30 = qword_1EE3B6780 == v27 && *(_QWORD *)algn_1EE3B6788 == v29;
    if (v30 || (sub_19A991298() & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
      swift_bridgeObjectRelease();
      v18 = v24;
      v19 = v26;
    }
    else
    {
      if (qword_1EE3B60D8 != -1)
        swift_once();
      if (qword_1EE3B6790 == v27 && *(_QWORD *)algn_1EE3B6798 == v29 || (sub_19A991298() & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
        swift_bridgeObjectRelease();
        v56 = v24;
        v57 = v26;
      }
      else
      {
        if (qword_1EE3B60E0 != -1)
          swift_once();
        if (qword_1EE3B67A0 == v27 && *(_QWORD *)algn_1EE3B67A8 == v29 || (sub_19A991298() & 1) != 0)
        {
          (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
          swift_bridgeObjectRelease();
          v52 = v24;
          v55 = v26;
        }
        else
        {
          if (qword_1EE3B60E8 != -1)
            swift_once();
          if (qword_1EE3B67B0 == v27 && *(_QWORD *)algn_1EE3B67B8 == v29 || (sub_19A991298() & 1) != 0)
          {
            (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
            swift_bridgeObjectRelease();
            v53 = v24;
            v54 = v26;
          }
          else
          {
            if (qword_1EE3B60F0 != -1)
              swift_once();
            if (qword_1EE3B67C0 == v27 && *(_QWORD *)algn_1EE3B67C8 == v29)
            {
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
              v49 = v24;
              v50 = v26;
            }
            else
            {
              v31 = sub_19A991298();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v60 + 8))(v2, v0);
              v33 = v49;
              v32 = v50;
              if ((v31 & 1) != 0)
              {
                v33 = v24;
                v32 = v26;
              }
              v49 = v33;
              v50 = v32;
            }
          }
        }
      }
      v18 = v23;
    }
    swift_bridgeObjectRelease();
    v21 += v59;
    --v17;
  }
  while (v17);
  swift_bridgeObjectRelease();
  if (!v19)
  {
    v6 = v47;
    v5 = v48;
    v37 = v49;
    v36 = v50;
    v39 = v55;
    v38 = (char *)v56;
    goto LABEL_58;
  }
  v6 = v47;
  v5 = v48;
  v37 = v49;
  v36 = v50;
  v39 = v55;
  v38 = (char *)v56;
LABEL_59:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_19A99A940;
  *(_QWORD *)(v42 + 32) = 0x6C426D6574737973;
  *(_QWORD *)(v42 + 40) = 0xEF726F6C6F436575;
  *(_QWORD *)(v42 + 48) = 0xD000000000000011;
  *(_QWORD *)(v42 + 56) = 0x800000019A9A01E0;
  v43 = objc_allocWithZone((Class)type metadata accessor for UserGuide());
  v34 = (char *)UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v18, v19, v53, v54, 0, 0, 0x6761702E6B6F6F62, 0xEA00000000007365, 0, 0, 0, v42);
  if (v57)
  {
    if (v39)
    {
      v61 = v38;
      v62 = v57;
      sub_19A990DAC();
      sub_19A990DAC();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath);
  v61 = v34;
  sub_19A95CC28();
  sub_19A990B30();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v51, v5);
  v45 = &v34[OBJC_IVAR___TPSUserGuide_referrer];
  swift_beginAccess();
  *(_QWORD *)v45 = v37;
  *((_QWORD *)v45 + 1) = v36;
  swift_bridgeObjectRelease();
  return v34;
}

unint64_t sub_19A96AED0()
{
  unint64_t result;

  result = qword_1ED03D178;
  if (!qword_1ED03D178)
  {
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED03D178);
  }
  return result;
}

uint64_t sub_19A96AF1C()
{
  return type metadata accessor for UserGuide();
}

uint64_t method lookup function for UserGuide()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserGuide.__allocating_init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_19A96AF50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A96B040(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_19A990860() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A96B158()
{
  return sub_19A95D114();
}

uint64_t sub_19A96B16C()
{
  uint64_t v0;
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  v1 = (id *)(v0 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  if (*v1)
  {
    v2 = *v1;
    v3 = objc_msgSend(v2, sel_identifier);
    sub_19A990D58();

    MEMORY[0x1E0C80A78](v4);
    sub_19A990FC8();
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    sub_19A990B30();

  }
  else
  {
    v6 = swift_getKeyPath();
    MEMORY[0x1E0C80A78](v6);
    sub_19A990B30();
  }
  return swift_release();
}

uint64_t (*sub_19A96B394(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_19A96B3DC;
}

uint64_t sub_19A96B3DC(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_19A96B16C();
  return result;
}

void *sub_19A96B4CC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  v1 = (void **)(v0 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_19A96B640(void *a1)
{
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B30();
  swift_release();

}

id sub_19A96B6E8@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3;
  void **v4;
  void *v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  v4 = (void **)(v3 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  v5 = *v4;
  *a2 = *v4;
  return v5;
}

void sub_19A96B798(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  v2 = v1;
  sub_19A990B30();
  swift_release();

}

uint64_t type metadata accessor for TPSSavedTipsManager()
{
  uint64_t result;

  result = qword_1EE3B5928;
  if (!qword_1EE3B5928)
    return swift_getSingletonMetadata();
  return result;
}

void sub_19A96B88C(uint64_t a1, void *a2)
{
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(a1 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a2;
  v5 = a2;

  sub_19A96B16C();
}

void sub_19A96B910()
{
  uint64_t v0;

  sub_19A96B88C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void (*sub_19A96B928(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_19A990B54();
  swift_release();
  v4[7] = sub_19A96B394((uint64_t)v4);
  return sub_19A96BA10;
}

void sub_19A96BA10(_QWORD *a1)
{
  sub_19A96BF88(a1);
}

uint64_t (*sub_19A96BA1C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A96BB18()
{
  uint64_t v0;
  unsigned __int8 *v1;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19A96BC7C()
{
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B30();
  return swift_release();
}

uint64_t sub_19A96BD24@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  v4 = (_BYTE *)(v3 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_19A96BDD4()
{
  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B30();
  return swift_release();
}

uint64_t sub_19A96BE80()
{
  return sub_19A971400();
}

void (*sub_19A96BE94(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  sub_19A990B3C();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_19A990B54();
  swift_release();
  v4[7] = sub_19A96BA1C();
  return sub_19A96BF7C;
}

void sub_19A96BF7C(_QWORD *a1)
{
  sub_19A96BF88(a1);
}

void sub_19A96BF88(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_19A990B48();
  swift_release();
  free(v1);
}

id sub_19A96BFF8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSSavedTipsManager()), sel_init);
  qword_1ED03D388 = (uint64_t)result;
  return result;
}

id TPSSavedTipsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static TPSSavedTipsManager.sharedInstance.getter()
{
  if (qword_1ED03D398 != -1)
    swift_once();
  return (id)qword_1ED03D388;
}

void sub_19A96C088()
{
  qword_1ED03D2E8 = 0x6465766153535054;
  *(_QWORD *)algn_1ED03D2F0 = 0xEF70614D73706954;
}

id TPSSavedTipsManager.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;

  v1 = sub_19A990FA4();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_19A990C50();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_19A990FBC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR___TPSSavedTipsManager__currentTip] = 0;
  v0[OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved] = 0;
  v7 = OBJC_IVAR___TPSSavedTipsManager_savedTipsMap;
  v8 = v0;
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[v7] = sub_19A958C90(MEMORY[0x1E0DEE9D8]);
  v13 = OBJC_IVAR___TPSSavedTipsManager_queue;
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3D8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D8], v3);
  sub_19A990C38();
  v15 = v9;
  sub_19A90A994((unint64_t *)&qword_1ED03D3D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
  sub_19A96C2F8();
  sub_19A9910B8();
  *(_QWORD *)&v8[v13] = sub_19A990FE0();
  sub_19A990B60();

  v10 = (objc_class *)type metadata accessor for TPSSavedTipsManager();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  sub_19A96E660();

  return v11;
}

unint64_t sub_19A96C2F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED03D3C0;
  if (!qword_1ED03D3C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED03D3B8);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED03D3C0);
  }
  return result;
}

uint64_t sub_19A96C364()
{
  unsigned __int8 v1;

  sub_19A990FC8();
  return v1;
}

uint64_t sub_19A96C3C8@<X0>(uint64_t a1@<X0>, char *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  result = MEMORY[0x1E0C80A78](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_19A970ED8(v10, a1, (uint64_t)a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_19A96C590(v11);
    v13 = v12;
    a2 = v14;
    swift_release();
    if (v13)
    {
      swift_bridgeObjectRelease();
      v15 = &a2[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      v16 = sub_19A990ADC();
      v17 = *(_QWORD *)(v16 - 8);
      (*(void (**)(_BYTE *, char *, uint64_t))(v17 + 16))(v9, v15, v16);

      LOBYTE(a2) = 1;
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16) != 1)
        goto LABEL_7;
    }
    else
    {
      v18 = sub_19A990ADC();
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
    }
    LOBYTE(a2) = 0;
LABEL_7:
    result = sub_19A960074((uint64_t)v9);
  }
  *a3 = (_BYTE)a2;
  return result;
}

_QWORD *sub_19A96C590(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_19A970BDC(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_19A970C64(&v5, (uint64_t)result, v3, 0, a1);
}

uint64_t sub_19A96C6D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v7 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  v8 = *v7;
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_19A979BFC(a2, a3);
    if ((v10 & 1) != 0)
    {
      v11 = (char *)*(id *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = &v11[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      v13 = sub_19A990ADC();
      v14 = *(_QWORD *)(v13 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(a4, v12, v13);

      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a4, 0, 1, v13);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v16 = sub_19A990ADC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a4, 1, 1, v16);
}

uint64_t sub_19A96C820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v16[6];

  v9 = *(NSObject **)&v4[OBJC_IVAR___TPSSavedTipsManager_queue];
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v4;
  v10[3] = a1;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_19A96E91C;
  *(_QWORD *)(v11 + 24) = v10;
  v16[4] = sub_19A968160;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_19A96CCFC;
  v16[3] = &block_descriptor_2;
  v12 = _Block_copy(v16);
  v13 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_19A96C978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  char v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  char *v26;
  char *v27;
  uint64_t *v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;

  v10 = sub_19A990ADC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  if (!*(_QWORD *)(*v14 + 16)
    || (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_19A979BFC(a2, a3),
        v16 = v15,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v16 & 1) == 0))
  {
    v36 = a5;
    sub_19A990AD0();
    v18 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (v18)
    {
      v19 = v18;
      v20 = a4;
      v35 = a2;
      v21 = objc_msgSend(v18, sel_majorVersion);

      if (v21)
      {
        v22 = sub_19A990D58();
        v24 = v23;

        v25 = (objc_class *)type metadata accessor for TPSSavedTipEntry();
        v26 = (char *)objc_allocWithZone(v25);
        v27 = &v26[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
        *(_QWORD *)v27 = v20;
        *((_QWORD *)v27 + 1) = v36;
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v26[OBJC_IVAR___TPSSavedTipEntry_savedDate], v13, v10);
        v28 = (uint64_t *)&v26[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
        *v28 = v22;
        v28[1] = v24;
        v38.receiver = v26;
        v38.super_class = v25;
        swift_bridgeObjectRetain();
        v29 = objc_msgSendSuper2(&v38, sel_init);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v17 = v29;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v37 = *v14;
        *v14 = 0x8000000000000000;
        sub_19A9598B8((uint64_t)v17, v35, a3, isUniquelyReferenced_nonNull_native);
        *v14 = v37;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        goto LABEL_7;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v17 = (id)sub_19A979D7C(a2, a3);
  swift_endAccess();
  swift_bridgeObjectRelease();
LABEL_7:

  v31 = (void *)objc_opt_self();
  type metadata accessor for TPSSavedTipEntry();
  swift_bridgeObjectRetain();
  v32 = (void *)sub_19A990CBC();
  swift_bridgeObjectRelease();
  if (qword_1ED03D300 != -1)
    swift_once();
  v33 = (void *)sub_19A990D34();
  objc_msgSend(v31, sel_archivedDataWithRootObject_forKey_, v32, v33);

}

uint64_t sub_19A96CCDC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_19A96CCFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_19A96CD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_queue_t v30;
  _QWORD aBlock[6];

  v28 = a6;
  v29 = a7;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *(dispatch_queue_t *)&v7[OBJC_IVAR___TPSSavedTipsManager_queue];
  sub_19A95ED9C(a5, (uint64_t)v16);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = (v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v7;
  v19[3] = a1;
  v19[4] = a2;
  sub_19A96EA18((uint64_t)v16, (uint64_t)v19 + v17);
  v20 = (_QWORD *)((char *)v19 + v18);
  *v20 = a3;
  v20[1] = a4;
  v21 = (_QWORD *)((char *)v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8));
  v22 = v29;
  *v21 = v28;
  v21[1] = v22;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_19A96EA60;
  *(_QWORD *)(v23 + 24) = v19;
  aBlock[4] = sub_19A971470;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A96CCFC;
  aBlock[3] = &block_descriptor_17;
  v24 = _Block_copy(aBlock);
  v25 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v30, v24);
  _Block_release(v24);
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v22 & 1) != 0)
    __break(1u);
  return result;
}

void sub_19A96CF8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), uint64_t a7, uint64_t a8)
{
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
  char *v23;
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
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char *v42;
  char *v43;
  unsigned int (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  void (*v48)(uint64_t, char *, uint64_t);
  uint64_t v49;
  void (*v50)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  objc_class *v58;
  char *v59;
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t *v65;
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  void *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char isUniquelyReferenced_nonNull_native;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  void (*v82)(char *, char *, uint64_t);
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  objc_super v93;
  uint64_t v94;

  v87 = a8;
  v86 = a7;
  v82 = a6;
  v81 = a5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  v13 = MEMORY[0x1E0C80A78](v12);
  v84 = (uint64_t)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v85 = (char *)&v79 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v88 = (uint64_t)&v79 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v83 = (char *)&v79 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v79 - v22;
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v79 - v24;
  v26 = sub_19A990ADC();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x1E0C80A78](v26);
  v80 = (char *)&v79 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x1E0C80A78](v28);
  v89 = (char *)&v79 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v34 = (char *)&v79 - v33;
  MEMORY[0x1E0C80A78](v32);
  v36 = (char *)&v79 - v35;
  v37 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  v90 = v37;
  v91 = a2;
  v38 = *v37;
  v39 = *(_QWORD *)(v38 + 16);
  v92 = a3;
  if (v39)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40 = sub_19A979BFC(a2, a3);
    if ((v41 & 1) != 0)
    {
      v42 = *(char **)(*(_QWORD *)(v38 + 56) + 8 * v40);
      v43 = v42;
    }
    else
    {
      v42 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v42 = 0;
  }
  sub_19A95ED9C(a4, (uint64_t)v25);
  v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v44(v25, 1, v26) == 1)
  {
    sub_19A960074((uint64_t)v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v36, v25, v26);
    if (!v42)
    {
      v57 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
      v57(v34, v36, v26);
      v58 = (objc_class *)type metadata accessor for TPSSavedTipEntry();
      v59 = (char *)objc_allocWithZone(v58);
      v60 = &v59[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
      v61 = v82;
      *(_QWORD *)v60 = v81;
      *((_QWORD *)v60 + 1) = v61;
      v57(&v59[OBJC_IVAR___TPSSavedTipEntry_savedDate], v34, v26);
      v62 = &v59[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
      v63 = v87;
      *(_QWORD *)v62 = v86;
      *((_QWORD *)v62 + 1) = v63;
      v93.receiver = v59;
      v93.super_class = v58;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42 = (char *)objc_msgSendSuper2(&v93, sel_init);
      v64 = *(void (**)(char *, uint64_t))(v27 + 8);
      v64(v34, v26);
      v64(v36, v26);
      v65 = v90;
      swift_beginAccess();
      v45 = v91;
      if (!v42)
        goto LABEL_24;
LABEL_26:
      v73 = v92;
      swift_bridgeObjectRetain();
      v74 = v42;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v94 = *v65;
      *v65 = 0x8000000000000000;
      sub_19A9598B8((uint64_t)v74, v45, v73, isUniquelyReferenced_nonNull_native);
      *v65 = v94;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v36, v26);
  }
  sub_19A95ED9C(a4, (uint64_t)v23);
  if (v44(v23, 1, v26) == 1)
  {
    sub_19A960074((uint64_t)v23);
    if (!v42)
      return;
    v45 = v91;
    goto LABEL_23;
  }
  v46 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v47 = v89;
  v46(v89, v23, v26);
  if (!v42)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v47, v26);
    return;
  }
  v82 = v46;
  v48 = *(void (**)(uint64_t, char *, uint64_t))(v27 + 16);
  v49 = v88;
  v48(v88, v47, v26);
  v50 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56);
  v50(v49, 0, 1, v26);
  v51 = &v42[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  swift_beginAccess();
  v52 = (uint64_t)v85;
  v48((uint64_t)v85, v51, v26);
  v50(v52, 0, 1, v26);
  v53 = v49;
  v54 = v84;
  sub_19A95ED9C(v53, v84);
  if (v44((char *)v54, 1, v26) == 1)
  {
    v55 = v42;
    sub_19A960074(v54);
    v56 = (uint64_t)v83;
    sub_19A95ED9C(v52, (uint64_t)v83);
  }
  else
  {
    v56 = (uint64_t)v83;
    v82(v83, (char *)v54, v26);
    v50(v56, 0, 1, v26);
    v66 = v42;
  }
  v65 = v90;
  v45 = v91;
  sub_19A960074(v52);
  sub_19A960074(v88);
  v67 = *(void (**)(char *, uint64_t))(v27 + 8);
  v67(v89, v26);
  if (v44((char *)v56, 1, v26) != 1)
  {
    v70 = v80;
    v82(v80, (char *)v56, v26);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v27 + 24))(v51, v70, v26);
    swift_endAccess();
    v67(v70, v26);
    v71 = &v42[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
    swift_beginAccess();
    v72 = v87;
    *(_QWORD *)v71 = v86;
    *((_QWORD *)v71 + 1) = v72;
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    swift_beginAccess();
    goto LABEL_26;
  }

  sub_19A960074(v56);
LABEL_23:

  swift_beginAccess();
LABEL_24:
  v68 = v92;
  swift_bridgeObjectRetain();
  v69 = (void *)sub_19A979D7C(v45, v68);
  swift_bridgeObjectRelease();

  v42 = 0;
LABEL_27:
  swift_endAccess();
  v76 = (void *)objc_opt_self();
  type metadata accessor for TPSSavedTipEntry();
  swift_bridgeObjectRetain();
  v77 = (void *)sub_19A990CBC();
  swift_bridgeObjectRelease();
  if (qword_1ED03D300 != -1)
    swift_once();
  v78 = (void *)sub_19A990D34();
  objc_msgSend(v76, sel_archivedDataWithRootObject_forKey_, v77, v78);

}

uint64_t sub_19A96D868()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
  sub_19A990FC8();
  return v1;
}

uint64_t sub_19A96D8D0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v4 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  v5 = *v4;
  swift_bridgeObjectRetain_n();
  v6 = sub_19A9836C0(v5);
  swift_bridgeObjectRelease();
  v19 = v6;
  sub_19A96F0C4(&v19);
  if (v2)
  {
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = v19;
    v8 = v19[2];
    if (v8)
    {
      v18 = a2;
      v20 = MEMORY[0x1E0DEE9D8];
      sub_19A98E31C(0, v8, 0);
      v9 = 6;
      v10 = v20;
      do
      {
        v11 = (uint64_t *)(v7[v9] + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
        swift_beginAccess();
        v12 = *v11;
        v13 = v11[1];
        v20 = v10;
        v14 = *(_QWORD *)(v10 + 16);
        v15 = *(_QWORD *)(v10 + 24);
        swift_bridgeObjectRetain();
        if (v14 >= v15 >> 1)
        {
          sub_19A98E31C(v15 > 1, v14 + 1, 1);
          v10 = v20;
        }
        *(_QWORD *)(v10 + 16) = v14 + 1;
        v16 = v10 + 16 * v14;
        *(_QWORD *)(v16 + 32) = v12;
        *(_QWORD *)(v16 + 40) = v13;
        v9 += 3;
        --v8;
      }
      while (v8);
      result = swift_release();
      a2 = v18;
    }
    else
    {
      result = swift_release();
      v10 = MEMORY[0x1E0DEE9D8];
    }
    *a2 = v10;
  }
  return result;
}

uint64_t sub_19A96DAFC()
{
  char *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = *(NSObject **)&v0[OBJC_IVAR___TPSSavedTipsManager_queue];
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_19A96EB0C;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_19A971470;
  v8[5] = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_19A96CCFC;
  v8[3] = &block_descriptor_27;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_19A96DC24(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  char v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unsigned __int8 *v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 *v57;
  unsigned int v58;
  uint64_t v59;
  char v60;
  _QWORD v61[5];
  uint64_t *v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  int64_t v68;
  _QWORD v69[3];
  uint64_t v70;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v2)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_majorVersion);

  if (!v4)
  {
LABEL_104:
    __break(1u);
    return;
  }
  v5 = 0;
  v6 = sub_19A990D58();
  v8 = v7;

  v9 = HIBYTE(v8) & 0xF;
  v10 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0)
    v11 = HIBYTE(v8) & 0xF;
  else
    v11 = v6 & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    if ((v8 & 0x1000000000000000) != 0)
    {
      v63 = 0;
      v13 = (uint64_t)sub_19A9703B8(v6, v8, 10);
      LOBYTE(v6) = v60;
LABEL_37:
      swift_bridgeObjectRelease();
      v19 = v6 & 1;
      if ((v6 & 1) != 0)
        v20 = 0;
      else
        v20 = v13;
      goto LABEL_40;
    }
    if ((v8 & 0x2000000000000000) == 0)
    {
      if ((v6 & 0x1000000000000000) != 0)
        v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v12 = (unsigned __int8 *)sub_19A991190();
      v13 = (uint64_t)sub_19A9704A4(v12, v10, 10);
      LOBYTE(v6) = v14 & 1;
      goto LABEL_36;
    }
    v69[0] = v6;
    v69[1] = v8 & 0xFFFFFFFFFFFFFFLL;
    if (v6 == 43)
    {
      if (v9)
      {
        if (v9 != 1 && (BYTE1(v6) - 48) <= 9u)
        {
          v13 = (BYTE1(v6) - 48);
          if (v9 == 2)
            goto LABEL_35;
          if ((BYTE2(v6) - 48) <= 9u)
          {
            v13 = 10 * (BYTE1(v6) - 48) + (BYTE2(v6) - 48);
            v15 = v9 - 3;
            if (v15)
            {
              v16 = (unsigned __int8 *)v69 + 3;
              while (1)
              {
                v17 = *v16 - 48;
                if (v17 > 9)
                  goto LABEL_33;
                v18 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                  goto LABEL_33;
                v13 = v18 + v17;
                if (__OFADD__(v18, v17))
                  goto LABEL_33;
                LOBYTE(v6) = 0;
                ++v16;
                if (!--v15)
                  goto LABEL_36;
              }
            }
            goto LABEL_35;
          }
        }
        goto LABEL_33;
      }
    }
    else
    {
      if (v6 != 45)
      {
        if (v9 && (v6 - 48) <= 9u)
        {
          v13 = (v6 - 48);
          if (v9 == 1)
            goto LABEL_35;
          if ((BYTE1(v6) - 48) <= 9u)
          {
            v13 = 10 * (v6 - 48) + (BYTE1(v6) - 48);
            v52 = v9 - 2;
            if (v52)
            {
              v53 = (unsigned __int8 *)v69 + 2;
              while (1)
              {
                v54 = *v53 - 48;
                if (v54 > 9)
                  goto LABEL_33;
                v55 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                  goto LABEL_33;
                v13 = v55 + v54;
                if (__OFADD__(v55, v54))
                  goto LABEL_33;
                LOBYTE(v6) = 0;
                ++v53;
                if (!--v52)
                  goto LABEL_36;
              }
            }
            goto LABEL_35;
          }
        }
LABEL_33:
        v13 = 0;
        LOBYTE(v6) = 1;
        goto LABEL_36;
      }
      if (v9)
      {
        if (v9 != 1 && (BYTE1(v6) - 48) <= 9u)
        {
          if (v9 == 2)
          {
            LOBYTE(v6) = 0;
            v13 = -(uint64_t)(BYTE1(v6) - 48);
LABEL_36:
            v63 = 0;
            goto LABEL_37;
          }
          if ((BYTE2(v6) - 48) <= 9u)
          {
            v13 = -10 * (BYTE1(v6) - 48) - (BYTE2(v6) - 48);
            v56 = v9 - 3;
            if (v56)
            {
              v57 = (unsigned __int8 *)v69 + 3;
              while (1)
              {
                v58 = *v57 - 48;
                if (v58 > 9)
                  goto LABEL_33;
                v59 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                  goto LABEL_33;
                v13 = v59 - v58;
                if (__OFSUB__(v59, v58))
                  goto LABEL_33;
                LOBYTE(v6) = 0;
                ++v57;
                if (!--v56)
                  goto LABEL_36;
              }
            }
LABEL_35:
            LOBYTE(v6) = 0;
            goto LABEL_36;
          }
        }
        goto LABEL_33;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_103;
  }
LABEL_98:
  v63 = v5;
  swift_bridgeObjectRelease();
  v20 = 0;
  v19 = 1;
LABEL_40:
  v64 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v70 = MEMORY[0x1E0DEE9D8];
  v21 = a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap;
  a1 = 1;
  swift_beginAccess();
  v62 = (uint64_t *)v21;
  v22 = *(_QWORD *)v21;
  v23 = *(_QWORD *)(*(_QWORD *)v21 + 64);
  v67 = *(_QWORD *)v21 + 64;
  v24 = 1 << *(_BYTE *)(v22 + 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v5 = v25 & v23;
  v68 = (unint64_t)(v24 + 63) >> 6;
  v65 = v20 - 2;
  v26 = __OFSUB__(v20, 2);
  v66 = v26;
  swift_bridgeObjectRetain();
  v27 = 0;
  while (1)
  {
    while (v5)
    {
      v28 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v29 = v28 | (v27 << 6);
      if ((v19 & 1) == 0)
      {
LABEL_61:
        v33 = (uint64_t *)(*(_QWORD *)(v22 + 48) + 16 * v29);
        v35 = *v33;
        v34 = v33[1];
        a1 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v29);
        v36 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
        swift_beginAccess();
        v37 = *v36;
        v38 = v36[1];
        swift_bridgeObjectRetain();
        v39 = (id)a1;
        swift_bridgeObjectRetain();
        v40 = sub_19A96E314(v37, v38);
        if ((v41 & 1) != 0)
          goto LABEL_46;
        if (v66)
          goto LABEL_96;
        if (v65 < v40)
        {
LABEL_46:

          swift_bridgeObjectRelease();
        }
        else
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            v42 = v64;
          else
            v42 = sub_19A96A420(0, v64[2] + 1, 1, v64);
          v44 = v42[2];
          v43 = v42[3];
          if (v44 >= v43 >> 1)
            v42 = sub_19A96A420((_QWORD *)(v43 > 1), v44 + 1, 1, v42);
          v42[2] = v44 + 1;
          v45 = &v42[2 * v44];
          v45[4] = v35;
          v45[5] = v34;
          a1 = (uint64_t)v42;

          v64 = (_QWORD *)a1;
          v70 = a1;
        }
      }
    }
    if (__OFADD__(v27++, 1))
    {
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
      goto LABEL_98;
    }
    if (v27 >= v68)
      goto LABEL_74;
    v31 = *(_QWORD *)(v67 + 8 * v27);
    if (!v31)
      break;
LABEL_60:
    v5 = (v31 - 1) & v31;
    v29 = __clz(__rbit64(v31)) + (v27 << 6);
    if ((v19 & 1) == 0)
      goto LABEL_61;
  }
  v32 = v27 + 1;
  if (v27 + 1 >= v68)
    goto LABEL_74;
  v31 = *(_QWORD *)(v67 + 8 * v32);
  if (v31)
    goto LABEL_59;
  v32 = v27 + 2;
  if (v27 + 2 >= v68)
    goto LABEL_74;
  v31 = *(_QWORD *)(v67 + 8 * v32);
  if (v31)
  {
LABEL_59:
    v27 = v32;
    goto LABEL_60;
  }
  v32 = v27 + 3;
  if (v27 + 3 < v68)
  {
    v31 = *(_QWORD *)(v67 + 8 * v32);
    if (!v31)
    {
      while (1)
      {
        v27 = v32 + 1;
        if (__OFADD__(v32, 1))
          goto LABEL_97;
        if (v27 >= v68)
          goto LABEL_74;
        v31 = *(_QWORD *)(v67 + 8 * v27);
        ++v32;
        if (v31)
          goto LABEL_60;
      }
    }
    goto LABEL_59;
  }
LABEL_74:
  swift_release();
  if (v64[2])
  {
    v46 = v62;
    MEMORY[0x1E0C80A78](v64);
    v61[2] = &v70;
    v47 = swift_bridgeObjectRetain();
    v48 = sub_19A971290(v47, (uint64_t (*)(uint64_t, uint64_t, id))sub_19A97049C, (uint64_t)v61);
    swift_bridgeObjectRelease();
    *v46 = v48;
    swift_bridgeObjectRelease();
    v49 = (void *)objc_opt_self();
    type metadata accessor for TPSSavedTipEntry();
    swift_bridgeObjectRetain();
    v50 = (void *)sub_19A990CBC();
    swift_bridgeObjectRelease();
    if (qword_1ED03D300 != -1)
      swift_once();
    v51 = (void *)sub_19A990D34();
    objc_msgSend(v49, sel_archivedDataWithRootObject_forKey_, v50, v51);

  }
  swift_bridgeObjectRelease();
}

uint64_t sub_19A96E314(uint64_t result, unint64_t a2)
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
        v6 = (unsigned __int8 *)sub_19A991190();
      v7 = (uint64_t)sub_19A9704A4(v6, v4, 10);
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
  v7 = (uint64_t)sub_19A9703B8(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t sub_19A96E560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  char v9;
  uint64_t result;
  _QWORD *v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;

  v4 = *(_QWORD **)a4;
  v5 = *(_QWORD *)(*(_QWORD *)a4 + 16);
  if (!v5)
    return 1;
  if (v4[4] == a1 && v4[5] == a2)
    return 0;
  v9 = sub_19A991298();
  result = 0;
  if ((v9 & 1) == 0)
  {
    if (v5 == 1)
      return 1;
    v11 = v4 + 7;
    for (i = 1; ; ++i)
    {
      v13 = i + 1;
      if (__OFADD__(i, 1))
        break;
      v14 = *(v11 - 1) == a1 && *v11 == a2;
      if (v14 || (sub_19A991298() & 1) != 0)
        return 0;
      v11 += 2;
      result = 1;
      if (v13 == v5)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_19A96E660()
{
  uint64_t v0;
  uint64_t inited;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v12;

  sub_19A988EC8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19A99A9C0;
  *(_QWORD *)(inited + 32) = sub_19A90A170(0, &qword_1ED03D3C8);
  *(_QWORD *)(inited + 40) = sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  *(_QWORD *)(inited + 48) = type metadata accessor for TPSSavedTipEntry();
  sub_19A959DDC(inited);
  swift_setDeallocating();
  v2 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v3 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithArray_, v3);

  sub_19A990F38();
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_19A990F2C();
  swift_bridgeObjectRelease();
  if (qword_1ED03D300 != -1)
    swift_once();
  v7 = (void *)sub_19A990D34();
  v8 = objc_msgSend(v5, sel_unarchivedObjectOfClasses_forKey_, v6, v7);

  sub_19A9910A0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B0);
  if (swift_dynamicCast())
    v9 = v12;
  else
    v9 = sub_19A958C90(MEMORY[0x1E0DEE9D8]);
  v10 = (unint64_t *)(v0 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  *v10 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A96E8B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_19A96C3C8(*(_QWORD *)(v1 + 16), *(char **)(v1 + 24), a1);
}

uint64_t sub_19A96E8CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_19A96C6D8(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_19A96E8E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_19A96E91C()
{
  uint64_t *v0;

  sub_19A96C978(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_19A96E92C()
{
  return swift_deallocObject();
}

uint64_t sub_19A96E93C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);

  swift_bridgeObjectRelease();
  v3 = sub_19A990ADC();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A96EA18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_19A96EA60()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_19A96CF8C(v0[2], v0[3], v0[4], (uint64_t)v0 + v2, *(uint64_t *)((char *)v0 + v3), *(void (**)(char *, char *, uint64_t))((char *)v0 + v3 + 8), *(uint64_t *)((char *)v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t *)((char *)v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_19A96EAC0()
{
  return swift_deallocObject();
}

uint64_t sub_19A96EAD0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_19A96D8D0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_19A96EAE8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_19A96EB0C()
{
  uint64_t v0;

  sub_19A96DC24(*(_QWORD *)(v0 + 16));
}

uint64_t sub_19A96EB14()
{
  return swift_deallocObject();
}

id TPSSavedTipsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSSavedTipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19A96EBC8()
{
  return type metadata accessor for TPSSavedTipsManager();
}

uint64_t sub_19A96EBD0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A990B6C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TPSSavedTipsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isSavedWithTipIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.savedDate(correlationId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.toggleSavedTip(correlationId:tipIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.updateSavedTips(correlationId:tipIdentifier:savedDate:lastUsedVersion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.identifiers()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.removeInvalidEntries()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

_QWORD *sub_19A96EDC8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B64E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19A96EE2C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t *v33;
  uint64_t v34;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6380);
  result = sub_19A9911FC();
  v9 = result;
  v33 = a1;
  v34 = a2;
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
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v34)
        return v9;
      v16 = v33[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= v34)
          return v9;
        v16 = v33[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= v34)
            return v9;
          v16 = v33[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v34)
              return v9;
            v16 = v33[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= v34)
                  return v9;
                v16 = v33[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v14);
    sub_19A991340();
    swift_bridgeObjectRetain();
    v22 = v21;
    sub_19A990DA0();
    result = sub_19A991364();
    v23 = -1 << *(_BYTE *)(v9 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v25 == v28;
        if (v25 == v28)
          v25 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v30 == -1);
      v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    v31 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v26);
    *v31 = v20;
    v31[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v26) = v22;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_19A96F0C4(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_19A985A44(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_19A96F12C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_19A96F12C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  void **v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  void (*v82)(char *, char *, uint64_t);
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  uint64_t v118;
  char v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  void (*v158)(char *, uint64_t);
  void (*v159)(char *, char *, uint64_t);
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  uint64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;

  v168 = sub_19A990ADC();
  v172 = *(_QWORD *)(v168 - 8);
  v3 = MEMORY[0x1E0C80A78](v168);
  v167 = (char *)&v151 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v166 = (char *)&v151 - v5;
  v6 = a1[1];
  result = sub_19A991274();
  v160 = v6;
  if (result >= v6)
  {
    if (v6 < 0)
      goto LABEL_138;
    if ((unint64_t)v6 >= 2)
    {
      v163 = v1;
      v165 = *a1;
      v12 = (_QWORD *)(v165 + 24);
      v13 = -1;
      v14 = 1;
      v15 = v166;
      v16 = v168;
      do
      {
        v161 = v14;
        v17 = *(char **)(v165 + 24 * v14 + 16);
        v162 = v13;
        v169 = (char *)v13;
        v164 = v12;
        do
        {
          v18 = (char *)*(v12 - 1);
          v171 = *(v12 - 2);
          v19 = &v17[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v20 = *(void (**)(char *, char *, uint64_t))(v172 + 16);
          v20(v15, v19, v16);
          v21 = &v18[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v22 = v167;
          v20(v167, v21, v16);
          swift_bridgeObjectRetain();
          v170 = v17;
          swift_bridgeObjectRetain();
          v23 = v18;
          v24 = sub_19A990AC4();
          v25 = *(void (**)(char *, uint64_t))(v172 + 8);
          v25(v22, v16);
          v25(v15, v16);

          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if (v24 != 1)
            break;
          if (!v165)
            goto LABEL_142;
          v26 = *v12;
          v27 = v12[1];
          v17 = (char *)v12[2];
          *(_OWORD *)v12 = *(_OWORD *)(v12 - 3);
          v12[2] = *(v12 - 1);
          *(v12 - 2) = v27;
          *(v12 - 1) = v17;
          *(v12 - 3) = v26;
          v12 -= 3;
        }
        while (!__CFADD__(v169++, 1));
        v14 = v161 + 1;
        v12 = v164 + 3;
        v13 = v162 - 1;
      }
      while (v161 + 1 != v160);
    }
    return result;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_147;
  v155 = result;
  v163 = v1;
  v152 = a1;
  if (v6 < 2)
  {
    v11 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    v154 = MEMORY[0x1E0DEE9D8];
    if (v6 != 1)
    {
      v31 = (char *)MEMORY[0x1E0DEE9D8];
      v32 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_104:
      if (v32 >= 2)
      {
        v143 = *v152;
        do
        {
          v144 = v32 - 2;
          if (v32 < 2)
            goto LABEL_133;
          if (!v143)
            goto LABEL_146;
          v145 = v31;
          v146 = *(_QWORD *)&v31[16 * v144 + 32];
          v147 = *(_QWORD *)&v31[16 * v32 + 24];
          v148 = v163;
          sub_19A96FE38((char *)(v143 + 24 * v146), (char *)(v143 + 24 * *(_QWORD *)&v31[16 * v32 + 16]), (char *)(v143 + 24 * v147), v11);
          v163 = v148;
          if (v148)
            break;
          if (v147 < v146)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v145 = sub_19A985050((uint64_t)v31);
          if (v144 >= *((_QWORD *)v145 + 2))
            goto LABEL_135;
          v149 = &v145[16 * v144 + 32];
          *(_QWORD *)v149 = v146;
          *((_QWORD *)v149 + 1) = v147;
          v150 = *((_QWORD *)v145 + 2);
          if (v32 > v150)
            goto LABEL_136;
          memmove(&v145[16 * v32 + 16], &v145[16 * v32 + 32], 16 * (v150 - v32));
          *((_QWORD *)v145 + 2) = v150 - 1;
          v32 = v150 - 1;
          v31 = v145;
        }
        while (v150 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v154 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v9 = v8 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5980);
    v10 = sub_19A990E6C();
    *(_QWORD *)(v10 + 16) = v9;
    v154 = v10;
    v11 = (char *)(v10 + 32);
  }
  v29 = 0;
  v30 = (_QWORD *)*a1;
  v153 = *a1 + 64;
  v31 = (char *)MEMORY[0x1E0DEE9D8];
  v164 = v30;
  v156 = v11;
  while (1)
  {
    v33 = v29;
    v34 = v29 + 1;
    v161 = v29;
    if (v29 + 1 < v6)
    {
      v157 = v31;
      v35 = &v30[3 * v34];
      v37 = (char *)v35[1];
      v36 = (char *)v35[2];
      v38 = &v30[3 * v29];
      v39 = v38[1];
      v40 = (char *)v38[2];
      v170 = v37;
      v171 = v39;
      v41 = &v36[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      v42 = v172;
      v43 = *(void (**)(char *, char *, uint64_t))(v172 + 16);
      v44 = v166;
      v45 = v168;
      v43(v166, v41, v168);
      v46 = &v40[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      v47 = v167;
      v159 = v43;
      v43(v167, v46, v45);
      swift_bridgeObjectRetain();
      v48 = v36;
      swift_bridgeObjectRetain();
      v49 = v40;
      v162 = sub_19A990AC4();
      v50 = *(void (**)(char *, uint64_t))(v42 + 8);
      v6 = v160;
      v50(v47, v45);
      v158 = v50;
      v50(v44, v45);

      swift_bridgeObjectRelease();
      v33 = v161;
      swift_bridgeObjectRelease();
      v34 = v33 + 2;
      if (v33 + 2 < v6)
      {
        v51 = (void **)(v153 + 24 * v33);
        while (1)
        {
          v165 = v34;
          LODWORD(v171) = v162 == 1;
          v52 = (char *)*v51;
          v53 = (char *)*(v51 - 4);
          v54 = (char *)*(v51 - 3);
          v169 = (char *)*(v51 - 1);
          v170 = v53;
          v55 = &v52[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v56 = v166;
          v57 = v168;
          v58 = v159;
          v159(v166, v55, v168);
          v59 = &v54[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v60 = v167;
          v58(v167, v59, v57);
          swift_bridgeObjectRetain();
          v61 = v52;
          swift_bridgeObjectRetain();
          v62 = v54;
          v63 = sub_19A990AC4();
          v64 = v60;
          v65 = v158;
          v158(v64, v57);
          v65(v56, v57);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((_DWORD)v171 == (v63 != 1))
            break;
          v34 = v165 + 1;
          v51 += 3;
          v6 = v160;
          if (v160 == v165 + 1)
          {
            v34 = v160;
            goto LABEL_29;
          }
        }
        v6 = v160;
        v34 = v165;
LABEL_29:
        v33 = v161;
      }
      v11 = v156;
      v31 = v157;
      v30 = v164;
      if (v162 == 1)
      {
        if (v34 < v33)
          goto LABEL_139;
        if (v33 < v34)
        {
          v66 = 3 * v34;
          v67 = 3 * v33;
          v68 = v34;
          v69 = v33;
          do
          {
            if (v69 != --v68)
            {
              if (!v30)
                goto LABEL_145;
              v70 = &v30[v67];
              v71 = &v30[v66];
              v72 = v30[v67];
              v73 = *(_OWORD *)&v30[v67 + 1];
              v74 = *(_OWORD *)&v30[v66 - 3];
              v70[2] = v30[v66 - 1];
              *(_OWORD *)v70 = v74;
              *(v71 - 3) = v72;
              *((_OWORD *)v71 - 1) = v73;
            }
            ++v69;
            v66 -= 3;
            v67 += 3;
          }
          while (v69 < v68);
        }
      }
    }
    if (v34 < v6)
    {
      if (__OFSUB__(v34, v33))
        goto LABEL_137;
      if (v34 - v33 < v155)
        break;
    }
LABEL_56:
    if (v34 < v33)
      goto LABEL_132;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v31 = sub_19A984DF4(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
    v92 = *((_QWORD *)v31 + 2);
    v91 = *((_QWORD *)v31 + 3);
    v32 = v92 + 1;
    v30 = v164;
    v165 = v34;
    if (v92 >= v91 >> 1)
    {
      v142 = sub_19A984DF4((char *)(v91 > 1), v92 + 1, 1, v31);
      v30 = v164;
      v31 = v142;
    }
    *((_QWORD *)v31 + 2) = v32;
    v93 = v31 + 32;
    v94 = &v31[16 * v92 + 32];
    v95 = v165;
    *(_QWORD *)v94 = v33;
    *((_QWORD *)v94 + 1) = v95;
    if (v92)
    {
      while (1)
      {
        v96 = v32 - 1;
        if (v32 >= 4)
        {
          v101 = &v93[16 * v32];
          v102 = *((_QWORD *)v101 - 8);
          v103 = *((_QWORD *)v101 - 7);
          v107 = __OFSUB__(v103, v102);
          v104 = v103 - v102;
          if (v107)
            goto LABEL_121;
          v106 = *((_QWORD *)v101 - 6);
          v105 = *((_QWORD *)v101 - 5);
          v107 = __OFSUB__(v105, v106);
          v99 = v105 - v106;
          v100 = v107;
          if (v107)
            goto LABEL_122;
          v108 = v32 - 2;
          v109 = &v93[16 * v32 - 32];
          v111 = *(_QWORD *)v109;
          v110 = *((_QWORD *)v109 + 1);
          v107 = __OFSUB__(v110, v111);
          v112 = v110 - v111;
          if (v107)
            goto LABEL_124;
          v107 = __OFADD__(v99, v112);
          v113 = v99 + v112;
          if (v107)
            goto LABEL_127;
          if (v113 >= v104)
          {
            v131 = &v93[16 * v96];
            v133 = *(_QWORD *)v131;
            v132 = *((_QWORD *)v131 + 1);
            v107 = __OFSUB__(v132, v133);
            v134 = v132 - v133;
            if (v107)
              goto LABEL_131;
            v124 = v99 < v134;
            goto LABEL_93;
          }
        }
        else
        {
          if (v32 != 3)
          {
            v125 = *((_QWORD *)v31 + 4);
            v126 = *((_QWORD *)v31 + 5);
            v107 = __OFSUB__(v126, v125);
            v118 = v126 - v125;
            v119 = v107;
            goto LABEL_87;
          }
          v98 = *((_QWORD *)v31 + 4);
          v97 = *((_QWORD *)v31 + 5);
          v107 = __OFSUB__(v97, v98);
          v99 = v97 - v98;
          v100 = v107;
        }
        if ((v100 & 1) != 0)
          goto LABEL_123;
        v108 = v32 - 2;
        v114 = &v93[16 * v32 - 32];
        v116 = *(_QWORD *)v114;
        v115 = *((_QWORD *)v114 + 1);
        v117 = __OFSUB__(v115, v116);
        v118 = v115 - v116;
        v119 = v117;
        if (v117)
          goto LABEL_126;
        v120 = &v93[16 * v96];
        v122 = *(_QWORD *)v120;
        v121 = *((_QWORD *)v120 + 1);
        v107 = __OFSUB__(v121, v122);
        v123 = v121 - v122;
        if (v107)
          goto LABEL_129;
        if (__OFADD__(v118, v123))
          goto LABEL_130;
        if (v118 + v123 >= v99)
        {
          v124 = v99 < v123;
LABEL_93:
          if (v124)
            v96 = v108;
          goto LABEL_95;
        }
LABEL_87:
        if ((v119 & 1) != 0)
          goto LABEL_125;
        v127 = &v93[16 * v96];
        v129 = *(_QWORD *)v127;
        v128 = *((_QWORD *)v127 + 1);
        v107 = __OFSUB__(v128, v129);
        v130 = v128 - v129;
        if (v107)
          goto LABEL_128;
        if (v130 < v118)
          goto LABEL_21;
LABEL_95:
        v135 = v96 - 1;
        if (v96 - 1 >= v32)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
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
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v30)
          goto LABEL_144;
        v136 = &v93[16 * v135];
        v137 = *(_QWORD *)v136;
        v138 = &v93[16 * v96];
        v139 = *((_QWORD *)v138 + 1);
        v140 = v163;
        sub_19A96FE38((char *)&v30[3 * *(_QWORD *)v136], (char *)&v30[3 * *(_QWORD *)v138], (char *)&v30[3 * v139], v11);
        v163 = v140;
        if (v140)
          goto LABEL_115;
        if (v139 < v137)
          goto LABEL_118;
        if (v96 > *((_QWORD *)v31 + 2))
          goto LABEL_119;
        *(_QWORD *)v136 = v137;
        *(_QWORD *)&v93[16 * v135 + 8] = v139;
        v141 = *((_QWORD *)v31 + 2);
        if (v96 >= v141)
          goto LABEL_120;
        v32 = v141 - 1;
        memmove(&v93[16 * v96], v138 + 16, 16 * (v141 - 1 - v96));
        *((_QWORD *)v31 + 2) = v141 - 1;
        v30 = v164;
        if (v141 <= 2)
          goto LABEL_21;
      }
    }
    v32 = 1;
LABEL_21:
    v6 = v160;
    v29 = v165;
    if (v165 >= v160)
      goto LABEL_104;
  }
  if (__OFADD__(v33, v155))
    goto LABEL_140;
  if (v33 + v155 >= v6)
    v75 = (void (*)(char *, char *, uint64_t))v6;
  else
    v75 = (void (*)(char *, char *, uint64_t))(v33 + v155);
  if ((uint64_t)v75 >= v33)
  {
    if ((void (*)(char *, char *, uint64_t))v34 != v75)
    {
      v157 = v31;
      v76 = &v30[3 * v34];
      v159 = v75;
      do
      {
        v78 = (char *)v30[3 * v34 + 2];
        v79 = v33;
        v162 = (uint64_t)v76;
        v165 = v34;
        while (1)
        {
          v80 = (char *)*(v76 - 1);
          v171 = *(v76 - 2);
          v169 = v80;
          v81 = &v78[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v82 = *(void (**)(char *, char *, uint64_t))(v172 + 16);
          v83 = v166;
          v84 = v168;
          v82(v166, v81, v168);
          v85 = &v80[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v86 = v167;
          v82(v167, v85, v84);
          swift_bridgeObjectRetain();
          v170 = v78;
          swift_bridgeObjectRetain();
          v87 = v169;
          v169 = (char *)sub_19A990AC4();
          v88 = *(void (**)(char *, uint64_t))(v172 + 8);
          v88(v86, v84);
          v88(v83, v84);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v169 != (char *)1)
            break;
          v30 = v164;
          v77 = v165;
          if (!v164)
            goto LABEL_143;
          v89 = *v76;
          v90 = v76[1];
          v78 = (char *)v76[2];
          *(_OWORD *)v76 = *(_OWORD *)(v76 - 3);
          v76[2] = *(v76 - 1);
          *(v76 - 2) = v90;
          *(v76 - 1) = (uint64_t)v78;
          *(v76 - 3) = v89;
          v76 -= 3;
          if (v77 == ++v79)
            goto LABEL_49;
        }
        v30 = v164;
        v77 = v165;
LABEL_49:
        v34 = v77 + 1;
        v76 = (uint64_t *)(v162 + 24);
        v33 = v161;
      }
      while ((void (*)(char *, char *, uint64_t))v34 != v159);
      v34 = (uint64_t)v159;
      v11 = v156;
      v31 = v157;
    }
    goto LABEL_56;
  }
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  result = sub_19A9911B4();
  __break(1u);
  return result;
}

uint64_t sub_19A96FE38(char *a1, char *a2, char *a3, char *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  void (*v23)(_BYTE *, char *, uint64_t);
  uint64_t v24;
  char *v25;
  _BYTE *v26;
  uint64_t v27;
  void (*v28)(_BYTE *, uint64_t);
  unint64_t v29;
  __int128 v30;
  unint64_t v31;
  __int128 v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  char *v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  void (*v44)(_BYTE *, char *, uint64_t);
  _BYTE *v45;
  char *v46;
  _BYTE *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(_BYTE *, uint64_t);
  char *v51;
  __int128 v52;
  char *v53;
  unint64_t v54;
  __int128 v55;
  uint64_t result;
  _BYTE v57[16];
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  _BYTE *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;

  v8 = sub_19A990ADC();
  v67 = *(_QWORD *)(v8 - 8);
  v68 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v66 = &v57[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v65 = &v57[-v11];
  v12 = a2 - a1;
  v13 = (a2 - a1) / 24;
  v60 = a3;
  v14 = a3 - a2;
  v15 = v14 / 24;
  v73 = a1;
  v72 = a4;
  if (v13 >= v14 / 24)
  {
    if (v14 >= -23)
    {
      if (a4 != a2 || &a2[24 * v15] <= a4)
        memmove(a4, a2, 24 * v15);
      v33 = &a4[24 * v15];
      v71 = v33;
      v73 = a2;
      if (v14 >= 24 && a1 < a2)
      {
        v34 = v60 - 24;
        v58 = a1;
        v69 = a4;
        v36 = v67;
        v35 = v68;
        while (1)
        {
          v70 = a2;
          v63 = v33;
          v64 = v34 + 24;
          v40 = (char *)*((_QWORD *)v33 - 1);
          v41 = (char *)*((_QWORD *)a2 - 2);
          v42 = (char *)*((_QWORD *)a2 - 1);
          v61 = (char *)*((_QWORD *)v33 - 2);
          v62 = v41;
          v59 = v42;
          v43 = &v40[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v44 = *(void (**)(_BYTE *, char *, uint64_t))(v36 + 16);
          v45 = v65;
          v44(v65, v43, v35);
          v46 = &v42[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          v47 = v66;
          v44(v66, v46, v35);
          swift_bridgeObjectRetain();
          v60 = v40;
          swift_bridgeObjectRetain();
          v48 = v59;
          v49 = sub_19A990AC4();
          v50 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
          v50(v47, v35);
          v50(v45, v35);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v49 == 1)
          {
            v51 = v63;
            v38 = v70 - 24;
            if (v64 != v70 || v34 >= v70)
            {
              v52 = *(_OWORD *)v38;
              *((_QWORD *)v34 + 2) = *((_QWORD *)v70 - 1);
              *(_OWORD *)v34 = v52;
            }
            v73 = v38;
            v39 = (unint64_t)v58;
            v33 = v51;
            if (v51 <= v69)
              goto LABEL_41;
          }
          else
          {
            v53 = v70;
            v33 = v63 - 24;
            v71 = v63 - 24;
            if (v64 < v63 || v34 >= v63)
            {
              v37 = *(_OWORD *)v33;
              *((_QWORD *)v34 + 2) = *((_QWORD *)v63 - 1);
              *(_OWORD *)v34 = v37;
              v38 = v53;
              v39 = (unint64_t)v58;
              if (v33 <= v69)
                goto LABEL_41;
            }
            else
            {
              v39 = (unint64_t)v58;
              v54 = (unint64_t)v69;
              if (v64 != v63)
              {
                v55 = *(_OWORD *)v33;
                *((_QWORD *)v34 + 2) = *((_QWORD *)v63 - 1);
                *(_OWORD *)v34 = v55;
              }
              v38 = v53;
              if ((unint64_t)v33 <= v54)
                goto LABEL_41;
            }
          }
          v34 -= 24;
          a2 = v38;
          if ((unint64_t)v38 <= v39)
            goto LABEL_41;
        }
      }
      goto LABEL_41;
    }
  }
  else if (v12 >= -23)
  {
    if (a4 != a1 || &a1[24 * v13] <= a4)
      memmove(a4, a1, 24 * v13);
    v59 = &a4[24 * v13];
    v71 = v59;
    if (v12 >= 24 && a2 < v60)
    {
      v16 = v67;
      v17 = v65;
      do
      {
        v69 = a4;
        v70 = a2;
        v18 = (char *)*((_QWORD *)a2 + 1);
        v19 = (char *)*((_QWORD *)a2 + 2);
        v20 = (char *)*((_QWORD *)a4 + 1);
        v21 = (char *)*((_QWORD *)a4 + 2);
        v63 = v18;
        v64 = v20;
        v22 = &v19[OBJC_IVAR___TPSSavedTipEntry_savedDate];
        swift_beginAccess();
        v23 = *(void (**)(_BYTE *, char *, uint64_t))(v16 + 16);
        v24 = v68;
        v23(v17, v22, v68);
        v25 = &v21[OBJC_IVAR___TPSSavedTipEntry_savedDate];
        swift_beginAccess();
        v26 = v66;
        v23(v66, v25, v24);
        swift_bridgeObjectRetain();
        v62 = v19;
        swift_bridgeObjectRetain();
        v61 = v21;
        v27 = sub_19A990AC4();
        v28 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
        v28(v26, v24);
        v28(v17, v24);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v27 == 1)
        {
          a4 = v69;
          v29 = (unint64_t)(v70 + 24);
          if (a1 < v70 || (unint64_t)a1 >= v29 || a1 != v70)
          {
            v30 = *(_OWORD *)v70;
            *((_QWORD *)a1 + 2) = *((_QWORD *)v70 + 2);
            *(_OWORD *)a1 = v30;
          }
        }
        else
        {
          v31 = (unint64_t)v70;
          a4 = v69 + 24;
          if (a1 != v69 || a1 >= a4)
          {
            v32 = *(_OWORD *)v69;
            *((_QWORD *)a1 + 2) = *((_QWORD *)v69 + 2);
            *(_OWORD *)a1 = v32;
          }
          v72 = a4;
          v29 = v31;
        }
        a1 += 24;
        v73 = a1;
        if (a4 >= v59)
          break;
        a2 = (char *)v29;
      }
      while (v29 < (unint64_t)v60);
    }
LABEL_41:
    sub_19A984EEC((void **)&v73, (const void **)&v72, &v71);
    return 1;
  }
  result = sub_19A991208();
  __break(1u);
  return result;
}

unsigned __int8 *sub_19A9703B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_19A990E0C();
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
  v5 = sub_19A970720();
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
    v7 = (unsigned __int8 *)sub_19A991190();
  }
LABEL_7:
  v11 = sub_19A9704A4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_19A97049C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_19A96E560(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

unsigned __int8 *sub_19A9704A4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_19A970720()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_19A990E18();
  v4 = sub_19A97079C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_19A97079C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_19A9708E0(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_19A96EDC8(v9, 0);
      v12 = sub_19A9709CC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
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
    v13 = MEMORY[0x19AECD49C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x19AECD49CLL);
LABEL_9:
      sub_19A991190();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x19AECD49C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_19A9708E0(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_19A98B9F4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_19A98B9F4(a2, a3, a4);
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
    return sub_19A990DDC();
  }
  __break(1u);
  return result;
}

unint64_t sub_19A9709CC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
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
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_19A98B9F4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_19A990DE8();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_19A991190();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_19A98B9F4(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_19A990DC4();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_19A970BDC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *sub_19A970C64(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * a2);
    *result = v6;
    swift_bridgeObjectRetain();
    v7 = v6;
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_19A970CF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  unint64_t *v23;
  uint64_t v24;

  v23 = (unint64_t *)result;
  v8 = 0;
  v9 = 0;
  v10 = a3 + 64;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(a3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (2)
  {
    v24 = v8;
    do
    {
      if (v13)
      {
        v15 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v16 = v15 | (v9 << 6);
      }
      else
      {
        v17 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
        if (v17 >= v14)
          return sub_19A96EE2C(v23, a2, v24, a3);
        v18 = *(_QWORD *)(v10 + 8 * v17);
        ++v9;
        if (!v18)
        {
          v9 = v17 + 1;
          if (v17 + 1 >= v14)
            return sub_19A96EE2C(v23, a2, v24, a3);
          v18 = *(_QWORD *)(v10 + 8 * v9);
          if (!v18)
          {
            v9 = v17 + 2;
            if (v17 + 2 >= v14)
              return sub_19A96EE2C(v23, a2, v24, a3);
            v18 = *(_QWORD *)(v10 + 8 * v9);
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v14)
                return sub_19A96EE2C(v23, a2, v24, a3);
              v18 = *(_QWORD *)(v10 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v9 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_30;
                  if (v9 >= v14)
                    return sub_19A96EE2C(v23, a2, v24, a3);
                  v18 = *(_QWORD *)(v10 + 8 * v9);
                  ++v19;
                  if (v18)
                    goto LABEL_21;
                }
              }
              v9 = v19;
            }
          }
        }
LABEL_21:
        v13 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v9 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v16) + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
      swift_beginAccess();
      result = *v20;
      if (*v20 == a4 && v20[1] == a5)
        break;
      result = sub_19A991298();
    }
    while ((result & 1) == 0);
    *(unint64_t *)((char *)v23 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v8 = v24 + 1;
    if (!__OFADD__(v24, 1))
      continue;
    break;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_19A970ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v7;
  unsigned int v8;
  unint64_t v9;
  size_t v10;
  uint64_t isStackAllocationSafe;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(a1 + 32);
  v8 = v7 & 0x3F;
  v9 = (unint64_t)((1 << v7) + 63) >> 6;
  v10 = 8 * v9;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    v12 = sub_19A970CF4((uint64_t)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    if (v3)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    v12 = sub_19A970CF4((uint64_t)v13, v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    MEMORY[0x19AECE318](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v12;
}

void sub_19A971098(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, id))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v23 = 0;
  v6 = 0;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v25)
      goto LABEL_24;
    v18 = *(_QWORD *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v25)
        goto LABEL_24;
      v18 = *(_QWORD *)(v24 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v25)
          goto LABEL_24;
        v18 = *(_QWORD *)(v24 + 8 * v6);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v9 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(void **)(*(_QWORD *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    v16 = v15;
    LOBYTE(v13) = a4(v13, v14, v16);
    swift_bridgeObjectRelease();

    if ((v13 & 1) != 0)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
LABEL_24:
        sub_19A96EE2C(a1, a2, v23, a3);
        return;
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v25)
    goto LABEL_24;
  v18 = *(_QWORD *)(v24 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v25)
      goto LABEL_24;
    v18 = *(_QWORD *)(v24 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_19A971290(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, id), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v6 = isStackAllocationSafe;
  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_19A971098((_QWORD *)((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    sub_19A971098((unint64_t *)v11, v8, v6, a2);
    a3 = v12;
    MEMORY[0x19AECE318](v11, -1, -1);
  }
  return a3;
}

uint64_t sub_19A971400()
{
  uint64_t v0;
  char v1;
  _BYTE *v2;
  uint64_t result;

  v1 = *(_BYTE *)(v0 + 24);
  v2 = (_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  result = swift_beginAccess();
  *v2 = v1;
  return result;
}

uint64_t sub_19A97145C@<X0>(_QWORD *a1@<X8>)
{
  return sub_19A96EAD0(a1);
}

void sub_19A971484()
{
  sub_19A96B910();
}

uint64_t sub_19A971498@<X0>(uint64_t a1@<X8>)
{
  return sub_19A96E8CC(a1);
}

uint64_t sub_19A9714AC@<X0>(_BYTE *a1@<X8>)
{
  return sub_19A96E8B0(a1);
}

uint64_t sub_19A9714C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_19A91E408(*a1);
  v5 = v4;
  if (v3 == sub_19A91E408(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_19A991298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_19A971548()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_19A991340();
  sub_19A91E408(v1);
  sub_19A990DA0();
  swift_bridgeObjectRelease();
  return sub_19A991364();
}

uint64_t sub_19A9715A8()
{
  unsigned __int8 *v0;

  sub_19A91E408(*v0);
  sub_19A990DA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A9715E8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_19A991340();
  sub_19A91E408(v1);
  sub_19A990DA0();
  swift_bridgeObjectRelease();
  return sub_19A991364();
}

uint64_t sub_19A971644@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_19A9723F8();
  *a1 = result;
  return result;
}

uint64_t sub_19A971670@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_19A91E408(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19A9716E4()
{
  uint64_t v0;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(6u, &v2);
  v0 = v3;
  sub_19A91E1E0((uint64_t)&v2);
  if (v0)
    return sub_19A972448(6u);
  else
    return sub_19A990818();
}

uint64_t sub_19A971738()
{
  return sub_19A972448(9u);
}

uint64_t sub_19A971748()
{
  return sub_19A972448(0x32u);
}

uint64_t sub_19A971750()
{
  uint64_t v0;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0x1Bu, &v2);
  v0 = v3;
  sub_19A91E1E0((uint64_t)&v2);
  if (v0)
    return sub_19A972448(0x1Bu);
  else
    return 0;
}

uint64_t static TipsDefaultsManager.isInternalDevice.getter()
{
  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  return byte_1ED03D560;
}

uint64_t static TipsDefaultsManager.isInternalDevice.setter(char a1)
{
  uint64_t result;

  if (qword_1ED03D568 != -1)
    swift_once();
  result = swift_beginAccess();
  byte_1ED03D560 = a1 & 1;
  return result;
}

uint64_t (*static TipsDefaultsManager.isInternalDevice.modify())()
{
  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A971A10()
{
  return sub_19A971B30(1u);
}

uint64_t sub_19A971A18()
{
  return sub_19A971B30(0);
}

uint64_t sub_19A971A20()
{
  return sub_19A971B30(2u);
}

uint64_t sub_19A971A28()
{
  return sub_19A971B30(8u);
}

uint64_t sub_19A971A38()
{
  return sub_19A971B30(0xCu);
}

uint64_t sub_19A971A40()
{
  return sub_19A971B30(0xDu);
}

uint64_t sub_19A971A50()
{
  return sub_19A971B30(0xFu);
}

uint64_t sub_19A971A60()
{
  return sub_19A971B30(0x10u);
}

uint64_t sub_19A971A70()
{
  return sub_19A971B30(0x11u);
}

uint64_t sub_19A971A80()
{
  return sub_19A971B30(0x14u);
}

uint64_t sub_19A971A90()
{
  return sub_19A971B30(0x15u);
}

uint64_t sub_19A971AA0()
{
  return sub_19A971B30(0x1Eu);
}

uint64_t sub_19A971AA8()
{
  return sub_19A971B30(0x1Fu);
}

uint64_t sub_19A971AB8()
{
  return sub_19A971B30(0x20u);
}

uint64_t sub_19A971AC8()
{
  return sub_19A971B30(0x22u);
}

uint64_t sub_19A971AD0()
{
  return sub_19A971B30(0x24u);
}

uint64_t sub_19A971AE0()
{
  return sub_19A971B30(0x25u);
}

uint64_t sub_19A971AF0()
{
  return sub_19A971B30(0x26u);
}

uint64_t sub_19A971B00()
{
  return sub_19A971B30(0x21u);
}

uint64_t sub_19A971B08()
{
  return sub_19A971B30(0x27u);
}

uint64_t sub_19A971B18()
{
  return sub_19A971B30(0x28u);
}

uint64_t sub_19A971B28()
{
  return sub_19A971B30(0x36u);
}

uint64_t sub_19A971B30(unsigned __int8 a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  sub_19A91DE2C(a1, &v3);
  if (v4)
  {
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v3);
    return 0;
  }
}

id sub_19A971BC8()
{
  return sub_19A9263A4(3u);
}

id sub_19A971BF8()
{
  return sub_19A9263A4(4u);
}

id sub_19A971C28()
{
  return sub_19A9263A4(0x12u);
}

id sub_19A971C58()
{
  return sub_19A9263A4(0x16u);
}

id sub_19A971C88()
{
  return sub_19A9263A4(0x23u);
}

id sub_19A971C90()
{
  return sub_19A9263A4(0x2Fu);
}

id sub_19A971CC0()
{
  return sub_19A9263A4(0x33u);
}

double sub_19A971D30()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(5u, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A971E00()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0xAu, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A971ED0()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0xEu, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A971FA0()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0x13u, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A972070()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0x34u, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A972140()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0x35u, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19A9721A8()
{
  double v1;
  __int128 v2;
  uint64_t v3;

  sub_19A91DE2C(0x2Bu, &v2);
  if (v3)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v1;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v2);
  }
  return 0.0;
}

uint64_t sub_19A972210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  sub_19A91DE2C(0x1Au, &v6);
  if (v7)
  {
    v2 = sub_19A990ADC();
    v3 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, v3 ^ 1u, 1, v2);
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v6);
    v5 = sub_19A990ADC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
}

uint64_t sub_19A9722BC()
{
  return sub_19A9722CC(0x1Du);
}

uint64_t sub_19A9722C4()
{
  return sub_19A9722CC(0x1Cu);
}

uint64_t sub_19A9722CC(unsigned __int8 a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  sub_19A91DE2C(a1, &v3);
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v3);
    return 0;
  }
}

id TipsDefaultsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipsDefaultsManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipsDefaultsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19A9723F8()
{
  unint64_t v0;

  v0 = sub_19A9912B0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x37)
    return 55;
  else
    return v0;
}

uint64_t sub_19A972448(unsigned __int8 a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v10[2];

  v2 = sub_19A990818();
  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 == 1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    sub_19A91E408(a1);
    v4 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v2 = (uint64_t)objc_msgSend(v3, sel_integerForKey_, v4);

    if (v2 >= 1)
    {
      if (qword_1ED03D5E8 != -1)
        swift_once();
      v10[0] = 0;
      v10[1] = 0xE000000000000000;
      v5 = (id)qword_1ED03D5F0;
      sub_19A991160();
      sub_19A990DAC();
      sub_19A9911A8();
      sub_19A990DAC();
      sub_19A991280();
      sub_19A990DAC();
      swift_bridgeObjectRelease();
      v6 = sub_19A990F98();
      if (os_log_type_enabled(v5, v6))
      {
        swift_bridgeObjectRetain_n();
        v7 = (uint8_t *)swift_slowAlloc();
        v8 = swift_slowAlloc();
        v10[0] = v8;
        *(_DWORD *)v7 = 136315138;
        swift_bridgeObjectRetain();
        sub_19A91E7D8(0, 0xE000000000000000, v10);
        sub_19A991058();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19A906000, v5, v6, "%s", v7, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECE318](v8, -1, -1);
        MEMORY[0x19AECE318](v7, -1, -1);
      }

      swift_bridgeObjectRelease();
    }
  }
  return v2;
}

uint64_t sub_19A972744()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A972A40()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A972D3C()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A97303C()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A973338()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A973634()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A973930()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A973C28()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A973F24()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A974220()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19A97451C()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8[2];

  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  if (byte_1ED03D560 != 1)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_19A990D34();
  v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if ((_DWORD)v2)
  {
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v8[1] = 0xE000000000000000;
    v3 = (id)qword_1ED03D5F0;
    sub_19A991160();
    sub_19A990DAC();
    sub_19A9911A8();
    sub_19A990DAC();
    sub_19A990DAC();
    v4 = sub_19A990F98();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A91E7D8(0, 0xE000000000000000, v8);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v3, v4, "%s", v5, 0xCu);
      v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v6, -1, -1);
      MEMORY[0x19AECE318](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t type metadata accessor for TipsDefaultsManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipsDefaultsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static TipsDefaultsManager.crunchingIntervalInDays.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.discoverabilityOverrideMaxDisplayCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.triggerMinObservationCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredTopicCycleTimeInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.debugActiveIAPs.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.displayAllFeaturedTopics.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.ignoreCloud.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.ignoreTargetingValidator.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.resetDaemonData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.resetDataCache.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showAllCollections.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showCollectionIntro.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showPagingLabelOnLongPress.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.suppressNotifications.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.suppressTipKitContent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetRequestHostURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetRatioIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.deviceModel.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.displayContentForContext.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredCollection.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintActionText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintActionURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintBody.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintMonitoringEvents.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.minVersionForSpatialAudio.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.notificationDocument.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.platform.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestHostURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestLanguage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestModel.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestPlatform.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.releaseType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestVersion.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.widgetDocument.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contentUpdatedDarwinNotificationInSeconds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contextualEventDaysSinceLastMajorUpdateInSeconds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintCustomizationID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.holdoutGroup.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.standardNotificationInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.userType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contextualEventLookBackDaysInSeconds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.discoverabilitySuppressionInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredDocumentInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 448))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintMaxDurationTimeInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 456))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.welcomeNotificationDelay.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 464))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.welcomeNotificationGracePeriod.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 472))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.sessionTimeoutIntervalInSeconds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 480))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.lastMajorVersionUpdateDate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.matchedClientConditions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.matchedClientConditionTargeting.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 504))();
}

uint64_t getEnumTagSinglePayload for TipsDefaultsManager.Key(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xCA)
    goto LABEL_17;
  if (a2 + 54 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 54) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 54;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 54;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 54;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x37;
  v8 = v6 - 55;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TipsDefaultsManager.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 54 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 54) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xCA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xC9)
    return ((uint64_t (*)(void))((char *)&loc_19A974AE8 + 4 * byte_19A99B06C[v4]))();
  *a1 = a2 + 54;
  return ((uint64_t (*)(void))((char *)sub_19A974B1C + 4 * byte_19A99B067[v4]))();
}

uint64_t sub_19A974B1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A974B24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19A974B2CLL);
  return result;
}

uint64_t sub_19A974B38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19A974B40);
  *(_BYTE *)result = a2 + 54;
  return result;
}

uint64_t sub_19A974B44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A974B4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_19A974B58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TipsDefaultsManager.Key()
{
  return &type metadata for TipsDefaultsManager.Key;
}

unint64_t sub_19A974B74()
{
  unint64_t result;

  result = qword_1EE3B68B8;
  if (!qword_1EE3B68B8)
  {
    result = MEMORY[0x19AECE27C](&unk_19A99B124, &type metadata for TipsDefaultsManager.Key);
    atomic_store(result, (unint64_t *)&qword_1EE3B68B8);
  }
  return result;
}

id TPSAssetsInfo.__allocating_init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(a1, a2, a3, a4, a5, a6);
}

uint64_t TPSAssetsInfo.videoIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

uint64_t (*TPSAssetsInfo.videoIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TPSAssetsInfo.videoURL.setter(uint64_t a1)
{
  return sub_19A97513C(a1, &OBJC_IVAR___TPSAssetsInfo_videoURL);
}

uint64_t sub_19A974E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TPSAssetsInfo.videoURL.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TPSAssetsInfo.imageIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

uint64_t (*TPSAssetsInfo.imageIdentifier.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_19A974F4C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1 + *a3;
  swift_beginAccess();
  sub_19A908E20(v8, (uint64_t)v7);
  v9 = sub_19A990A34();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

void sub_19A975034(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_19A9909EC();
    v10 = sub_19A990A34();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_19A990A34();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  v13 = a1;
  sub_19A974E4C((uint64_t)v9, v12);
  swift_endAccess();

}

uint64_t TPSAssetsInfo.imageURL.setter(uint64_t a1)
{
  return sub_19A97513C(a1, &OBJC_IVAR___TPSAssetsInfo_imageURL);
}

uint64_t sub_19A97513C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a2;
  swift_beginAccess();
  sub_19A974E4C(a1, v4);
  return swift_endAccess();
}

uint64_t (*TPSAssetsInfo.imageURL.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TPSAssetsInfo.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TPSAssetsInfo.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPSAssetsInfo.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static TPSAssetsInfo.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall TPSAssetsInfo.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(_BYTE *, uint64_t, uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[24];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v25[-v8];
  v10 = v2 + OBJC_IVAR___TPSAssetsInfo_videoIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v10 + 8))
  {
    swift_bridgeObjectRetain();
    v11 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);
  swift_unknownObjectRelease();

  v13 = v2 + OBJC_IVAR___TPSAssetsInfo_videoURL;
  swift_beginAccess();
  sub_19A908E20(v13, (uint64_t)v9);
  v14 = sub_19A990A34();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48);
  v17 = 0;
  if (v16(v9, 1, v14) != 1)
  {
    v17 = sub_19A9909E0();
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v9, v14);
  }
  v18 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v17, v18);
  swift_unknownObjectRelease();

  v19 = v2 + OBJC_IVAR___TPSAssetsInfo_imageIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v19 + 8))
  {
    swift_bridgeObjectRetain();
    v20 = sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v20, v21);
  swift_unknownObjectRelease();

  v22 = v2 + OBJC_IVAR___TPSAssetsInfo_imageURL;
  swift_beginAccess();
  sub_19A908E20(v22, (uint64_t)v7);
  v23 = 0;
  if (v16(v7, 1, v14) != 1)
  {
    v23 = sub_19A9909E0();
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v7, v14);
  }
  v24 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v23, v24);
  swift_unknownObjectRelease();

}

id TPSAssetsInfo.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPSAssetsInfo.init(coder:)(void *a1)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v3);
  v8 = (char *)&v36 - v7;
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v36 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v36 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v36 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v36 - v18;
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v38 = sub_19A990FEC();
  sub_19A90A170(0, &qword_1EE3B68C8);
  v20 = sub_19A990FEC();
  if (v20)
  {
    v21 = (void *)v20;
    sub_19A9909EC();

    v22 = sub_19A990A34();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    v23 = sub_19A990A34();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  sub_19A9759EC((uint64_t)v17, (uint64_t)v19);
  v37 = sub_19A990FEC();
  v24 = sub_19A990FEC();
  if (v24)
  {
    v25 = (void *)v24;
    sub_19A9909EC();

    v26 = sub_19A990A34();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v11, 0, 1, v26);
  }
  else
  {
    v26 = sub_19A990A34();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v11, 1, 1, v26);
  }
  sub_19A9759EC((uint64_t)v11, (uint64_t)v14);
  v27 = (uint64_t)v19;
  sub_19A908E20((uint64_t)v19, (uint64_t)v8);
  sub_19A990A34();
  v28 = *(_QWORD *)(v26 - 8);
  v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = 0;
  if (v29(v8, 1, v26) != 1)
  {
    v30 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v26);
  }
  sub_19A908E20((uint64_t)v14, (uint64_t)v5);
  if (v29(v5, 1, v26) == 1)
  {
    v31 = 0;
  }
  else
  {
    v31 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v26);
  }
  v32 = (void *)v38;
  v33 = (void *)v37;
  v34 = objc_msgSend(v39, sel_initWithVideoIdentifier_videoURL_imageIdentifier_imageURL_, v38, v30, v37, v31);

  sub_19A909630((uint64_t)v14);
  sub_19A909630(v27);
  return v34;
}

uint64_t sub_19A9759EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TPSAssetsInfo.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _BYTE v10[24];
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v1 = v0;
  v2 = sub_19A990A34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_19A991160();
  v13 = v11;
  v14 = v12;
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v6 = v0 + OBJC_IVAR___TPSAssetsInfo_videoURL;
  swift_beginAccess();
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v7(v6, 1, v2))
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    sub_19A9909D4();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v8 = v1 + OBJC_IVAR___TPSAssetsInfo_imageURL;
  swift_beginAccess();
  if (!v7(v8, 1, v2))
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_19A9909D4();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t method lookup function for TPSAssetsInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSAssetsInfo.__allocating_init(videoIdentifier:videoURL:imageIdentifier:imageURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_QWORD *TipsAnalyticsEvent.init(identifier:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = a1;
  v12 = a2;
  v3 = sub_19A990FBC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A990FA4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_19A990C50();
  MEMORY[0x1E0C80A78]();
  v10 = sub_19A90A170(0, (unint64_t *)&qword_1ED03D3D8);
  sub_19A990C44();
  v13 = MEMORY[0x1E0DEE9D8];
  sub_19A90A994((unint64_t *)&qword_1ED03D3D0, v7, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
  sub_19A9766CC((unint64_t *)&qword_1ED03D3C0, &qword_1ED03D3B8);
  sub_19A9910B8();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D0], v3);
  v8 = sub_19A990FE0();
  v2[2] = v11;
  v2[3] = v12;
  v2[4] = v8;
  return v2;
}

uint64_t TipsAnalyticsEvent.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_19A975F98()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19A975FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19A976030())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19A97606C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_19A990C2C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_19A990C50();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 32);
  aBlock[4] = sub_19A976640;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A964B30;
  aBlock[3] = &block_descriptor_3;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_19A990C38();
  v13[1] = MEMORY[0x1E0DEE9D8];
  sub_19A90A994((unint64_t *)&qword_1EE3B66C0, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B66C8);
  sub_19A9766CC((unint64_t *)&qword_1EE3B66D0, &qword_1EE3B66C8);
  sub_19A9910B8();
  MEMORY[0x19AECD6DC](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_19A976238(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t TipsAnalyticsEvent.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  TipsAnalyticsEvent.init(identifier:)(a1, a2);
  return v4;
}

void sub_19A9762E0()
{
  sub_19A9911C0();
  __break(1u);
}

void sub_19A976338(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t aBlock;
  unint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  uint64_t (*v13)();
  uint64_t v14;

  if (qword_1ED03D590 != -1)
    swift_once();
  v2 = (id)qword_1ED03D598;
  sub_19A991160();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000018;
  v10 = 0x800000019A9A0AC0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v3 = sub_19A990DAC();
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 128))(v3);
  sub_19A90A170(0, &qword_1EE3B68B0);
  sub_19A990CD4();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_19A990F80();
  if (os_log_type_enabled(v2, v4))
  {
    swift_bridgeObjectRetain_n();
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)v5 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(0xD000000000000018, 0x800000019A9A0AC0, &aBlock);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v2, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v6, -1, -1);
    MEMORY[0x19AECE318](v5, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v7 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v13 = sub_19A9767F4;
  v14 = a1;
  aBlock = MEMORY[0x1E0C809B0];
  v10 = 1107296256;
  v11 = sub_19A976648;
  v12 = &block_descriptor_3;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);

}

void sub_19A976640()
{
  uint64_t v0;

  sub_19A976338(v0);
}

id sub_19A976648(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_19A90A170(0, &qword_1EE3B68B0);
    v4 = (void *)sub_19A990CBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_19A9766CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t TipsAnalyticsEvent.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_19A976738@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TipsAnalyticsEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipsAnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.eventRepresentation()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.log()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_19A9767F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

BOOL static NetworkMonitor.isNetworkError(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  _BOOL8 result;

  v2 = objc_msgSend(a1, sel_domain);
  v3 = sub_19A990D58();
  v5 = v4;

  if (v3 == sub_19A990D58() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    return objc_msgSend(a1, sel_code) == (id)-1009;
  }
  v8 = sub_19A991298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v8 & 1) != 0)
    return objc_msgSend(a1, sel_code) == (id)-1009;
  return result;
}

uint64_t sub_19A9768D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_19A990EE4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19A990ED8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_19A90A538(a1, (uint64_t *)&unk_1ED03D350);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19A990E90();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t static NetworkMonitor.shared.getter()
{
  if (qword_1ED03D320 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_19A976A44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D350);
  result = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(v0 + 120))
  {
    v5 = sub_19A990EE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
    v6 = swift_allocObject();
    swift_weakInit();
    v7 = sub_19A90A994((unint64_t *)&qword_1EE3B6770, (uint64_t (*)(uint64_t))type metadata accessor for NetworkMonitor, (uint64_t)&protocol conformance descriptor for NetworkMonitor);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v0;
    v8[3] = v7;
    v8[4] = v0;
    v8[5] = v6;
    swift_retain_n();
    *(_QWORD *)(v0 + 120) = sub_19A9768D0((uint64_t)v4, (uint64_t)&unk_1EE3B6778, (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t sub_19A976B68()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_19A976B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[9] = a4;
  v5[10] = a5;
  v6 = sub_19A990C20();
  v5[11] = v6;
  v5[12] = *(_QWORD *)(v6 - 8);
  v5[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  v7 = sub_19A990BB4();
  v5[16] = v7;
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A976C4C()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_19A990BCC();
  swift_allocObject();
  v0[19] = sub_19A990BC0();
  swift_retain();
  sub_19A990B9C();
  v0[20] = sub_19A90A994((unint64_t *)&qword_1EE3B6770, (uint64_t (*)(uint64_t))type metadata accessor for NetworkMonitor, (uint64_t)&protocol conformance descriptor for NetworkMonitor);
  swift_beginAccess();
  v0[21] = sub_19A90A994(&qword_1EE3B6A28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCE718], MEMORY[0x1E0CCE720]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[22] = v1;
  *v1 = v0;
  v1[1] = sub_19A976D44;
  return sub_19A990EB4();
}

uint64_t sub_19A976D44()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[24] = v0;
    if (v2[9])
    {
      swift_getObjectType();
      sub_19A990E90();
    }
  }
  else
  {
    v2[23] = 0;
  }
  return swift_task_switch();
}

uint64_t sub_19A976DE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;

  v1 = v0[15];
  v2 = v0[11];
  v3 = v0[12];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[17] + 8))(v0[18], v0[16]);
    swift_release();
LABEL_7:
    *(_QWORD *)(v0[9] + 120) = 0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v0[13], v1, v2);
  Strong = swift_weakLoadStrong();
  v0[25] = Strong;
  if (!Strong)
  {
    v14 = v0[18];
    v15 = v0[16];
    v16 = v0[17];
    v18 = v0[12];
    v17 = v0[13];
    v19 = v0[11];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    goto LABEL_7;
  }
  v5 = v0[23];
  sub_19A990F08();
  v0[26] = v5;
  if (v5)
  {
    v6 = v0[18];
    v7 = v0[16];
    v8 = v0[17];
    v9 = v0[13];
    v11 = v0[11];
    v10 = v0[12];
    v12 = v0[9];
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    *(_QWORD *)(v12 + 120) = 0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  v21 = (_QWORD *)swift_task_alloc();
  v0[27] = v21;
  *v21 = v0;
  v21[1] = sub_19A977048;
  return sub_19A978D90(v0[13]);
}

uint64_t sub_19A976FE8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

uint64_t sub_19A977048()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A9770A0()
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

  v1 = *(_QWORD *)(v0 + 208);
  sub_19A990F08();
  if (!v1)
    return swift_task_switch();
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  *(_QWORD *)(v8 + 120) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A9771A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[25];
  if (*(_QWORD *)(v1 + 120))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[12] + 16))(v0[14], v0[13], v0[11]);
    v2 = 0;
    v1 = v0[25];
  }
  else
  {
    v2 = 1;
  }
  v3 = v0[14];
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[12] + 56))(v3, v2, 1, v0[11]);
  v4 = v1 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A92658C(v3, v4);
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_19A97725C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[11];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[28] = v4;
  *v4 = v0;
  v4[1] = sub_19A9772DC;
  return sub_19A990EB4();
}

uint64_t sub_19A9772DC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[24] = v0;
    if (v2[9])
    {
      swift_getObjectType();
      sub_19A990E90();
    }
  }
  else
  {
    v2[23] = 0;
  }
  return swift_task_switch();
}

uint64_t sub_19A977378()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

BOOL static NetworkMonitor.isContentError(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  _BOOL8 result;

  v2 = objc_msgSend(a1, sel_domain);
  v3 = sub_19A990D58();
  v5 = v4;

  if (v3 == sub_19A990D58() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    return objc_msgSend(a1, sel_code) == (id)404;
  }
  v8 = sub_19A991298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v8 & 1) != 0)
    return objc_msgSend(a1, sel_code) == (id)404;
  return result;
}

uint64_t sub_19A977480(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_19A9774A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  unint64_t v4;
  char v5;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v4 = sub_19A90A928(a1);
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
    return swift_endAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_19A97A4A0();
    v8 = v12;
  }
  v9 = *(_QWORD *)(v8 + 48);
  v10 = sub_19A990B0C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v4, v10);
  sub_19A979E7C(v4, v12);
  *v3 = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_19A9775AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = sub_19A990C08();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B69B0);
  v1[10] = swift_task_alloc();
  v3 = sub_19A990BB4();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B69B8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A9776D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v2, v1, &qword_1ED03D1B8);
  v3 = sub_19A990C20();
  *(_QWORD *)(v0 + 152) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 160) = v4;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(_QWORD *)(v0 + 168) = v5;
  v6 = v5(v1, 1, v3);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  if (v6 == 1)
  {
    sub_19A990BCC();
    swift_allocObject();
    sub_19A990BC0();
    sub_19A990B9C();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v7;
    *v7 = v0;
    v7[1] = sub_19A977B04;
    return sub_19A990BA8();
  }
  sub_19A90ABB4(v2, *(_QWORD *)(v0 + 120), &qword_1ED03D1B8);
  v9 = *(_QWORD *)(v0 + 152);
  v10 = *(_QWORD *)(v0 + 120);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 168))(v10, 1, v9) == 1)
  {
    v11 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 48);
    v13 = *(_QWORD *)(v0 + 56);
    sub_19A90A538(v10, &qword_1ED03D1B8);
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v14(v11, 1, 1, v12);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 160);
    v16 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 48);
    v18 = *(_QWORD *)(v0 + 56);
    sub_19A990C14();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v10, v9);
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v14(v16, 0, 1, v17);
  }
  v20 = *(_QWORD *)(v0 + 136);
  v19 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 72);
  v21 = *(_QWORD *)(v0 + 80);
  v23 = *(_QWORD *)(v0 + 48);
  v24 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v24 + 104))(v20, *MEMORY[0x1E0CCEAB0], v23);
  v14(v20, 0, 1, v23);
  v25 = v21 + *(int *)(v22 + 48);
  sub_19A90ABB4(v19, v21, &qword_1EE3B69B8);
  sub_19A90ABB4(v20, v25, &qword_1EE3B69B8);
  v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  if (v26(v21, 1, v23) != 1)
  {
    v30 = *(_QWORD *)(v0 + 48);
    sub_19A90ABB4(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 128), &qword_1EE3B69B8);
    v31 = v26(v25, 1, v30);
    v33 = *(_QWORD *)(v0 + 136);
    v32 = *(_QWORD *)(v0 + 144);
    v34 = *(_QWORD *)(v0 + 128);
    if (v31 != 1)
    {
      v37 = *(_QWORD *)(v0 + 80);
      v39 = *(_QWORD *)(v0 + 56);
      v38 = *(_QWORD *)(v0 + 64);
      v40 = *(_QWORD *)(v0 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v38, v25, v40);
      sub_19A90A994(qword_1EE3B69C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEAB8], MEMORY[0x1E0CCEAC8]);
      v29 = sub_19A990D10();
      v41 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v41(v38, v40);
      sub_19A90A538(v33, &qword_1EE3B69B8);
      sub_19A90A538(v32, &qword_1EE3B69B8);
      v41(v34, v40);
      sub_19A90A538(v37, &qword_1EE3B69B8);
      goto LABEL_13;
    }
    v35 = *(_QWORD *)(v0 + 48);
    v36 = *(_QWORD *)(v0 + 56);
    sub_19A90A538(*(_QWORD *)(v0 + 136), &qword_1EE3B69B8);
    sub_19A90A538(v32, &qword_1EE3B69B8);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    goto LABEL_11;
  }
  v27 = *(_QWORD *)(v0 + 144);
  v28 = *(_QWORD *)(v0 + 48);
  sub_19A90A538(*(_QWORD *)(v0 + 136), &qword_1EE3B69B8);
  sub_19A90A538(v27, &qword_1EE3B69B8);
  if (v26(v25, 1, v28) != 1)
  {
LABEL_11:
    sub_19A90A538(*(_QWORD *)(v0 + 80), &qword_1EE3B69B0);
    v29 = 0;
    goto LABEL_13;
  }
  sub_19A90A538(*(_QWORD *)(v0 + 80), &qword_1EE3B69B8);
  v29 = 1;
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v29 & 1);
}

uint64_t sub_19A977B04()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A977B5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 120);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 168))(v2, 1, v1) == 1)
  {
    v3 = *(_QWORD *)(v0 + 144);
    v4 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 56);
    sub_19A90A538(v2, &qword_1ED03D1B8);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v6(v3, 1, 1, v4);
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 160);
    v8 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 56);
    sub_19A990C14();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v1);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v6(v8, 0, 1, v9);
  }
  v12 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 48);
  v16 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v12, *MEMORY[0x1E0CCEAB0], v15);
  v6(v12, 0, 1, v15);
  v17 = v13 + *(int *)(v14 + 48);
  sub_19A90ABB4(v11, v13, &qword_1EE3B69B8);
  sub_19A90ABB4(v12, v17, &qword_1EE3B69B8);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v18(v13, 1, v15) != 1)
  {
    v22 = *(_QWORD *)(v0 + 48);
    sub_19A90ABB4(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 128), &qword_1EE3B69B8);
    v23 = v18(v17, 1, v22);
    v25 = *(_QWORD *)(v0 + 136);
    v24 = *(_QWORD *)(v0 + 144);
    v26 = *(_QWORD *)(v0 + 128);
    if (v23 != 1)
    {
      v29 = *(_QWORD *)(v0 + 80);
      v31 = *(_QWORD *)(v0 + 56);
      v30 = *(_QWORD *)(v0 + 64);
      v32 = *(_QWORD *)(v0 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v30, v17, v32);
      sub_19A90A994(qword_1EE3B69C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEAB8], MEMORY[0x1E0CCEAC8]);
      v21 = sub_19A990D10();
      v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v33(v30, v32);
      sub_19A90A538(v25, &qword_1EE3B69B8);
      sub_19A90A538(v24, &qword_1EE3B69B8);
      v33(v26, v32);
      sub_19A90A538(v29, &qword_1EE3B69B8);
      goto LABEL_11;
    }
    v27 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 56);
    sub_19A90A538(*(_QWORD *)(v0 + 136), &qword_1EE3B69B8);
    sub_19A90A538(v24, &qword_1EE3B69B8);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
    goto LABEL_9;
  }
  v19 = *(_QWORD *)(v0 + 144);
  v20 = *(_QWORD *)(v0 + 48);
  sub_19A90A538(*(_QWORD *)(v0 + 136), &qword_1EE3B69B8);
  sub_19A90A538(v19, &qword_1EE3B69B8);
  if (v18(v17, 1, v20) != 1)
  {
LABEL_9:
    sub_19A90A538(*(_QWORD *)(v0 + 80), &qword_1EE3B69B0);
    v21 = 0;
    goto LABEL_11;
  }
  sub_19A90A538(*(_QWORD *)(v0 + 80), &qword_1EE3B69B8);
  v21 = 1;
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v21 & 1);
}

uint64_t sub_19A977E90()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v0;
  v2 = sub_19A990BB4();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A977F24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v2, v1, &qword_1ED03D1B8);
  v3 = sub_19A990C20();
  *(_QWORD *)(v0 + 88) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(_QWORD *)(v0 + 104) = v5;
  v6 = v5(v1, 1, v3);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  if (v6 == 1)
  {
    sub_19A990BCC();
    swift_allocObject();
    sub_19A990BC0();
    sub_19A990B9C();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v7;
    *v7 = v0;
    v7[1] = sub_19A9780D4;
    return sub_19A990BA8();
  }
  else
  {
    sub_19A90ABB4(v2, *(_QWORD *)(v0 + 80), &qword_1ED03D1B8);
    v10 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 88);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v10, 1, v9) == 1)
    {
      sub_19A90A538(v10, &qword_1ED03D1B8);
      v11 = 2;
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 96);
      v13 = sub_19A990BE4();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      v11 = v13 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_19A9780D4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A97812C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_19A90A538(v2, &qword_1ED03D1B8);
    v3 = 2;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = sub_19A990BE4();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    v3 = v5 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_19A9781E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v0;
  v2 = sub_19A990BB4();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A978278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v2, v1, &qword_1ED03D1B8);
  v3 = sub_19A990C20();
  *(_QWORD *)(v0 + 88) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(_QWORD *)(v0 + 104) = v5;
  v6 = v5(v1, 1, v3);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  if (v6 == 1)
  {
    sub_19A990BCC();
    swift_allocObject();
    sub_19A990BC0();
    sub_19A990B9C();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v7;
    *v7 = v0;
    v7[1] = sub_19A978428;
    return sub_19A990BA8();
  }
  else
  {
    sub_19A90ABB4(v2, *(_QWORD *)(v0 + 80), &qword_1ED03D1B8);
    v10 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 88);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v10, 1, v9) == 1)
    {
      sub_19A90A538(v10, &qword_1ED03D1B8);
      v11 = 2;
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 96);
      v13 = sub_19A990BD8();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      v11 = v13 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_19A978428()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A978480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_19A90A538(v2, &qword_1ED03D1B8);
    v3 = 2;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = sub_19A990BD8();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    v3 = v5 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_19A978538()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = sub_19A990B90();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_19A990BB4();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A9785F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v2, v1, &qword_1ED03D1B8);
  v3 = sub_19A990C20();
  *(_QWORD *)(v0 + 112) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 120) = v4;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(_QWORD *)(v0 + 128) = v5;
  v6 = v5(v1, 1, v3);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  if (v6 == 1)
  {
    sub_19A990BCC();
    swift_allocObject();
    sub_19A990BC0();
    sub_19A990B9C();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v7;
    *v7 = v0;
    v7[1] = sub_19A978800;
    return sub_19A990BA8();
  }
  else
  {
    sub_19A90ABB4(v2, *(_QWORD *)(v0 + 104), &qword_1ED03D1B8);
    v10 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 112);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v10, 1, v9) == 1)
    {
      sub_19A90A538(v10, &qword_1ED03D1B8);
      v11 = 2;
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 120);
      v14 = *(_QWORD *)(v0 + 56);
      v13 = *(_QWORD *)(v0 + 64);
      v15 = *(_QWORD *)(v0 + 48);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x1E0CCE378], v15);
      v16 = sub_19A990BF0();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      v11 = v16 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_19A978800()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A978858()
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

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v2, 1, v1) == 1)
  {
    sub_19A90A538(v2, &qword_1ED03D1B8);
    v3 = 2;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E0CCE378], v7);
    v8 = sub_19A990BF0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    v3 = v8 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_19A978964()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = sub_19A990B90();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_19A990BB4();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A978A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v2, v1, &qword_1ED03D1B8);
  v3 = sub_19A990C20();
  *(_QWORD *)(v0 + 112) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 120) = v4;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(_QWORD *)(v0 + 128) = v5;
  v6 = v5(v1, 1, v3);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  if (v6 == 1)
  {
    sub_19A990BCC();
    swift_allocObject();
    sub_19A990BC0();
    sub_19A990B9C();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v7;
    *v7 = v0;
    v7[1] = sub_19A978C2C;
    return sub_19A990BA8();
  }
  else
  {
    sub_19A90ABB4(v2, *(_QWORD *)(v0 + 104), &qword_1ED03D1B8);
    v10 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 112);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v10, 1, v9) == 1)
    {
      sub_19A90A538(v10, &qword_1ED03D1B8);
      v11 = 2;
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 120);
      v14 = *(_QWORD *)(v0 + 56);
      v13 = *(_QWORD *)(v0 + 64);
      v15 = *(_QWORD *)(v0 + 48);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x1E0CCE368], v15);
      v16 = sub_19A990BF0();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      v11 = v16 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_19A978C2C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A978C84()
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

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v2, 1, v1) == 1)
  {
    sub_19A90A538(v2, &qword_1ED03D1B8);
    v3 = 2;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E0CCE368], v7);
    v8 = sub_19A990BF0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    v3 = v8 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_19A978D90(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[11] = a1;
  v2[12] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6A18);
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6A20);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v4 = sub_19A990C08();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v5 = sub_19A990C20();
  v2[23] = v5;
  v2[24] = *(_QWORD *)(v5 - 8);
  v2[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A978EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void (*v25)(uint64_t, uint64_t);
  unint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t (**v57)(char);
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *log;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[2];

  v66 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19A90ABB4(v5, v1, &qword_1ED03D1B8);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  v7 = v6(v1, 1, v4);
  sub_19A90A538(v1, &qword_1ED03D1B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v66, v4);
  v8 = *(_QWORD *)(v0 + 184);
  if (v7 == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 208);
    sub_19A90ABB4(v5, v9, &qword_1ED03D1B8);
    result = v6(v9, 1, v8);
    if ((_DWORD)result == 1)
    {
      __break(1u);
      return result;
    }
    v12 = *(_QWORD *)(v0 + 200);
    v11 = *(_QWORD *)(v0 + 208);
    v13 = *(_QWORD *)(v0 + 184);
    v14 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 176);
    v17 = *(_QWORD *)(v0 + 152);
    v18 = *(_QWORD *)(v0 + 160);
    sub_19A990C14();
    v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v19(v11, v13);
    sub_19A990C14();
    sub_19A90A994(qword_1EE3B69C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEAB8], MEMORY[0x1E0CCEAC8]);
    LOBYTE(v11) = sub_19A990D10();
    v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v20(v16, v17);
    v20(v15, v17);
    v19(v12, v13);
    if ((v11 & 1) != 0)
    {
LABEL_25:
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
  }
  if (qword_1ED03D5E8 != -1)
    swift_once();
  v21 = *(_QWORD *)(v0 + 176);
  v23 = *(_QWORD *)(v0 + 152);
  v22 = *(_QWORD *)(v0 + 160);
  v68[0] = 0;
  v68[1] = 0xE000000000000000;
  v24 = (id)qword_1ED03D5F0;
  sub_19A991160();
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0xE000000000000000;
  sub_19A990DAC();
  sub_19A990C14();
  sub_19A9911A8();
  v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  *(_QWORD *)(v0 + 224) = v25;
  v25(v21, v23);
  v27 = *(_QWORD *)(v0 + 64);
  v26 = *(_QWORD *)(v0 + 72);
  v28 = sub_19A990F98();
  log = v24;
  if (os_log_type_enabled(v24, v28))
  {
    swift_bridgeObjectRetain_n();
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v68[0] = v30;
    *(_DWORD *)v29 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_19A91E7D8(v27, v26, v68);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, log, v28, "%s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v30, -1, -1);
    MEMORY[0x19AECE318](v29, -1, -1);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();

  }
  v31 = (uint64_t *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
  swift_beginAccess();
  v32 = *v31;
  *(_QWORD *)(v0 + 232) = v32;
  v33 = *(_BYTE *)(v32 + 32);
  *(_BYTE *)(v0 + 284) = v33;
  v34 = -1;
  v35 = -1 << v33;
  if (-(-1 << v33) < 64)
    v34 = ~(-1 << -(char)(-1 << v33));
  v36 = v34 & *(_QWORD *)(v32 + 64);
  *(_DWORD *)(v0 + 280) = *MEMORY[0x1E0CCEAB0];
  swift_bridgeObjectRetain();
  if (!v36)
  {
    v46 = 63 - v35;
    if ((unint64_t)(63 - v35) <= 0x7F)
    {
      v37 = 0;
    }
    else
    {
      v47 = *(_QWORD *)(v32 + 72);
      if (v47)
      {
        v37 = 1;
LABEL_18:
        v39 = (v47 - 1) & v47;
        v38 = __clz(__rbit64(v47)) + (v37 << 6);
        goto LABEL_14;
      }
      if (v46 < 0xC0)
      {
        v37 = 1;
      }
      else
      {
        v47 = *(_QWORD *)(v32 + 80);
        if (v47)
        {
          v37 = 2;
          goto LABEL_18;
        }
        if (v46 < 0x100)
        {
          v37 = 2;
        }
        else
        {
          v47 = *(_QWORD *)(v32 + 88);
          if (v47)
          {
            v37 = 3;
            goto LABEL_18;
          }
          if (v46 < 0x140)
          {
            v37 = 3;
          }
          else
          {
            v47 = *(_QWORD *)(v32 + 96);
            if (v47)
            {
              v37 = 4;
              goto LABEL_18;
            }
            v61 = 0;
            v62 = v46 >> 6;
            v63 = 5;
            if (v62 > 5)
              v63 = v62;
            v64 = v63 - 5;
            while (v64 != v61)
            {
              v47 = *(_QWORD *)(v32 + 104 + 8 * v61++);
              if (v47)
              {
                v37 = v61 + 4;
                goto LABEL_18;
              }
            }
            v37 = v62 - 1;
          }
        }
      }
    }
    v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 56);
    v45(*(_QWORD *)(v0 + 128), 1, 1, *(_QWORD *)(v0 + 104));
    v39 = 0;
    goto LABEL_21;
  }
  v37 = 0;
  v38 = __clz(__rbit64(v36));
  v39 = (v36 - 1) & v36;
LABEL_14:
  v40 = *(_QWORD *)(v0 + 128);
  v41 = *(_QWORD *)(v0 + 104);
  v42 = *(_QWORD *)(v0 + 112);
  v43 = *(_QWORD *)(v32 + 48);
  v44 = sub_19A990B0C();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v40, v43 + *(_QWORD *)(*(_QWORD *)(v44 - 8) + 72) * v38, v44);
  *(_OWORD *)(v40 + *(int *)(v41 + 48)) = *(_OWORD *)(*(_QWORD *)(v32 + 56) + 16 * v38);
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56);
  v45(v40, 0, 1, v41);
  swift_retain();
LABEL_21:
  *(_QWORD *)(v0 + 240) = v37;
  *(_QWORD *)(v0 + 248) = v39;
  v48 = *(_QWORD *)(v0 + 128);
  v49 = *(_QWORD *)(v0 + 104);
  v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 48);
  v51 = 1;
  if (v50(v48, 1, v49) != 1)
  {
    v52 = *(_QWORD *)(v0 + 136);
    v53 = *(_QWORD *)(v0 + 120);
    v67 = *(int *)(v49 + 48);
    v54 = sub_19A990B0C();
    v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 32);
    v55(v53, v48, v54);
    v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = *(_OWORD *)(v48 + v67);
    v57 = (uint64_t (**)(char))(v52 + *(int *)(v49 + 48));
    v55(v52, v53, v54);
    v51 = 0;
    *v57 = sub_19A97AB60;
    v57[1] = (uint64_t (*)(char))v56;
    v49 = *(_QWORD *)(v0 + 104);
  }
  v59 = *(_QWORD *)(v0 + 136);
  v58 = *(_QWORD *)(v0 + 144);
  v45(v59, v51, 1, v49);
  sub_19A97AAF4(v59, v58);
  if (v50(v58, 1, v49) == 1)
  {
    swift_release();
    goto LABEL_25;
  }
  v60 = (_QWORD *)(*(_QWORD *)(v0 + 144) + *(int *)(*(_QWORD *)(v0 + 104) + 48));
  *(_QWORD *)(v0 + 256) = *v60;
  *(_QWORD *)(v0 + 264) = v60[1];
  sub_19A990ECC();
  *(_QWORD *)(v0 + 272) = sub_19A990EC0();
  sub_19A990E90();
  return swift_task_switch();
}

uint64_t sub_19A979630()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void (*v9)(_QWORD);

  v9 = *(void (**)(_QWORD))(v0 + 256);
  v1 = *(unsigned int *)(v0 + 280);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v4 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 160);
  swift_release();
  sub_19A990C14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104))(v4, v1, v5);
  v7 = sub_19A990BFC();
  v2(v4, v5);
  v2(v3, v5);
  v9(v7 & 1);
  return swift_task_switch();
}

uint64_t sub_19A9796FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t (**v28)(char);
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 144);
  v2 = sub_19A990B0C();
  v3 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  result = swift_release();
  v6 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 248);
  if (!v5)
  {
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
    }
    else
    {
      v15 = (unint64_t)((1 << *(_BYTE *)(v0 + 284)) + 63) >> 6;
      if (v14 >= v15)
        goto LABEL_21;
      v9 = *(_QWORD *)(v0 + 232);
      v16 = v9 + 64;
      v17 = *(_QWORD *)(v9 + 64 + 8 * v14);
      if (v17)
      {
LABEL_7:
        v7 = (v17 - 1) & v17;
        v8 = __clz(__rbit64(v17)) + (v14 << 6);
        v6 = v14;
        goto LABEL_3;
      }
      v18 = v6 + 2;
      ++v6;
      if (v14 + 1 >= v15)
        goto LABEL_21;
      v17 = *(_QWORD *)(v16 + 8 * v18);
      if (v17)
      {
LABEL_10:
        v14 = v18;
        goto LABEL_7;
      }
      v6 = v14 + 1;
      if (v14 + 2 >= v15)
        goto LABEL_21;
      v17 = *(_QWORD *)(v16 + 8 * (v14 + 2));
      if (v17)
      {
        v14 += 2;
        goto LABEL_7;
      }
      v18 = v14 + 3;
      v6 = v14 + 2;
      if (v14 + 3 >= v15)
      {
LABEL_21:
        v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 56);
        v13(*(_QWORD *)(v0 + 128), 1, 1, *(_QWORD *)(v0 + 104));
        v7 = 0;
        goto LABEL_22;
      }
      v17 = *(_QWORD *)(v16 + 8 * v18);
      if (v17)
        goto LABEL_10;
      while (1)
      {
        v14 = v18 + 1;
        if (__OFADD__(v18, 1))
          break;
        if (v14 >= v15)
        {
          v6 = v15 - 1;
          goto LABEL_21;
        }
        v17 = *(_QWORD *)(v16 + 8 * v14);
        ++v18;
        if (v17)
          goto LABEL_7;
      }
    }
    __break(1u);
    return result;
  }
  v7 = (v5 - 1) & v5;
  v8 = __clz(__rbit64(v5)) | (v6 << 6);
  v9 = *(_QWORD *)(v0 + 232);
LABEL_3:
  v10 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 112);
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16))(v10, *(_QWORD *)(v9 + 48) + *(_QWORD *)(v3 + 72) * v8, v2);
  *(_OWORD *)(v10 + *(int *)(v11 + 48)) = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v8);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v13(v10, 0, 1, v11);
  swift_retain();
LABEL_22:
  *(_QWORD *)(v0 + 240) = v6;
  *(_QWORD *)(v0 + 248) = v7;
  v19 = *(_QWORD *)(v0 + 128);
  v20 = *(_QWORD *)(v0 + 104);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 48);
  v22 = 1;
  if (v21(v19, 1, v20) != 1)
  {
    v23 = *(_QWORD *)(v0 + 136);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(int *)(v20 + 48);
    v32 = v13;
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
    v26(v24, v19, v2);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = *(_OWORD *)(v19 + v25);
    v28 = (uint64_t (**)(char))(v23 + *(int *)(v20 + 48));
    v26(v23, v24, v2);
    v13 = v32;
    v22 = 0;
    *v28 = sub_19A97AB60;
    v28[1] = (uint64_t (*)(char))v27;
    v20 = *(_QWORD *)(v0 + 104);
  }
  v30 = *(_QWORD *)(v0 + 136);
  v29 = *(_QWORD *)(v0 + 144);
  v13(v30, v22, 1, v20);
  sub_19A97AAF4(v30, v29);
  if (v21(v29, 1, v20) == 1)
  {
    swift_release();
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
    v31 = (_QWORD *)(*(_QWORD *)(v0 + 144) + *(int *)(*(_QWORD *)(v0 + 104) + 48));
    *(_QWORD *)(v0 + 256) = *v31;
    *(_QWORD *)(v0 + 264) = v31[1];
    sub_19A990ECC();
    *(_QWORD *)(v0 + 272) = sub_19A990EC0();
    sub_19A990E90();
    return swift_task_switch();
  }
}

uint64_t NetworkMonitor.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 120))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
    sub_19A990EF0();
    swift_release();
  }
  swift_release();
  swift_release();
  sub_19A90A538(v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath, &qword_1ED03D1B8);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t NetworkMonitor.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 120))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
    sub_19A990EF0();
    swift_release();
  }
  swift_release();
  swift_release();
  sub_19A90A538(v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath, &qword_1ED03D1B8);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t NetworkMonitor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_19A979BF0()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_19A979BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_19A991340();
  sub_19A990DA0();
  v4 = sub_19A991364();
  return sub_19A97A2F0(a1, a2, v4);
}

unint64_t sub_19A979C60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_19A99110C();
  return sub_19A97A3D0(a1, v2);
}

uint64_t sub_19A979C90(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_19A90A928(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19A97A4A0();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_19A990B0C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v4);
  sub_19A979E7C(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_19A979D7C(uint64_t a1, uint64_t a2)
{
  return sub_19A979D94(a1, a2, &qword_1EE3B6380);
}

uint64_t sub_19A979D88(uint64_t a1, uint64_t a2)
{
  return sub_19A979D94(a1, a2, &qword_1EE3B6360);
}

uint64_t sub_19A979D94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_19A979BFC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19A97A94C(a3);
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_19A97A11C(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_19A979E70(uint64_t a1, uint64_t a2)
{
  return sub_19A979D94(a1, a2, &qword_1EE3B6350);
}

unint64_t sub_19A979E7C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_19A990B0C();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_19A9910C4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_19A90A994(&qword_1EE3B5910, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v18 = sub_19A990CEC();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_OWORD *)(v23 + 16 * a1);
            v25 = (_OWORD *)(v23 + 16 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_19A97A11C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_19A9910C4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_19A991340();
        swift_bridgeObjectRetain();
        sub_19A990DA0();
        v9 = sub_19A991364();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_19A97A2F0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_19A991298() & 1) == 0)
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
      while (!v14 && (sub_19A991298() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_19A97A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_19A97AB90(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x19AECD820](v9, a1);
      sub_19A95BA78((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_19A97A494()
{
  return sub_19A97A94C((uint64_t *)&unk_1EE3B6388);
}

void *sub_19A97A4A0()
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
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(unint64_t, char *, uint64_t);
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;

  v1 = v0;
  v2 = sub_19A990B0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5988);
  v6 = *v0;
  v7 = sub_19A9911E4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v27 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v23 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v16)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v23);
    ++v12;
    if (!v24)
    {
      v12 = v23 + 1;
      if (v23 + 1 >= v16)
        goto LABEL_26;
      v24 = *(_QWORD *)(v27 + 8 * v12);
      if (!v24)
        break;
    }
LABEL_25:
    v15 = (v24 - 1) & v24;
    v18 = __clz(__rbit64(v24)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 16 * v18;
    v21 = *(_QWORD *)(v8 + 48) + v19;
    v22 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    v28 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + v20);
    v22(v21, v5, v2);
    *(_OWORD *)(*(_QWORD *)(v8 + 56) + v20) = v28;
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_28;
  }
  v24 = *(_QWORD *)(v27 + 8 * v25);
  if (v24)
  {
    v12 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v12);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19A97A6DC()
{
  return type metadata accessor for NetworkMonitor();
}

uint64_t method lookup function for NetworkMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NetworkMonitor.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of NetworkMonitor.stop()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of NetworkMonitor.addObserver(for:using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of NetworkMonitor.removeObserver(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkReachable.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 224) + *(_QWORD *)(*(_QWORD *)v0 + 224));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97A778;
  return v4();
}

uint64_t sub_19A97A778(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkConstrained.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 232) + *(_QWORD *)(*(_QWORD *)v0 + 232));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97A778;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkExpensive.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 240) + *(_QWORD *)(*(_QWORD *)v0 + 240));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97ABCC;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.usesCellularConnection.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 248) + *(_QWORD *)(*(_QWORD *)v0 + 248));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97ABCC;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.usesWifiConnection.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 256) + *(_QWORD *)(*(_QWORD *)v0 + 256));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97ABCC;
  return v4();
}

id sub_19A97A928()
{
  return sub_19A97A94C(&qword_1EE3B6380);
}

id sub_19A97A934()
{
  return sub_19A97A94C(&qword_1EE3B6360);
}

id sub_19A97A940()
{
  return sub_19A97A94C(&qword_1EE3B6350);
}

id sub_19A97A94C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_19A9911E4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_19A97AAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A97AB3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A97AB60(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_19A97AB90(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

BOOL sub_19A97ABD4(id a1, SEL a2, id a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v9;
  unsigned __int8 v10;

  v4 = sub_19A990D58();
  v6 = v5;
  objc_allocWithZone(MEMORY[0x1E0CA5870]);
  swift_bridgeObjectRetain();
  v7 = sub_19A90A1A8(v4, v6, 1);
  v9 = v7;
  if (v7)
  {
    v10 = objc_msgSend(a1, sel_isRecordValid_, v7);
    swift_bridgeObjectRelease();

    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

BOOL static AssistantSupportClient.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AssistantSupportClient.Error.hash(into:)()
{
  return sub_19A99134C();
}

uint64_t AssistantSupportClient.Error.hashValue.getter()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

uint64_t AssistantSupportClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AssistantSupportClient.init()();
  return v0;
}

uint64_t AssistantSupportClient.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[2];

  v1 = v0;
  v2 = sub_19A990FA4();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_19A990C50();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_19A990FBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A97B0BC();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF8D8], v4);
  sub_19A990C38();
  v14[1] = MEMORY[0x1E0DEE9D8];
  sub_19A97B0F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
  sub_19A96C2F8();
  sub_19A9910B8();
  *(_QWORD *)(v0 + 16) = sub_19A990FE0();
  v8 = objc_allocWithZone((Class)TPSServiceConnection);
  v9 = (void *)sub_19A990D34();
  v10 = objc_msgSend(v8, sel_initWithServiceName_, v9);

  *(_QWORD *)(v1 + 24) = v10;
  v11 = v10;
  v12 = _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0();
  objc_msgSend(v11, sel_setRemoteInterfaceInstance_, v12);

  return v1;
}

unint64_t sub_19A97B0BC()
{
  unint64_t result;

  result = qword_1ED03D3D8;
  if (!qword_1ED03D3D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED03D3D8);
  }
  return result;
}

unint64_t sub_19A97B0F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED03D3D0;
  if (!qword_1ED03D3D0)
  {
    v1 = sub_19A990FA4();
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1ED03D3D0);
  }
  return result;
}

uint64_t AssistantSupportClient.findMatchingResultId(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_19A97B158()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[4] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = v3;
  *v3 = v0;
  v3[1] = sub_19A97B1F8;
  v4 = v0[3];
  v3[7] = v2;
  v3[8] = v4;
  v3[5] = 0x800000019A9A0BE0;
  v3[6] = sub_19A97C2DC;
  v3[4] = 0xD00000000000001BLL;
  return swift_task_switch();
}

uint64_t sub_19A97B1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(v6 + 48) = v2;
  swift_task_dealloc();
  if (v2)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_19A97B288()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19A97B2BC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B40);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  type metadata accessor for ResultContext();
  v7 = (void *)sub_19A990E30();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19A97C6D4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A97B484;
  aBlock[3] = &block_descriptor_42;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_findMatchingResultIdFromContexts_reply_, v7, v10);
  _Block_release(v10);

}

uint64_t sub_19A97B410(int a1, int a2, id a3)
{
  id v3;

  if (a3)
  {
    v3 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B40);
    return sub_19A990E9C();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B40);
    return sub_19A990EA8();
  }
}

uint64_t sub_19A97B484(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v5 = sub_19A990D58();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19A97B504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return swift_task_switch();
}

uint64_t sub_19A97B524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  _BYTE *v6;

  if (objc_msgSend((id)objc_opt_self(), sel_allowsDE))
  {
    v1 = *(_QWORD *)(v0 + 64);
    v2 = swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    v3 = *(_OWORD *)(v0 + 48);
    *(_QWORD *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B38);
    *v4 = v0;
    v4[1] = sub_19A97B628;
    return sub_19A9912BC();
  }
  else
  {
    sub_19A97C434();
    swift_allocError();
    *v6 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A97B628()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 8))(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_19A97B6A0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A97B6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return swift_task_switch();
}

uint64_t sub_19A97B6F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  _BYTE *v6;

  if (objc_msgSend((id)objc_opt_self(), sel_allowsDE))
  {
    v1 = *(_QWORD *)(v0 + 56);
    v2 = swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    v3 = *(_OWORD *)(v0 + 40);
    *(_QWORD *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
    *v4 = v0;
    v4[1] = sub_19A97B7F8;
    return sub_19A9912BC();
  }
  else
  {
    sub_19A97C434();
    swift_allocError();
    *v6 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A97B7F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v2 + 8))(*(_QWORD *)(v2 + 16));
}

uint64_t sub_19A97B870()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A97B8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return swift_task_switch();
}

uint64_t sub_19A97B8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  _BYTE *v6;

  if (objc_msgSend((id)objc_opt_self(), sel_allowsDE))
  {
    v1 = *(_QWORD *)(v0 + 56);
    v2 = swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    v3 = *(_OWORD *)(v0 + 40);
    *(_QWORD *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B18);
    *v4 = v0;
    v4[1] = sub_19A97B9C8;
    return sub_19A9912BC();
  }
  else
  {
    sub_19A97C434();
    swift_allocError();
    *v6 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A97B9C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v2 + 8))(*(_QWORD *)(v2 + 16));
}

uint64_t AssistantSupportClient.availableUserGuideIdentifiers()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19A97BAC4;
  v2[6] = 0;
  v2[7] = v0;
  v2[4] = 0x800000019A9A0C00;
  v2[5] = sub_19A97BB18;
  v2[3] = 0xD00000000000001FLL;
  return swift_task_switch();
}

uint64_t sub_19A97BAC4(uint64_t a1)
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

void sub_19A97BB18(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B30);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19A97C5D8;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A97E1C0;
  aBlock[3] = &block_descriptor_28;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_availableUserGuideIdentifiersWithReply_, v9);
  _Block_release(v9);
}

uint64_t sub_19A97BC48()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B30);
  return sub_19A990EA8();
}

uint64_t AssistantSupportClient.fetchDocument(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_19A97BCA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = v0[2];
  v1 = v0[3];
  v3 = swift_task_alloc();
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_19A97BD50;
  v5 = v0[4];
  v4[6] = v3;
  v4[7] = v5;
  v4[4] = 0x800000019A9A0C20;
  v4[5] = sub_19A97C2E4;
  v4[3] = 0xD00000000000001ALL;
  return swift_task_switch();
}

uint64_t sub_19A97BD50(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 56) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_19A97BDD8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19A97BE0C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B20);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (void *)sub_19A990D34();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19A97C4D8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A97BFCC;
  aBlock[3] = &block_descriptor_14;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_fetchDocumentWithIdentifier_reply_, v7, v10);
  _Block_release(v10);

}

uint64_t sub_19A97BF5C(void *a1, id a2)
{
  id v2;
  id v4;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B20);
    return sub_19A990E9C();
  }
  else
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B20);
    return sub_19A990EA8();
  }
}

void sub_19A97BFCC(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t AssistantSupportClient.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AssistantSupportClient.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_19A97C090(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _BYTE *v21;
  _QWORD v23[2];
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26[4];
  _QWORD aBlock[6];

  v23[1] = a4;
  v24 = a3;
  v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = objc_msgSend(*(id *)(a2 + 24), sel_connection);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v17 + v16, (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = a7;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A95DD88;
  aBlock[3] = a8;
  v18 = _Block_copy(aBlock);
  swift_release();
  v19 = objc_msgSend(v15, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);

  sub_19A9910A0();
  swift_unknownObjectRelease();
  sub_19A91E8A8((uint64_t)aBlock, (uint64_t)v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B28);
  if (swift_dynamicCast())
  {
    v24(v25, a1);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_19A97C434();
    v20 = swift_allocError();
    *v21 = 1;
    v26[0] = v20;
    sub_19A990E9C();
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
}

uint64_t sub_19A97C298(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4;

  v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_19A990E9C();
}

void sub_19A97C2DC(void *a1, uint64_t a2)
{
  sub_19A97B2BC(a1, a2);
}

void sub_19A97C2E4(void *a1, uint64_t a2)
{
  sub_19A97BE0C(a1, a2);
}

unint64_t sub_19A97C2F0()
{
  unint64_t result;

  result = qword_1EE3B6A60;
  if (!qword_1EE3B6A60)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for AssistantSupportClient.Error, &type metadata for AssistantSupportClient.Error);
    atomic_store(result, (unint64_t *)&qword_1EE3B6A60);
  }
  return result;
}

uint64_t type metadata accessor for AssistantSupportClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for AssistantSupportClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssistantSupportClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t storeEnumTagSinglePayload for AssistantSupportClient.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19A97C3B4 + 4 * byte_19A99B265[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19A97C3E8 + 4 * byte_19A99B260[v4]))();
}

uint64_t sub_19A97C3E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A97C3F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19A97C3F8);
  return result;
}

uint64_t sub_19A97C404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19A97C40CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19A97C410(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A97C418(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssistantSupportClient.Error()
{
  return &type metadata for AssistantSupportClient.Error;
}

unint64_t sub_19A97C434()
{
  unint64_t result;

  result = qword_1EE3B6B10;
  if (!qword_1EE3B6B10)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for AssistantSupportClient.Error, &type metadata for AssistantSupportClient.Error);
    atomic_store(result, (unint64_t *)&qword_1EE3B6B10);
  }
  return result;
}

uint64_t sub_19A97C478(uint64_t a1)
{
  uint64_t v1;

  return sub_19A97C090(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), &qword_1EE3B6B20, (uint64_t)&unk_1E395F358, (uint64_t)sub_19A97C4C0, (uint64_t)&block_descriptor_4);
}

uint64_t sub_19A97C4B4()
{
  return objectdestroyTm(&qword_1EE3B6B20);
}

uint64_t sub_19A97C4C0(void *a1)
{
  return sub_19A97C57C(a1, &qword_1EE3B6B20);
}

uint64_t sub_19A97C4CC()
{
  return objectdestroyTm(&qword_1EE3B6B20);
}

uint64_t sub_19A97C4D8(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B20);
  return sub_19A97BF5C(a1, a2);
}

uint64_t sub_19A97C528(uint64_t a1)
{
  uint64_t v1;

  return sub_19A97C090(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), &qword_1EE3B6B30, (uint64_t)&unk_1E395F3F8, (uint64_t)sub_19A97C570, (uint64_t)&block_descriptor_22);
}

uint64_t sub_19A97C564()
{
  return objectdestroyTm(&qword_1EE3B6B30);
}

uint64_t sub_19A97C570(void *a1)
{
  return sub_19A97C57C(a1, &qword_1EE3B6B30);
}

uint64_t sub_19A97C57C(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_19A97C298(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_19A97C5CC()
{
  return objectdestroyTm(&qword_1EE3B6B30);
}

uint64_t sub_19A97C5D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B30);
  return sub_19A97BC48();
}

uint64_t sub_19A97C618(uint64_t a1)
{
  uint64_t v1;

  return sub_19A97C090(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), &qword_1EE3B6B40, (uint64_t)&unk_1E395F498, (uint64_t)sub_19A97C660, (uint64_t)&block_descriptor_36);
}

uint64_t sub_19A97C654()
{
  return objectdestroyTm(&qword_1EE3B6B40);
}

uint64_t sub_19A97C660(void *a1)
{
  return sub_19A97C57C(a1, &qword_1EE3B6B40);
}

uint64_t sub_19A97C66C()
{
  return objectdestroyTm(&qword_1EE3B6B40);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_19A97C6D4(int a1, int a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B40);
  return sub_19A97B410(a1, a2, a3);
}

uint64_t sub_19A97C7C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_19A97C87C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A97C8F0()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuideTopic_topicId);
}

uint64_t sub_19A97C914()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuideTopic_version);
}

void sub_19A97C92C()
{
  qword_1EE3B59C8 = 0x32766470682D78;
  unk_1EE3B59D0 = 0xE700000000000000;
}

unint64_t static UserGuideTopic.uti.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_19A97CA94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_19A990B0C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuideTopic_topicId);
  swift_beginAccess();
  if (v5[1])
  {
    v6 = *v5;
  }
  else
  {
    sub_19A990B00();
    v6 = sub_19A990AE8();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_19A97CB74()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t sub_19A97CB8C(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t (*sub_19A97CB98())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_19A97CBE8()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t sub_19A97CC00(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t (*sub_19A97CC0C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL static UserGuideTopic.isValidIdentifier(_:)()
{
  id v0;
  id v1;

  objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
  swift_bridgeObjectRetain();
  v0 = UserGuideTopic.init(searchableItemUniqueIdentifier:)();
  v1 = v0;
  if (v0)

  return v1 != 0;
}

id UserGuideTopic.__allocating_init(searchableItemUniqueIdentifier:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return UserGuideTopic.init(searchableItemUniqueIdentifier:)();
}

uint64_t sub_19A97CD5C(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t *v22;
  void (*v23)(uint64_t *, _QWORD);
  unint64_t *v24;
  unint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v5);
  v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_19A990860();
  v7 = *(_QWORD *)(v43 - 8);
  v8 = MEMORY[0x1E0C80A78](v43);
  v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v42 = (char *)&v38 - v10;
  v11 = sub_19A9908F0();
  v40 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v38 - v15;
  sub_19A9908E4();
  if (qword_1EE3B59D8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_19A9908CC();
  v44 = a1;
  v45 = a2;
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  v17 = v44;
  v18 = v45;
  swift_beginAccess();
  v44 = v17;
  v45 = v18;
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A9908B4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B59E0);
  v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v38 = *(_QWORD *)(v7 + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_19A99A9B0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A99083C();
  swift_bridgeObjectRelease();
  sub_19A990884();
  v20 = v2 + OBJC_IVAR___TPSUserGuideTopic_version;
  swift_beginAccess();
  if (*(_QWORD *)(v20 + 8))
  {
    swift_bridgeObjectRetain();
    v21 = v42;
    sub_19A99083C();
    swift_bridgeObjectRelease();
    v23 = (void (*)(uint64_t *, _QWORD))sub_19A99086C();
    if (*v22)
    {
      v24 = v22;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v39, v21, v43);
      v25 = *v24;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v24 = v25;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v25 = sub_19A96A52C(0, *(_QWORD *)(v25 + 16) + 1, 1, v25);
        *v24 = v25;
      }
      v28 = *(_QWORD *)(v25 + 16);
      v27 = *(_QWORD *)(v25 + 24);
      if (v28 >= v27 >> 1)
      {
        v25 = sub_19A96A52C(v27 > 1, v28 + 1, 1, v25);
        *v24 = v25;
      }
      *(_QWORD *)(v25 + 16) = v28 + 1;
      v29 = v25 + v19 + v28 * v38;
      v30 = v43;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v29, v39, v43);
      v23(&v44, 0);
      v21 = v42;
    }
    else
    {
      v23(&v44, 0);
      v30 = v43;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v30);
  }
  v31 = v40;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v14, v16, v11);
  v32 = (uint64_t)v41;
  sub_19A99089C();
  v33 = *(void (**)(char *, uint64_t))(v31 + 8);
  v33(v14, v11);
  v34 = sub_19A990A34();
  v35 = *(_QWORD *)(v34 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v34) == 1)
  {
    v33(v16, v11);
    sub_19A90A538(v32, &qword_1ED03D378);
    return 0;
  }
  else
  {
    v36 = sub_19A9909D4();
    v33(v16, v11);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v32, v34);
  }
  return v36;
}

id UserGuideTopic.__allocating_init(productIdentifier:topicIdentifier:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  objc_super v21;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___TPSUserGuideTopic_topicId];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v13[OBJC_IVAR___TPSUserGuideTopic_version];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v13[OBJC_IVAR___TPSUserGuideTopic_title];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = &v13[OBJC_IVAR___TPSUserGuideTopic_body];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v13[OBJC_IVAR___TPSUserGuideTopic_productId];
  *(_QWORD *)v18 = a1;
  *((_QWORD *)v18 + 1) = a2;
  swift_beginAccess();
  *(_QWORD *)v14 = a3;
  *((_QWORD *)v14 + 1) = a4;
  v19 = v13;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v15 = a5;
  *((_QWORD *)v15 + 1) = a6;

  swift_bridgeObjectRelease();
  v21.receiver = v19;
  v21.super_class = v6;
  return objc_msgSendSuper2(&v21, sel_init);
}

id UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v11 = &v6[OBJC_IVAR___TPSUserGuideTopic_topicId];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = &v6[OBJC_IVAR___TPSUserGuideTopic_version];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v6[OBJC_IVAR___TPSUserGuideTopic_title];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v6[OBJC_IVAR___TPSUserGuideTopic_body];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v6[OBJC_IVAR___TPSUserGuideTopic_productId];
  *(_QWORD *)v15 = a1;
  *((_QWORD *)v15 + 1) = a2;
  swift_beginAccess();
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v16 = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v12 = a5;
  *((_QWORD *)v12 + 1) = a6;

  swift_bridgeObjectRelease();
  v18.receiver = v16;
  v18.super_class = (Class)type metadata accessor for UserGuideTopic();
  return objc_msgSendSuper2(&v18, sel_init);
}

id UserGuideTopic.init(searchableItemUniqueIdentifier:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  objc_class *v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;

  v54 = sub_19A990860();
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v51 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B64A8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19A9908F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)&v0[OBJC_IVAR___TPSUserGuideTopic_topicId];
  *v9 = 0;
  v9[1] = 0;
  v53 = v9;
  v10 = (uint64_t *)&v0[OBJC_IVAR___TPSUserGuideTopic_version];
  *v10 = 0;
  v10[1] = 0;
  v11 = v10;
  v12 = &v0[OBJC_IVAR___TPSUserGuideTopic_title];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v0[OBJC_IVAR___TPSUserGuideTopic_body];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = v0;
  sub_19A9908D8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    v50 = v14;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v16 = sub_19A9908C0();
    v17 = v15;
    if (qword_1EE3B59D8 == -1)
    {
      v18 = v51;
      if (!v15)
        goto LABEL_31;
    }
    else
    {
      swift_once();
      v18 = v51;
      if (!v17)
        goto LABEL_31;
    }
    if (v16 == qword_1EE3B59C8 && v17 == unk_1EE3B59D0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = sub_19A991298();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
        goto LABEL_31;
    }
    v20 = sub_19A9908A8();
    if (v21)
    {
      v57 = v20;
      v58 = v21;
      v55 = 46;
      v56 = 0xE100000000000000;
      sub_19A960644();
      v22 = (_QWORD *)sub_19A991070();
      swift_bridgeObjectRelease();
      if (v22[2] > 1uLL)
      {
        v24 = v22[6];
        v23 = v22[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v25 = &v50[OBJC_IVAR___TPSUserGuideTopic_productId];
        *(_QWORD *)v25 = v24;
        *((_QWORD *)v25 + 1) = v23;
        v26 = sub_19A990878();
        if (v26)
        {
          v48 = v8;
          v49 = v6;
          v27 = v5;
          v28 = *(_QWORD *)(v26 + 16);
          if (v28)
          {
            v29 = v52;
            v30 = v26 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
            swift_beginAccess();
            swift_beginAccess();
            v31 = *(_QWORD *)(v29 + 72);
            v32 = *(void (**)(char *, unint64_t, uint64_t))(v29 + 16);
            do
            {
              v32(v18, v30, v54);
              v34 = sub_19A990848();
              v35 = v33;
              if (v34 == 0x64496369706F74 && v33 == 0xE700000000000000 || (sub_19A991298() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v36 = sub_19A990854();
                v38 = v37;
                (*(void (**)(char *, uint64_t))(v52 + 8))(v18, v54);
                v39 = v53;
                *v53 = v36;
                v39[1] = v38;
              }
              else
              {
                if (v34 == 0x6E6F6973726576 && v35 == 0xE700000000000000)
                {
                  swift_bridgeObjectRelease();
                }
                else
                {
                  v40 = sub_19A991298();
                  swift_bridgeObjectRelease();
                  if ((v40 & 1) == 0)
                  {
                    (*(void (**)(char *, uint64_t))(v52 + 8))(v18, v54);
                    goto LABEL_19;
                  }
                }
                v41 = sub_19A990854();
                v43 = v42;
                (*(void (**)(char *, uint64_t))(v52 + 8))(v18, v54);
                *v11 = v41;
                v11[1] = v43;
              }
              swift_bridgeObjectRelease();
LABEL_19:
              v30 += v31;
              --v28;
            }
            while (v28);
          }
          swift_bridgeObjectRelease();
          v5 = v27;
          v8 = v48;
          v6 = v49;
        }
        v44 = v50;

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        v45 = (objc_class *)type metadata accessor for UserGuideTopic();
        v59.receiver = v44;
        v59.super_class = v45;
        return objc_msgSendSuper2(&v59, sel_init);
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_bridgeObjectRelease();
LABEL_32:
      v14 = v50;
      goto LABEL_33;
    }
LABEL_31:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_32;
  }
  sub_19A90A538((uint64_t)v4, &qword_1EE3B64A8);
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  type metadata accessor for UserGuideTopic();
  swift_deallocPartialClassInstance();
  return 0;
}

id UserGuideTopic.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UserGuideTopic.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UserGuideTopic.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserGuideTopic();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UserGuideTopic.supportSiteURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = sub_19A9909C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A990A1C();
  v11 = sub_19A990A34();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    sub_19A90A538((uint64_t)v10, &qword_1ED03D378);
    v14 = 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_19A99A940;
    *(_QWORD *)(v15 + 32) = 0x6564697567;
    *(_QWORD *)(v15 + 40) = 0xE500000000000000;
    v24 = a1;
    v16 = (uint64_t *)(v2 + OBJC_IVAR___TPSUserGuideTopic_productId);
    swift_beginAccess();
    v17 = *v16;
    v18 = v16[1];
    *(_QWORD *)(v15 + 48) = v17;
    *(_QWORD *)(v15 + 56) = v18;
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAFD78], v4);
    sub_19A960644();
    v23 = v12;
    a1 = v24;
    swift_bridgeObjectRetain();
    v12 = v23;
    sub_19A990A28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    v14 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a1, v14, 1, v11);
  v19 = (uint64_t *)(v2 + OBJC_IVAR___TPSUserGuideTopic_topicId);
  result = swift_beginAccess();
  v21 = v19[1];
  if (v21)
  {
    v22 = *v19;
    result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a1, 1, v11);
    if (!(_DWORD)result)
    {
      v25 = v22;
      v26 = v21;
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAFD78], v4);
      sub_19A960644();
      swift_bridgeObjectRetain();
      sub_19A990A04();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_19A97DF78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19A97DFD0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_topicId, a2);
}

uint64_t sub_19A97DFDC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_topicId);
}

uint64_t sub_19A97DFF8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_version, a2);
}

uint64_t sub_19A97E004(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_version);
}

uint64_t sub_19A97E020@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_title, a2);
}

uint64_t sub_19A97E02C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t sub_19A97E048@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_body, a2);
}

uint64_t sub_19A97E054(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19A95A24C(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t method lookup function for UserGuideTopic()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserGuideTopic.productId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of UserGuideTopic.topicId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of UserGuideTopic.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UserGuideTopic.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of UserGuideTopic.title.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UserGuideTopic.title.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of UserGuideTopic.title.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of UserGuideTopic.body.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of UserGuideTopic.body.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of UserGuideTopic.body.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of UserGuideTopic.searchableItemUniqueIdentifier(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of UserGuideTopic.__allocating_init(productIdentifier:topicIdentifier:version:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of UserGuideTopic.__allocating_init(searchableItemUniqueIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t sub_19A97E1C0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_19A990E3C();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_19A97E218()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SearchQueryManager()), sel_init);
  qword_1EE3B6B70 = (uint64_t)result;
  return result;
}

id SearchQueryManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static SearchQueryManager.shared.getter()
{
  if (qword_1EE3B6100 != -1)
    swift_once();
  return (id)qword_1EE3B6B70;
}

id SearchQueryManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  objc_class *ObjectType;
  objc_super v14;
  uint64_t v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v12 = sub_19A990FBC();
  v1 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_19A990FA4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_19A990C50();
  MEMORY[0x1E0C80A78](v6);
  v11 = OBJC_IVAR___TPSSearchQueryManager_syncQueue;
  v10[1] = sub_19A90A170(0, (unint64_t *)&qword_1ED03D3D8);
  v7 = v0;
  sub_19A990C38();
  v15 = MEMORY[0x1E0DEE9D8];
  sub_19A90A994((unint64_t *)&qword_1ED03D3D0, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
  sub_19A9766CC((unint64_t *)&qword_1ED03D3C0, &qword_1ED03D3B8);
  sub_19A9910B8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v12);
  *(_QWORD *)&v0[v11] = sub_19A990FE0();
  v8 = OBJC_IVAR___TPSSearchQueryManager_pendingQueries;
  *(_QWORD *)&v7[v8] = sub_19A958C9C(MEMORY[0x1E0DEE9D8]);

  v14.receiver = v7;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_19A97E528(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v7 = sub_19A990C2C();
  v24 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_19A990C50();
  v22 = *(_QWORD *)(v10 - 8);
  v23 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &a1[OBJC_IVAR___TPSSearchQuery_identifier];
  swift_beginAccess();
  v14 = *(_QWORD *)v13;
  v15 = *((_QWORD *)v13 + 1);
  v21 = *(_QWORD *)(v3 + OBJC_IVAR___TPSSearchQueryManager_syncQueue);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v16;
  v17[3] = v14;
  v17[4] = v15;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = a3;
  aBlock[4] = sub_19A9810BC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A964B30;
  aBlock[3] = &block_descriptor_13;
  v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  v19 = a1;
  swift_retain();
  sub_19A990C38();
  v25 = MEMORY[0x1E0DEE9D8];
  sub_19A90A994((unint64_t *)&qword_1EE3B66C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B66C8);
  sub_19A9766CC((unint64_t *)&qword_1EE3B66D0, &qword_1EE3B66C8);
  sub_19A9910B8();
  MEMORY[0x19AECD6DC](0, v12, v9, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v23);
  swift_release();
  return swift_release();
}

void sub_19A97E794(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  id v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;

  v11 = a1 + 16;
  swift_beginAccess();
  v12 = MEMORY[0x19AECE39C](v11);
  if (v12)
  {
    v13 = (char *)v12;
    v14 = (uint64_t *)(v12 + OBJC_IVAR___TPSSearchQueryManager_pendingQueries);
    swift_beginAccess();
    v15 = (void *)sub_19A979D88(a2, a3);
    swift_endAccess();
    if (v15)
    {
      sub_19A97E974();

    }
    v16 = *(void **)&v13[OBJC_IVAR___TPSSearchQueryManager_syncQueue];
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = v13;
    v17[3] = a2;
    v17[4] = a3;
    v17[5] = a5;
    v17[6] = a6;
    v18 = objc_allocWithZone((Class)type metadata accessor for CoreSpotlightQuery());
    v19 = a4;
    v20 = v16;
    v21 = v13;
    swift_bridgeObjectRetain();
    swift_retain();
    v22 = sub_19A982BE8(v19, v20, (uint64_t)sub_19A981100, (uint64_t)v17);

    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v23 = v22;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = *v14;
    *v14 = 0x8000000000000000;
    sub_19A959A40((uint64_t)v23, a2, a3, isUniquelyReferenced_nonNull_native);
    *v14 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_19A97EC2C();

  }
}

id sub_19A97E974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  uint64_t v13;

  v1 = sub_19A990C98();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (uint64_t *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_19A990CB0();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    if (qword_1EE3B6098 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v7 = (id)qword_1EE3B6508;
  v8 = sub_19A990F80();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136315138;
    v12 = sub_19A91E7D8(0xD000000000000021, 0x800000019A9A0EF0, &v13);
    sub_19A991058();
    _os_log_impl(&dword_19A906000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v10, -1, -1);
    MEMORY[0x19AECE318](v9, -1, -1);
  }

  result = *(id *)(v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query);
  if (result)
    return objc_msgSend(result, sel_cancel);
  return result;
}

void sub_19A97EB7C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  id v10;
  void *v11;

  if (a1)
  {
    v10 = a1;
    ((void (*)(void *, _QWORD))a6)(a1, 0);

  }
  else
  {
    a6();
  }
  swift_beginAccess();
  v11 = (void *)sub_19A979D88(a4, a5);
  swift_endAccess();

}

void sub_19A97EC2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t aBlock;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19A990C98();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t *)((char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DEF740], v5);
  v10 = v9;
  LOBYTE(v9) = sub_19A990CB0();
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v8 = (_QWORD *)0xD000000000000015;
  v11 = OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query))
  {
    if (qword_1EE3B6098 == -1)
    {
LABEL_4:
      aBlock = 0;
      v55 = 0xE000000000000000;
      v12 = (id)qword_1EE3B6508;
      sub_19A991160();
      swift_bridgeObjectRelease();
      v60 = (uint64_t)v8 + 2;
      v61 = 0x800000019A9A0F20;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_19A990DAC();
      swift_bridgeObjectRelease();
      v14 = v60;
      v13 = v61;
      v15 = sub_19A990F8C();
      if (os_log_type_enabled(v12, v15))
      {
        swift_bridgeObjectRetain_n();
        v16 = (uint8_t *)swift_slowAlloc();
        v17 = swift_slowAlloc();
        v60 = v17;
        *(_DWORD *)v16 = 136315138;
        swift_bridgeObjectRetain();
        v62 = sub_19A91E7D8(v14, v13, &v60);
        sub_19A991058();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19A906000, v12, v15, "%s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECE318](v17, -1, -1);
        MEMORY[0x19AECE318](v16, -1, -1);
      }

      swift_bridgeObjectRelease();
      return;
    }
LABEL_17:
    swift_once();
    goto LABEL_4;
  }
  v18 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery);
  v19 = sub_19A962F30();
  v20 = *(void **)(v1 + v11);
  *(_QWORD *)(v1 + v11) = v19;
  v21 = v19;

  if (qword_1EE3B6098 != -1)
    swift_once();
  v22 = (id)qword_1EE3B6508;
  v23 = sub_19A990F74();
  v24 = os_log_type_enabled(v22, v23);
  v53 = v4;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    aBlock = v26;
    *(_DWORD *)v25 = 136315138;
    v60 = sub_19A91E7D8(0xD000000000000022, 0x800000019A9A0F40, &aBlock);
    sub_19A991058();
    _os_log_impl(&dword_19A906000, v22, v23, "%s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v26, -1, -1);
    MEMORY[0x19AECE318](v25, -1, -1);
  }

  aBlock = 0;
  v55 = 0xE000000000000000;
  v27 = (id)qword_1EE3B6508;
  sub_19A991160();
  sub_19A990DAC();
  v28 = objc_msgSend(v21, sel_queryString);
  if (v28)
  {
    v29 = v28;
    sub_19A990D58();

  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v30 = (uint64_t *)(v18 + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  v62 = *v30;
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  v32 = aBlock;
  v31 = v55;
  v33 = sub_19A990F80();
  if (os_log_type_enabled(v27, v33))
  {
    swift_bridgeObjectRetain_n();
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    aBlock = v35;
    *(_DWORD *)v34 = 136315138;
    swift_bridgeObjectRetain();
    v62 = sub_19A91E7D8(v32, v31, &aBlock);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v27, v33, "%s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v35, -1, -1);
    MEMORY[0x19AECE318](v34, -1, -1);
  }

  swift_bridgeObjectRelease();
  v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v36;
  *(_QWORD *)(v38 + 24) = v37;
  v58 = sub_19A982D38;
  v59 = v38;
  v39 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v55 = 1107296256;
  v56 = sub_19A97E1C0;
  v57 = &block_descriptor_28_0;
  v40 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setCompletionsHandler_, v40);
  _Block_release(v40);
  v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = v41;
  *(_QWORD *)(v43 + 24) = v42;
  v58 = sub_19A982D44;
  v59 = v43;
  aBlock = v39;
  v55 = 1107296256;
  v56 = sub_19A9801E8;
  v57 = &block_descriptor_36_0;
  v44 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setFoundItemsHandler_, v44);
  _Block_release(v44);
  v45 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = v45;
  *(_QWORD *)(v47 + 24) = v46;
  v58 = sub_19A982D7C;
  v59 = v47;
  aBlock = v39;
  v55 = 1107296256;
  v56 = sub_19A916084;
  v57 = &block_descriptor_44;
  v48 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setCompletionHandler_, v48);
  _Block_release(v48);
  v49 = (uint64_t)v53;
  sub_19A990AD0();
  v50 = sub_19A990ADC();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
  v51 = v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate;
  swift_beginAccess();
  sub_19A982D84(v49, v51);
  swift_endAccess();
  objc_msgSend(v21, sel_start);

}

void sub_19A97F5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_19A9909B0();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_19A97F61C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_19A990C2C();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_19A990C50();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(_QWORD *)(v3 + OBJC_IVAR___TPSSearchQueryManager_syncQueue);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a1;
  v15[4] = a2;
  aBlock[4] = sub_19A9809C4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A964B30;
  aBlock[3] = &block_descriptor_5;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_19A990C38();
  v20 = MEMORY[0x1E0DEE9D8];
  sub_19A90A994((unint64_t *)&qword_1EE3B66C0, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B66C8);
  sub_19A9766CC((unint64_t *)&qword_1EE3B66D0, &qword_1EE3B66C8);
  sub_19A9910B8();
  MEMORY[0x19AECD6DC](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  return swift_release();
}

void sub_19A97F854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  id v13;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x19AECE39C](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (uint64_t *)(v6 + OBJC_IVAR___TPSSearchQueryManager_pendingQueries);
    swift_beginAccess();
    v9 = *v8;
    if (*(_QWORD *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      v10 = sub_19A979BFC(a2, a3);
      if ((v11 & 1) != 0)
      {
        v12 = *(void **)(*(_QWORD *)(v9 + 56) + 8 * v10);
        swift_endAccess();
        v13 = v12;
        swift_bridgeObjectRelease();
        sub_19A97E974();

        v7 = v13;
LABEL_7:

        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    goto LABEL_7;
  }
}

uint64_t type metadata accessor for SearchQueryManager()
{
  return objc_opt_self();
}

uint64_t sub_19A97F9E4()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_19A990ADC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v19 - v9;
  v11 = v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate;
  swift_beginAccess();
  sub_19A95ED9C(v11, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_19A960074((uint64_t)v3);
    return 0x6E776F6E6B6E75;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_19A99A9B0;
    sub_19A990AD0();
    sub_19A990A94();
    v15 = v14;
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    v17 = MEMORY[0x1E0DEB100];
    *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEB070];
    *(_QWORD *)(v13 + 64) = v17;
    *(_QWORD *)(v13 + 32) = v15;
    v12 = sub_19A990D64();
    v16(v10, v4);
  }
  return v12;
}

void sub_19A97FBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19[3];

  v4 = a2 + 16;
  if (qword_1EE3B6098 != -1)
    swift_once();
  v5 = (id)qword_1EE3B6508;
  sub_19A991160();
  swift_bridgeObjectRelease();
  v19[0] = 0xD000000000000013;
  v19[1] = 0x800000019A9A0FD0;
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v6 = sub_19A990F74();
  if (os_log_type_enabled(v5, v6))
  {
    swift_bridgeObjectRetain_n();
    v18 = a3;
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(0xD000000000000013, 0x800000019A9A0FD0, v19);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v8, -1, -1);
    v9 = v7;
    a3 = v18;
    MEMORY[0x19AECE318](v9, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_beginAccess();
  v10 = MEMORY[0x19AECE39C](v4);
  if (v10)
  {
    v11 = (char *)v10;
    swift_beginAccess();
    v12 = (void *)MEMORY[0x19AECE39C](a3 + 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(void **)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v14)
      {
        if (v12 == v14)
        {
          v15 = v12;
          v16 = swift_bridgeObjectRetain();
          v17 = sub_19A982E0C(v16);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_19A9809D0(v17);
          swift_endAccess();

          v11 = v15;
        }
      }

    }
    else
    {
      v13 = v11;
    }

  }
}

void sub_19A97FEB8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  if (qword_1EE3B6098 != -1)
    swift_once();
  v6 = a2 + 16;
  v7 = (id)qword_1EE3B6508;
  sub_19A991160();
  swift_bridgeObjectRelease();
  v22 = 0xD000000000000013;
  v23 = 0x800000019A9A0FD0;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_19A9911CC();
    swift_bridgeObjectRelease();
  }
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v9 = v22;
  v8 = v23;
  v10 = sub_19A990F74();
  if (os_log_type_enabled(v7, v10))
  {
    swift_bridgeObjectRetain_n();
    v21 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v22 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(v9, v8, &v22);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v7, v10, "%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v12, -1, -1);
    v13 = v11;
    a3 = v21;
    MEMORY[0x19AECE318](v13, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_beginAccess();
  v14 = MEMORY[0x19AECE39C](v6);
  if (v14)
  {
    v15 = (char *)v14;
    swift_beginAccess();
    v16 = MEMORY[0x19AECE39C](a3 + 16);
    if (v16)
    {
      v17 = (void *)v16;
      v18 = *(_QWORD *)&v15[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v18)
      {
        if (v16 == v18)
        {
          swift_bridgeObjectRetain();
          v19 = v17;
          v20 = sub_19A982EA0(a1);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_19A980B3C(v20);
          swift_endAccess();

          v15 = v19;
        }
      }

    }
    else
    {
      v17 = v15;
    }

  }
}

uint64_t sub_19A9801E8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
  v2 = sub_19A990E3C();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_19A980254(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x19AECE39C](v5);
  if (v6)
  {
    v7 = (void *)v6;
    if (qword_1EE3B6098 != -1)
      swift_once();
    v8 = a3 + 16;
    v9 = (id)qword_1EE3B6508;
    sub_19A991160();
    swift_bridgeObjectRelease();
    v18 = 0xD000000000000017;
    v19 = 0x800000019A9A0FB0;
    sub_19A97F9E4();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    if (a1)
    {
      swift_getErrorValue();
      v10 = sub_19A991304();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v20 = v10;
    v21 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6B38);
    sub_19A990D7C();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    v13 = v18;
    v12 = v19;
    v14 = sub_19A990F74();
    if (os_log_type_enabled(v9, v14))
    {
      swift_bridgeObjectRetain_n();
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      v20 = sub_19A91E7D8(v13, v12, &v18);
      sub_19A991058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A906000, v9, v14, "%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v16, -1, -1);
      MEMORY[0x19AECE318](v15, -1, -1);
    }

    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17 = (void *)MEMORY[0x19AECE39C](v8);
    sub_19A980530(v17, a1);

  }
}

uint64_t sub_19A980530(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v5 = sub_19A990C2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19A990C50();
  v10 = *(_QWORD *)(v9 - 8);
  result = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v14 = *(void **)(v2 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query);
    if (v14)
      v15 = v14 == a1;
    else
      v15 = 0;
    if (v15)
    {
      v27 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
      v16 = swift_allocObject();
      v23 = v6;
      v17 = v16;
      swift_unknownObjectWeakInit();
      v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v19 = (_QWORD *)swift_allocObject();
      v25 = v18;
      v26 = v17;
      v19[2] = v17;
      v19[3] = v18;
      v19[4] = a2;
      v20 = a2;
      aBlock[4] = sub_19A982E00;
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_19A964B30;
      aBlock[3] = &block_descriptor_52;
      v21 = _Block_copy(aBlock);
      v24 = a1;
      swift_retain();
      swift_retain();
      v22 = v20;
      sub_19A990C38();
      v28 = MEMORY[0x1E0DEE9D8];
      sub_19A90A994((unint64_t *)&qword_1EE3B66C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B66C8);
      sub_19A9766CC((unint64_t *)&qword_1EE3B66D0, &qword_1EE3B66C8);
      sub_19A9910B8();
      MEMORY[0x19AECD6DC](0, v13, v8, v21);
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      swift_release();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_19A98088C()
{
  return type metadata accessor for CoreSpotlightQuery();
}

uint64_t type metadata accessor for CoreSpotlightQuery()
{
  uint64_t result;

  result = qword_1EE3B6C10;
  if (!qword_1EE3B6C10)
    return swift_getSingletonMetadata();
  return result;
}

void sub_19A9808D0()
{
  unint64_t v0;

  sub_19A908BEC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_19A980974()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_19A980998()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_19A9809C4()
{
  uint64_t *v0;

  sub_19A97F854(v0[2], v0[3], v0[4]);
}

uint64_t sub_19A9809D0(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_19A981110(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_19A980B3C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  _QWORD *v16;
  id v17[6];

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_19A9910DC();
    sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
    sub_19A982FF8();
    sub_19A990F50();
    v1 = (unint64_t)v17[1];
    v16 = v17[2];
    v2 = (uint64_t)v17[3];
    v3 = v17[4];
    v4 = (unint64_t)v17[5];
  }
  else
  {
    v3 = 0;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v16 = (_QWORD *)(a1 + 56);
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
  }
  v8 = (unint64_t)(v2 + 64) >> 6;
  if ((v1 & 0x8000000000000000) != 0)
    goto LABEL_10;
  while (1)
  {
    if (v4)
    {
      v9 = (v4 - 1) & v4;
      v10 = __clz(__rbit64(v4)) | ((_QWORD)v3 << 6);
      v11 = (char *)v3;
      goto LABEL_29;
    }
    v13 = (uint64_t)v3 + 1;
    if (__OFADD__(v3, 1))
      break;
    if (v13 >= v8)
      goto LABEL_32;
    v14 = v16[v13];
    v11 = (char *)v3 + 1;
    if (!v14)
    {
      v11 = (char *)v3 + 2;
      if ((uint64_t)v3 + 2 >= v8)
        goto LABEL_32;
      v14 = v16[(_QWORD)v11];
      if (!v14)
      {
        v11 = (char *)v3 + 3;
        if ((uint64_t)v3 + 3 >= v8)
          goto LABEL_32;
        v14 = v16[(_QWORD)v11];
        if (!v14)
        {
          v11 = (char *)v3 + 4;
          if ((uint64_t)v3 + 4 >= v8)
            goto LABEL_32;
          v14 = v16[(_QWORD)v11];
          if (!v14)
          {
            v11 = (char *)v3 + 5;
            if ((uint64_t)v3 + 5 >= v8)
              goto LABEL_32;
            v14 = v16[(_QWORD)v11];
            if (!v14)
            {
              v15 = (char *)v3 + 6;
              while ((char *)v8 != v15)
              {
                v14 = v16[(_QWORD)v15++];
                if (v14)
                {
                  v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_19A983050();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v9 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + ((_QWORD)v11 << 6);
LABEL_29:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v12)
      goto LABEL_32;
    while (1)
    {
      sub_19A9812BC(v17, v12);

      v3 = v11;
      v4 = v9;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_19A991100())
      {
        sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v12 = v17[0];
        swift_unknownObjectRelease();
        v11 = (char *)v3;
        v9 = v4;
        if (v12)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_19A980DD8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  void (*v21)(id, void *);
  id v22;
  void *v23;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x19AECE39C](v5);
  if (v6)
  {
    v7 = (char *)v6;
    swift_beginAccess();
    v8 = MEMORY[0x19AECE39C](a2 + 16);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query;
      v11 = *(_QWORD *)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v11 && v8 == v11)
      {
        if (a3)
        {
          v12 = a3;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D1E0);
          type metadata accessor for CSSearchQueryError(0);
          if ((swift_dynamicCast() & 1) != 0)
          {
            sub_19A90A994(&qword_1EE3B63E8, (uint64_t (*)(uint64_t))type metadata accessor for CSSearchQueryError, (uint64_t)&unk_19A99A5DC);
            sub_19A99098C();

            if (a3 == (void *)-2003)
            {
              v13 = (_BYTE *)(*(_QWORD *)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery]
                            + OBJC_IVAR___TPSSearchQuery_isCancelled);
              swift_beginAccess();
              *v13 = 1;
            }
          }
        }
        v14 = *(void **)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery];
        swift_beginAccess();
        v15 = v14;
        v16 = swift_bridgeObjectRetain();
        v17 = sub_19A983B0C(v16);
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v18 = swift_bridgeObjectRetain();
        v19 = sub_19A983A28(v18);
        swift_bridgeObjectRelease();
        v20 = sub_19A986198(v15, v17, (uint64_t)v19);

        swift_release();
        swift_release();
        v21 = *(void (**)(id, void *))&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completion];
        swift_retain();
        v22 = v20;
        v21(v20, a3);
        swift_release();

        v9 = *(void **)&v7[v10];
        *(_QWORD *)&v7[v10] = 0;
      }

    }
    else
    {
      v9 = v7;
    }

  }
}

uint64_t sub_19A981054()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_19A981078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_19A97F5C4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_19A981080()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_19A9810BC()
{
  uint64_t v0;

  sub_19A97E794(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_19A9810CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_19A981100(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_19A97EB7C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void (**)(void))(v2 + 40));
}

uint64_t sub_19A981110(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_19A991340();
  swift_bridgeObjectRetain();
  sub_19A990DA0();
  v8 = sub_19A991364();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_19A991298() & 1) != 0)
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
      if (v19 || (sub_19A991298() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_19A981D2C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_19A9812BC(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_19A9910F4();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_19A9910E8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_19A981558(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_19A981A10();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_19A981CAC((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_19A991004();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_19A991010();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_19A991010();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_19A981EC4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_19A981558(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C30);
    v2 = sub_19A991148();
    v14 = v2;
    sub_19A9910DC();
    if (sub_19A991100())
    {
      sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_19A981A10();
          v2 = v14;
        }
        result = sub_19A991004();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_19A991100());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v2;
}

uint64_t sub_19A98174C()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C38);
  v3 = sub_19A99113C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_37;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v0;
  v32 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8)
      break;
    v17 = (_QWORD *)(v2 + 56);
    v18 = *(_QWORD *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v8)
        goto LABEL_31;
      v18 = *(_QWORD *)(v32 + 8 * v11);
      if (!v18)
      {
        v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          v1 = v31;
          goto LABEL_33;
        }
        v18 = *(_QWORD *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            v11 = v19 + 1;
            if (__OFADD__(v19, 1))
              goto LABEL_39;
            if (v11 >= v8)
              goto LABEL_31;
            v18 = *(_QWORD *)(v32 + 8 * v11);
            ++v19;
            if (v18)
              goto LABEL_21;
          }
        }
        v11 = v19;
      }
    }
LABEL_21:
    v7 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v21 = *v20;
    v22 = v20[1];
    sub_19A991340();
    sub_19A990DA0();
    result = sub_19A991364();
    v23 = -1 << *(_BYTE *)(v4 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v21;
    v13[1] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  swift_release();
  v1 = v31;
  v17 = (_QWORD *)(v2 + 56);
LABEL_33:
  v30 = 1 << *(_BYTE *)(v2 + 32);
  if (v30 > 63)
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v17 = -1 << v30;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_37:
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_19A981A10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C30);
  v3 = sub_19A99113C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_19A991004();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_19A981CAC(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_19A991004();
  result = sub_19A9910D0();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_19A981D2C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_19A98174C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_19A982048();
      goto LABEL_22;
    }
    sub_19A98238C();
  }
  v11 = *v4;
  sub_19A991340();
  sub_19A990DA0();
  result = sub_19A991364();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_19A991298(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_19A9912D4();
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
          result = sub_19A991298();
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

void sub_19A981EC4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_19A981A10();
  }
  else
  {
    if (v7 > v6)
    {
      sub_19A9821E4();
      goto LABEL_14;
    }
    sub_19A982614();
  }
  v8 = *v3;
  v9 = sub_19A991004();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_19A991010();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_19A9912D4();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_19A991010();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_19A982048()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C38);
  v2 = *v0;
  v3 = sub_19A991130();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_19A9821E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C30);
  v2 = *v0;
  v3 = sub_19A991130();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19A98238C()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C38);
  v3 = sub_19A99113C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_32:
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
  result = swift_retain_n();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_30;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          result = swift_release_n();
          v1 = v0;
          goto LABEL_32;
        }
        v17 = *(_QWORD *)(v6 + 8 * v18);
        v11 = v18;
        if (!v17)
          break;
      }
    }
LABEL_20:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_19A991340();
    swift_bridgeObjectRetain();
    sub_19A990DA0();
    result = sub_19A991364();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_19A982614()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C30);
  v3 = sub_19A99113C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_19A991004();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_19A98288C(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_19A9911CC();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C30);
      v3 = sub_19A991154();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_19A9911CC();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x19AECD88C](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_19A991004();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_19A991010();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_19A991010();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_19A991004();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_19A991010();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_19A991010();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

id sub_19A982BE8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  objc_super v20;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = v5;
  v12 = MEMORY[0x1E0DEE9E8];
  v13 = MEMORY[0x1E0DEE9E8];
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0)
  {
    if (sub_19A9911CC())
      sub_19A98288C(MEMORY[0x1E0DEE9D8]);
    else
      v13 = MEMORY[0x1E0DEE9E8];
  }
  *(_QWORD *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchResults] = v13;
  *(_QWORD *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completions] = v12;
  *(_QWORD *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query] = 0;
  v14 = &v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate];
  v15 = sub_19A990ADC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(_QWORD *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery] = a1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue] = a2;
  v16 = &v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completion];
  *(_QWORD *)v16 = a3;
  *((_QWORD *)v16 + 1) = a4;
  v17 = a1;
  v18 = a2;
  swift_retain();

  v20.receiver = v11;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_init);
}

void sub_19A982D38(uint64_t a1)
{
  uint64_t v1;

  sub_19A97FBBC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_19A982D44(unint64_t a1)
{
  uint64_t v1;

  sub_19A97FEB8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroy_24Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_19A982D7C(void *a1)
{
  uint64_t v1;

  sub_19A980254(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_19A982D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A982DCC()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_19A982E00()
{
  uint64_t v0;

  sub_19A980DD8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_19A982E0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_19A990F44();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_19A981110(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_19A982EA0(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_19A9911CC();
    swift_bridgeObjectRelease();
  }
  sub_19A90A170(0, (unint64_t *)&qword_1EE3B6C20);
  sub_19A982FF8();
  result = sub_19A990F44();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_19A9911CC();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x19AECD88C](i, a1);
        sub_19A9812BC(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_19A9812BC(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_19A982FF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6C28;
  if (!qword_1EE3B6C28)
  {
    v1 = sub_19A90A170(255, (unint64_t *)&qword_1EE3B6C20);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6C28);
  }
  return result;
}

uint64_t sub_19A983050()
{
  return swift_release();
}

uint64_t logError(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19A9830D0(a1, a2, a3, MEMORY[0x1E0DF2280]);
}

uint64_t log(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19A98321C(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF2290]);
}

uint64_t logDebug(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19A98321C(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF2278]);
}

uint64_t logInfo(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19A98321C(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF2270]);
}

uint64_t logError(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19A98321C(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF2280]);
}

uint64_t logFault(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19A9830D0(a1, a2, a3, MEMORY[0x1E0DF2288]);
}

uint64_t sub_19A9830D0(NSObject **a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t result;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  v7 = a4();
  result = os_log_type_enabled(v6, v7);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n();
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(a2, a3, &v11);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v10, -1, -1);
    return MEMORY[0x19AECE318](v9, -1, -1);
  }
  return result;
}

uint64_t logFault(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19A98321C(a1, a2, a3, a4, a5, MEMORY[0x1E0DF2288]);
}

uint64_t sub_19A98321C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  uint64_t v7;

  a6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D1B0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19A99A9B0;
  *(_QWORD *)(v7 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03CFB8);
  *(_QWORD *)(v7 + 64) = sub_19A9832DC();
  *(_QWORD *)(v7 + 32) = a5;
  swift_bridgeObjectRetain();
  sub_19A990B78();
  return swift_bridgeObjectRelease();
}

unint64_t sub_19A9832DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED03CFC0;
  if (!qword_1ED03CFC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED03CFB8);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0CB1B18], v1);
    atomic_store(result, (unint64_t *)&qword_1ED03CFC0);
  }
  return result;
}

id static TPSLogger.default.getter()
{
  return sub_19A9834E8(&qword_1ED03D5E8, (id *)&qword_1ED03D5F0);
}

id static TPSLogger.analytics.getter()
{
  return sub_19A9834E8(&qword_1ED03D590, (id *)&qword_1ED03D598);
}

id static TPSLogger.daemon.getter()
{
  return sub_19A9834E8(&qword_1ED03CFD8, (id *)&qword_1ED03CFD0);
}

id static TPSLogger.data.getter()
{
  return sub_19A9834E8(&qword_1ED03D5D0, (id *)&qword_1ED03D5D8);
}

id static TPSLogger.discoverability.getter()
{
  return sub_19A9834E8(&qword_1ED03CFC8, (id *)&qword_1ED03CFB0);
}

id static TPSLogger.targeting.getter()
{
  return sub_19A9834E8(qword_1ED03CFF0, qword_1ED03CFE0);
}

id static TPSLogger.tipkit.getter()
{
  return sub_19A9834E8(&qword_1ED03D588, qword_1ED03D578);
}

id static TPSLogger.welcome.getter()
{
  return sub_19A9834E8(&qword_1ED03D190, qword_1ED03D180);
}

id static TPSLogger.widget.getter()
{
  return sub_19A9834E8(&qword_1ED03D198, qword_1ED03D1A0);
}

id static TPSLogger.indexing.getter()
{
  return sub_19A9834E8(&qword_1ED03D170, (id *)&qword_1ED03D168);
}

id static TPSLogger.search.getter()
{
  return sub_19A9834E8(&qword_1EE3B6098, (id *)&qword_1EE3B6508);
}

id sub_19A9834E8(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id TPSLogger.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TPSLogger.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSLogger();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for TPSLogger()
{
  return objc_opt_self();
}

id TPSLogger.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSLogger();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_19A983684()
{
  unint64_t result;

  result = qword_1EE3B6C20;
  if (!qword_1EE3B6C20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3B6C20);
  }
  return result;
}

_QWORD *sub_19A9836C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C58);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_19A985350(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_19A983050();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_19A9837B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x1E0DEE9D8];
    v8 = v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        type metadata accessor for SearchResult.Item();
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C40);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_19A991208();
  __break(1u);
  return result;
}

_QWORD *sub_19A983934(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C40);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_19A985158((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_19A9911CC();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *sub_19A983A28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_19A985560((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_19A983050();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_19A983B0C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_19A9910E8();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x1E0DEE9D8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C40);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_19A98575C(&v8, v3 + 4, v2, a1);
  result = sub_19A983050();
  if (v6 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

uint64_t sub_19A983C04(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_19A985A58();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_19A983C7C(v6);
  return sub_19A99119C();
}

uint64_t sub_19A983C7C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double v16;
  double *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v29;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double v38;
  double *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double *v59;
  double v60;
  double *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double *v77;
  double v78;
  double *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  BOOL v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  int v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  char *v99;
  char *v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;
  char v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  BOOL v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  unint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  _QWORD *v163;
  _QWORD *v164;
  char *__dst;
  char *__dsta;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;

  v2 = v1;
  v4 = a1[1];
  result = sub_19A991274();
  v162 = (char *)v4;
  if (result >= v4)
  {
    if (v4 < 0)
      goto LABEL_211;
    if ((unint64_t)v4 < 2)
      return result;
    v9 = (_QWORD *)*a1;
    v10 = -1;
    v11 = 1;
    v12 = v9;
    while (1)
    {
      v163 = v12;
      __dsta = (char *)v11;
      v13 = v9[v11];
      v167 = v10;
      do
      {
        v14 = *v12;
        v15 = (double *)(v13 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        v16 = *v15;
        v17 = (double *)(v14 + OBJC_IVAR___TPSSearchResultItem_relevance);
        result = swift_beginAccess();
        if (v16 == *v17)
        {
          v18 = (uint64_t *)(v13 + OBJC_IVAR___TPSSearchResultItem_title);
          swift_beginAccess();
          v19 = v18[1];
          if (v19
            && (v20 = *v18,
                v21 = (_QWORD *)(v14 + OBJC_IVAR___TPSSearchResultItem_title),
                result = swift_beginAccess(),
                (v22 = v21[1]) != 0))
          {
            if (v20 == *v21 && v19 == v22)
              break;
          }
          else
          {
            v24 = (uint64_t *)(v13 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            v25 = *v24;
            v26 = v24[1];
            v27 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            result = *v27;
            if (*v27 == v25 && v27[1] == v26)
              break;
          }
          result = sub_19A991298();
          if ((result & 1) == 0)
            break;
        }
        else if (*v17 >= v16)
        {
          break;
        }
        if (!v9)
          goto LABEL_215;
        v29 = *v12;
        v13 = v12[1];
        *v12 = v13;
        v12[1] = v29;
        --v12;
      }
      while (!__CFADD__(v10++, 1));
      v11 = (uint64_t)(__dsta + 1);
      v12 = v163 + 1;
      v10 = v167 - 1;
      if (__dsta + 1 == v162)
        return result;
    }
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_220;
  v159 = result;
  v157 = a1;
  if (v4 < 2)
  {
    v31 = (char *)MEMORY[0x1E0DEE9D8];
    v169 = MEMORY[0x1E0DEE9D8];
    __dst = (char *)((MEMORY[0x1E0DEE9D8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      v33 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_176:
      v150 = v31;
      if (v33 >= 2)
      {
        v151 = *v157;
        do
        {
          v152 = v33 - 2;
          if (v33 < 2)
            goto LABEL_206;
          if (!v151)
            goto LABEL_219;
          v153 = *(_QWORD *)&v150[16 * v152 + 32];
          v154 = *(_QWORD *)&v150[16 * v33 + 24];
          sub_19A9848DC((char *)(v151 + 8 * v153), (char *)(v151 + 8 * *(_QWORD *)&v150[16 * v33 + 16]), v151 + 8 * v154, __dst);
          if (v2)
            break;
          if (v154 < v153)
            goto LABEL_207;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v150 = sub_19A985050((uint64_t)v150);
          if (v152 >= *((_QWORD *)v150 + 2))
            goto LABEL_208;
          v155 = &v150[16 * v152 + 32];
          *(_QWORD *)v155 = v153;
          *((_QWORD *)v155 + 1) = v154;
          v156 = *((_QWORD *)v150 + 2);
          if (v33 > v156)
            goto LABEL_209;
          memmove(&v150[16 * v33 + 16], &v150[16 * v33 + 32], 16 * (v156 - v33));
          *((_QWORD *)v150 + 2) = v156 - 1;
          v33 = v156 - 1;
        }
        while (v156 > 2);
      }
LABEL_187:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v169 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_19A990E54();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v7 = v6 >> 1;
    type metadata accessor for SearchResult.Item();
    v8 = sub_19A990E6C();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    __dst = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v169 = v8;
  }
  v32 = 0;
  v168 = *a1;
  v158 = *a1 - 8;
  v31 = (char *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v34 = v32++;
    v161 = v34;
    if (v32 >= v4)
    {
LABEL_53:
      if (v32 < v4)
        goto LABEL_54;
      goto LABEL_126;
    }
    v35 = *(_QWORD *)(v168 + 8 * v32);
    v36 = *(_QWORD *)(v168 + 8 * v34);
    v37 = (double *)(v35 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    v38 = *v37;
    v39 = (double *)(v36 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    if (v38 == *v39)
      break;
    v51 = *v39 < v38;
LABEL_51:
    v34 = v161;
    v4 = (uint64_t)v162;
    v52 = v161 + 2;
    if (v161 + 2 < (uint64_t)v162)
      goto LABEL_88;
    v32 = v161 + 2;
    if ((v51 & 1) == 0)
      goto LABEL_53;
LABEL_115:
    if (v52 < v34)
      goto LABEL_214;
LABEL_116:
    if (v34 >= v52)
    {
LABEL_123:
      v32 = v52;
      if (v52 < v4)
        goto LABEL_54;
      goto LABEL_126;
    }
    v92 = (uint64_t *)(v158 + 8 * v52);
    v93 = v52;
    v94 = v34;
    v95 = (uint64_t *)(v168 + 8 * v34);
    do
    {
      if (v94 != --v93)
      {
        if (!v168)
          goto LABEL_218;
        v96 = *v95;
        *v95 = *v92;
        *v92 = v96;
      }
      ++v94;
      --v92;
      ++v95;
    }
    while (v94 < v93);
    v32 = v52;
    v34 = v161;
    if (v52 < v4)
    {
LABEL_54:
      if (__OFSUB__(v32, v34))
        goto LABEL_210;
      v53 = v168;
      if (v32 - v34 >= v159)
      {
LABEL_112:
        v34 = v161;
      }
      else
      {
        v34 = v161;
        if (__OFADD__(v161, v159))
          goto LABEL_212;
        if (v161 + v159 >= v4)
          v54 = v4;
        else
          v54 = v161 + v159;
        if (v54 < v161)
        {
LABEL_213:
          __break(1u);
          goto LABEL_214;
        }
        if (v32 != v54)
        {
          v55 = (_QWORD *)(v158 + 8 * v32);
          v160 = v54;
          while (1)
          {
            v56 = *(_QWORD *)(v53 + 8 * v32);
            v57 = v161;
            v164 = v55;
            while (1)
            {
              v58 = *v55;
              v59 = (double *)(v56 + OBJC_IVAR___TPSSearchResultItem_relevance);
              swift_beginAccess();
              v60 = *v59;
              v61 = (double *)(v58 + OBJC_IVAR___TPSSearchResultItem_relevance);
              swift_beginAccess();
              if (v60 != *v61)
              {
                if (*v61 >= v60)
                  goto LABEL_64;
                goto LABEL_82;
              }
              v62 = (uint64_t *)(v56 + OBJC_IVAR___TPSSearchResultItem_title);
              swift_beginAccess();
              v63 = v62[1];
              if (v63)
              {
                v64 = *v62;
                v65 = (_QWORD *)(v58 + OBJC_IVAR___TPSSearchResultItem_title);
                swift_beginAccess();
                v66 = v65[1];
                if (v66)
                  break;
              }
              v68 = (uint64_t *)(v56 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
              swift_beginAccess();
              v69 = *v68;
              v70 = v68[1];
              v71 = (_QWORD *)(v58 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
              swift_beginAccess();
              if (*v71 == v69 && v71[1] == v70)
              {
                v53 = v168;
                goto LABEL_64;
              }
              v53 = v168;
              if ((sub_19A991298() & 1) == 0)
                goto LABEL_64;
LABEL_82:
              if (!v53)
                goto LABEL_216;
              v73 = *v55;
              v56 = v55[1];
              *v55 = v56;
              v55[1] = v73;
              --v55;
              if (v32 == ++v57)
                goto LABEL_64;
            }
            if (v64 != *v65 || v63 != v66)
              break;
            v53 = v168;
LABEL_64:
            ++v32;
            v55 = v164 + 1;
            if (v32 == v160)
            {
              v32 = v160;
              goto LABEL_112;
            }
          }
          v53 = v168;
          if ((sub_19A991298() & 1) == 0)
            goto LABEL_64;
          goto LABEL_82;
        }
      }
    }
LABEL_126:
    if (v32 < v34)
      goto LABEL_205;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v31 = sub_19A984DF4(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
    v98 = *((_QWORD *)v31 + 2);
    v97 = *((_QWORD *)v31 + 3);
    v33 = v98 + 1;
    if (v98 >= v97 >> 1)
      v31 = sub_19A984DF4((char *)(v97 > 1), v98 + 1, 1, v31);
    *((_QWORD *)v31 + 2) = v33;
    v99 = v31 + 32;
    v100 = &v31[16 * v98 + 32];
    *(_QWORD *)v100 = v161;
    *((_QWORD *)v100 + 1) = v32;
    if (v98)
    {
      while (1)
      {
        v101 = v33 - 1;
        if (v33 >= 4)
        {
          v106 = &v99[16 * v33];
          v107 = *((_QWORD *)v106 - 8);
          v108 = *((_QWORD *)v106 - 7);
          v112 = __OFSUB__(v108, v107);
          v109 = v108 - v107;
          if (v112)
            goto LABEL_194;
          v111 = *((_QWORD *)v106 - 6);
          v110 = *((_QWORD *)v106 - 5);
          v112 = __OFSUB__(v110, v111);
          v104 = v110 - v111;
          v105 = v112;
          if (v112)
            goto LABEL_195;
          v113 = v33 - 2;
          v114 = &v99[16 * v33 - 32];
          v116 = *(_QWORD *)v114;
          v115 = *((_QWORD *)v114 + 1);
          v112 = __OFSUB__(v115, v116);
          v117 = v115 - v116;
          if (v112)
            goto LABEL_197;
          v112 = __OFADD__(v104, v117);
          v118 = v104 + v117;
          if (v112)
            goto LABEL_200;
          if (v118 >= v109)
          {
            v136 = &v99[16 * v101];
            v138 = *(_QWORD *)v136;
            v137 = *((_QWORD *)v136 + 1);
            v112 = __OFSUB__(v137, v138);
            v139 = v137 - v138;
            if (v112)
              goto LABEL_204;
            v129 = v104 < v139;
            goto LABEL_163;
          }
        }
        else
        {
          if (v33 != 3)
          {
            v130 = *((_QWORD *)v31 + 4);
            v131 = *((_QWORD *)v31 + 5);
            v112 = __OFSUB__(v131, v130);
            v123 = v131 - v130;
            v124 = v112;
            goto LABEL_157;
          }
          v103 = *((_QWORD *)v31 + 4);
          v102 = *((_QWORD *)v31 + 5);
          v112 = __OFSUB__(v102, v103);
          v104 = v102 - v103;
          v105 = v112;
        }
        if ((v105 & 1) != 0)
          goto LABEL_196;
        v113 = v33 - 2;
        v119 = &v99[16 * v33 - 32];
        v121 = *(_QWORD *)v119;
        v120 = *((_QWORD *)v119 + 1);
        v122 = __OFSUB__(v120, v121);
        v123 = v120 - v121;
        v124 = v122;
        if (v122)
          goto LABEL_199;
        v125 = &v99[16 * v101];
        v127 = *(_QWORD *)v125;
        v126 = *((_QWORD *)v125 + 1);
        v112 = __OFSUB__(v126, v127);
        v128 = v126 - v127;
        if (v112)
          goto LABEL_202;
        if (__OFADD__(v123, v128))
          goto LABEL_203;
        if (v123 + v128 >= v104)
        {
          v129 = v104 < v128;
LABEL_163:
          if (v129)
            v101 = v113;
          goto LABEL_165;
        }
LABEL_157:
        if ((v124 & 1) != 0)
          goto LABEL_198;
        v132 = &v99[16 * v101];
        v134 = *(_QWORD *)v132;
        v133 = *((_QWORD *)v132 + 1);
        v112 = __OFSUB__(v133, v134);
        v135 = v133 - v134;
        if (v112)
          goto LABEL_201;
        if (v135 < v123)
          goto LABEL_35;
LABEL_165:
        v140 = v101 - 1;
        if (v101 - 1 >= v33)
        {
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
LABEL_207:
          __break(1u);
LABEL_208:
          __break(1u);
LABEL_209:
          __break(1u);
LABEL_210:
          __break(1u);
LABEL_211:
          __break(1u);
LABEL_212:
          __break(1u);
          goto LABEL_213;
        }
        if (!v168)
          goto LABEL_217;
        v141 = v32;
        v142 = v31;
        v143 = &v99[16 * v140];
        v144 = v99;
        v145 = *(_QWORD *)v143;
        v146 = v144;
        v147 = &v144[16 * v101];
        v148 = *((_QWORD *)v147 + 1);
        sub_19A9848DC((char *)(v168 + 8 * *(_QWORD *)v143), (char *)(v168 + 8 * *(_QWORD *)v147), v168 + 8 * v148, __dst);
        if (v1)
          goto LABEL_187;
        if (v148 < v145)
          goto LABEL_191;
        if (v101 > *((_QWORD *)v142 + 2))
          goto LABEL_192;
        *(_QWORD *)v143 = v145;
        *(_QWORD *)&v146[16 * v140 + 8] = v148;
        v149 = *((_QWORD *)v142 + 2);
        if (v101 >= v149)
          goto LABEL_193;
        v99 = v146;
        v31 = v142;
        v33 = v149 - 1;
        memmove(v147, v147 + 16, 16 * (v149 - 1 - v101));
        *((_QWORD *)v142 + 2) = v149 - 1;
        v32 = v141;
        if (v149 <= 2)
          goto LABEL_35;
      }
    }
    v33 = 1;
LABEL_35:
    v4 = (uint64_t)v162;
    if (v32 >= (uint64_t)v162)
    {
      v2 = v1;
      goto LABEL_176;
    }
  }
  v40 = (uint64_t *)(v35 + OBJC_IVAR___TPSSearchResultItem_title);
  swift_beginAccess();
  v41 = v40[1];
  if (v41)
  {
    v42 = *v40;
    v43 = (_QWORD *)(v36 + OBJC_IVAR___TPSSearchResultItem_title);
    swift_beginAccess();
    v44 = v43[1];
    if (v44)
    {
      if (v42 == *v43 && v41 == v44)
        goto LABEL_86;
      goto LABEL_49;
    }
  }
  v46 = (uint64_t *)(v35 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  swift_beginAccess();
  v47 = *v46;
  v48 = v46[1];
  v49 = (_QWORD *)(v36 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  swift_beginAccess();
  if (*v49 != v47 || v49[1] != v48)
  {
LABEL_49:
    v51 = sub_19A991298();
    goto LABEL_51;
  }
LABEL_86:
  v34 = v161;
  v4 = (uint64_t)v162;
  v52 = v161 + 2;
  if (v161 + 2 >= (uint64_t)v162)
    goto LABEL_123;
  v51 = 0;
LABEL_88:
  v74 = v52;
  while (2)
  {
    v52 = v74;
    v75 = *(_QWORD *)(v168 + 8 * v74);
    v76 = *(_QWORD *)(v168 + 8 * v32);
    v77 = (double *)(v75 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    v78 = *v77;
    v79 = (double *)(v76 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    if (v78 != *v79)
    {
      v91 = *v79 < v78;
LABEL_106:
      v4 = (uint64_t)v162;
      if (((v51 ^ v91) & 1) != 0)
        goto LABEL_114;
LABEL_90:
      v74 = v52 + 1;
      v32 = v52;
      if (v52 + 1 >= v4)
      {
        ++v52;
LABEL_114:
        v34 = v161;
        v32 = v52;
        if ((v51 & 1) == 0)
          goto LABEL_53;
        goto LABEL_115;
      }
      continue;
    }
    break;
  }
  v80 = (uint64_t *)(v75 + OBJC_IVAR___TPSSearchResultItem_title);
  swift_beginAccess();
  v81 = v80[1];
  if (!v81
    || (v82 = *v80,
        v83 = (_QWORD *)(v76 + OBJC_IVAR___TPSSearchResultItem_title),
        swift_beginAccess(),
        (v84 = v83[1]) == 0))
  {
    v86 = (uint64_t *)(v75 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
    swift_beginAccess();
    v87 = *v86;
    v88 = v86[1];
    v89 = (_QWORD *)(v76 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
    swift_beginAccess();
    if (*v89 == v87 && v89[1] == v88)
    {
      v4 = (uint64_t)v162;
      if ((v51 & 1) != 0)
        goto LABEL_109;
      goto LABEL_90;
    }
    v91 = sub_19A991298();
    goto LABEL_106;
  }
  v85 = v82 == *v83 && v81 == v84;
  v4 = (uint64_t)v162;
  if (!v85)
  {
    if (((v51 ^ sub_19A991298()) & 1) != 0)
      goto LABEL_114;
    goto LABEL_90;
  }
  if ((v51 & 1) == 0)
    goto LABEL_90;
LABEL_109:
  v34 = v161;
  if (v52 >= v161)
    goto LABEL_116;
LABEL_214:
  __break(1u);
LABEL_215:
  __break(1u);
LABEL_216:
  __break(1u);
LABEL_217:
  __break(1u);
LABEL_218:
  __break(1u);
LABEL_219:
  __break(1u);
LABEL_220:
  result = sub_19A9911B4();
  __break(1u);
  return result;
}

uint64_t sub_19A9848DC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  double v17;
  double *v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  double v40;
  double *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  BOOL v47;
  char *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  BOOL v53;
  uint64_t result;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v60;
  char *v61;
  char *v62;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = a2 - __src;
  v8 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v8 = a2 - __src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v61 = __dst;
  v62 = __src;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_69;
    if (__dst != a2 || &a2[8 * v12] <= __dst)
      memmove(__dst, a2, 8 * v12);
    v33 = &v4[8 * v12];
    v60 = v33;
    v62 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_68:
      sub_19A984FA8((void **)&v62, (const void **)&v61, &v60);
      return 1;
    }
    v34 = (char *)(a3 - 8);
    v35 = v5;
    v55 = v6;
    v56 = v4;
    while (1)
    {
      v58 = v34 + 8;
      v36 = *((_QWORD *)v33 - 1);
      v38 = *((_QWORD *)v35 - 1);
      v35 -= 8;
      v37 = v38;
      v39 = (double *)(v36 + OBJC_IVAR___TPSSearchResultItem_relevance);
      swift_beginAccess();
      v40 = *v39;
      v41 = (double *)(v38 + OBJC_IVAR___TPSSearchResultItem_relevance);
      swift_beginAccess();
      if (v40 == *v41)
      {
        v42 = (uint64_t *)(v36 + OBJC_IVAR___TPSSearchResultItem_title);
        swift_beginAccess();
        v43 = v42[1];
        if (v43
          && (v44 = *v42,
              v45 = (_QWORD *)(v37 + OBJC_IVAR___TPSSearchResultItem_title),
              swift_beginAccess(),
              (v46 = v45[1]) != 0))
        {
          v47 = v44 == *v45 && v43 == v46;
          v6 = v55;
          v48 = v56;
          if (v47)
            goto LABEL_56;
        }
        else
        {
          v49 = (uint64_t *)(v36 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
          swift_beginAccess();
          v50 = *v49;
          v51 = v49[1];
          v52 = (_QWORD *)(v37 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
          swift_beginAccess();
          v53 = *v52 == v50 && v52[1] == v51;
          v6 = v55;
          v48 = v56;
          if (v53)
          {
LABEL_56:
            v60 = v33 - 8;
            if (v58 < v33 || v34 >= v33 || v58 != v33)
              *(_QWORD *)v34 = *((_QWORD *)v33 - 1);
            v35 = v5;
            v33 -= 8;
            if (v5 <= v6)
              goto LABEL_68;
            goto LABEL_67;
          }
        }
        if ((sub_19A991298() & 1) == 0)
          goto LABEL_56;
      }
      else
      {
        v48 = v56;
        if (*v41 >= v40)
          goto LABEL_56;
      }
      if (v58 != v5 || v34 >= v5)
        *(_QWORD *)v34 = *(_QWORD *)v35;
      v62 = v35;
      if (v35 <= v6)
        goto LABEL_68;
LABEL_67:
      v34 -= 8;
      v5 = v35;
      if (v33 <= v48)
        goto LABEL_68;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[8 * v9] <= __dst)
      memmove(__dst, __src, 8 * v9);
    v57 = &v4[8 * v9];
    v60 = v57;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      while (1)
      {
        v13 = v6;
        v14 = *(_QWORD *)v5;
        v15 = *(_QWORD *)v4;
        v16 = (double *)(*(_QWORD *)v5 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        v17 = *v16;
        v18 = (double *)(v15 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        if (v17 == *v18)
        {
          v19 = v5;
          v20 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_title);
          swift_beginAccess();
          v21 = v20[1];
          if (v21
            && (v22 = *v20,
                v23 = (_QWORD *)(v15 + OBJC_IVAR___TPSSearchResultItem_title),
                swift_beginAccess(),
                (v24 = v23[1]) != 0))
          {
            v25 = v22 == *v23 && v21 == v24;
            v5 = v19;
            if (v25)
              goto LABEL_25;
          }
          else
          {
            v26 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            v27 = *v26;
            v28 = v26[1];
            v29 = (_QWORD *)(v15 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            v30 = *v29 == v27 && v29[1] == v28;
            v5 = v19;
            if (v30)
              goto LABEL_25;
          }
          if ((sub_19A991298() & 1) != 0)
            goto LABEL_29;
        }
        else if (*v18 < v17)
        {
LABEL_29:
          v32 = v5 + 8;
          v31 = v13;
          if (v13 < v5 || v13 >= v32 || v13 != v5)
            *(_QWORD *)v13 = *(_QWORD *)v5;
          goto LABEL_33;
        }
LABEL_25:
        v31 = v13;
        if (v13 != v4)
          *(_QWORD *)v13 = *(_QWORD *)v4;
        v4 += 8;
        v61 = v4;
        v32 = v5;
LABEL_33:
        v6 = v31 + 8;
        if (v4 < v57)
        {
          v5 = v32;
          if ((unint64_t)v32 < a3)
            continue;
        }
        v62 = v6;
        goto LABEL_68;
      }
    }
    goto LABEL_68;
  }
LABEL_69:
  result = sub_19A991208();
  __break(1u);
  return result;
}

char *sub_19A984DF4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_19A984EEC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_19A991208();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
      return (char *)memmove(result, v3, 24 * v6);
  }
  return result;
}

char *sub_19A984FA8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_19A991208();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_19A985050(uint64_t a1)
{
  return sub_19A984DF4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*sub_19A985064(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_19A9850E4(v6, a2, a3);
  return sub_19A9850B8;
}

void sub_19A9850B8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_19A9850E4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x19AECD88C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_19A985150;
  }
  __break(1u);
  return result;
}

void sub_19A985150(id *a1)
{

}

uint64_t sub_19A985158(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_19A9911CC();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_19A9911CC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_19A986660();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6578);
          v12 = sub_19A985064(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SearchResult.Item();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_19A991208();
  __break(1u);
  return result;
}

_QWORD *sub_19A985350(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v22;
  id v23;
  uint64_t v24;

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
LABEL_39:
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
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v24 = -1 << *(_BYTE *)(a4 + 32);
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
    v22 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      v23 = v22;
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    result = v22;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_19A985560(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
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

_QWORD *sub_19A98575C(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_19A9910DC();
    sub_19A983684();
    sub_19A982FF8();
    result = (_QWORD *)sub_19A990F50();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (_QWORD *)v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_19A991100())
        goto LABEL_45;
      sub_19A983684();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_19A985A44(_QWORD *a1)
{
  return sub_19A98E60C(0, a1[2], 0, a1);
}

void sub_19A985A58()
{
  JUMPOUT(0x19AECD970);
}

char *sub_19A985A6C(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  objc_class *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t *v40;
  uint64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  objc_super v61;
  objc_super v62;

  v2 = objc_msgSend(a1, sel_attributeSet);
  v3 = objc_msgSend(v2, sel_contentType);

  if (v3)
  {
    v4 = sub_19A990D58();
    v6 = v5;

    if (v4 == 0xD000000000000014 && v6 == 0x800000019A9A0CF0 || (sub_19A991298() & 1) != 0)
    {
      v7 = objc_msgSend(a1, sel_uniqueIdentifier);
      sub_19A990D58();

      v8 = objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
      v9 = (char *)UserGuideTopic.init(searchableItemUniqueIdentifier:)();
      if (v9)
      {
        v10 = v9;
        v11 = &v9[OBJC_IVAR___TPSUserGuideTopic_topicId];
        swift_beginAccess();
        v12 = (char *)*((_QWORD *)v11 + 1);
        if (!v12)
        {

LABEL_28:
          swift_bridgeObjectRelease();
          return v12;
        }
        v13 = *(_QWORD *)v11;
        v14 = &v10[OBJC_IVAR___TPSUserGuideTopic_productId];
        swift_beginAccess();
        v16 = *(_QWORD *)v14;
        v15 = *((_QWORD *)v14 + 1);
        v17 = (objc_class *)type metadata accessor for SearchResult.Item();
        v18 = (char *)objc_allocWithZone(v17);
        v19 = &v18[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
        *(_QWORD *)v19 = 0;
        *((_QWORD *)v19 + 1) = 0;
        v20 = &v18[OBJC_IVAR___TPSSearchResultItem_contentType];
        *(_QWORD *)v20 = 0;
        *((_QWORD *)v20 + 1) = 0;
        v21 = &v18[OBJC_IVAR___TPSSearchResultItem_title];
        *(_QWORD *)v21 = 0;
        *((_QWORD *)v21 + 1) = 0;
        v22 = &v18[OBJC_IVAR___TPSSearchResultItem_body];
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
        *(_QWORD *)&v18[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
        v23 = &v18[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
        *(_QWORD *)v23 = v13;
        *((_QWORD *)v23 + 1) = v12;
        v24 = &v18[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
        *(_QWORD *)v24 = v16;
        *((_QWORD *)v24 + 1) = v15;
        v61.receiver = v18;
        v61.super_class = v17;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v12 = (char *)objc_msgSendSuper2(&v61, sel_init);

LABEL_21:
        v47 = objc_msgSend(a1, sel_attributeSet, v61.receiver, v61.super_class);
        v48 = objc_msgSend(v47, sel_displayName);

        if (v48)
        {
          v49 = sub_19A990D58();
          v51 = v50;

        }
        else
        {
          v49 = 0;
          v51 = 0;
        }
        v52 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_title];
        swift_beginAccess();
        *v52 = v49;
        v52[1] = v51;
        swift_bridgeObjectRelease();
        v53 = objc_msgSend(a1, sel_attributeSet);
        v54 = objc_msgSend(v53, sel_contentDescription);

        if (v54)
        {
          v55 = sub_19A990D58();
          v57 = v56;

        }
        else
        {
          v55 = 0;
          v57 = 0;
        }
        v58 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_body];
        swift_beginAccess();
        *v58 = v55;
        v58[1] = v57;
        swift_bridgeObjectRelease();
        v59 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_contentType];
        swift_beginAccess();
        *v59 = v4;
        v59[1] = v6;
        goto LABEL_28;
      }
LABEL_16:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  if (qword_1EE3B58D0 != -1)
  {
    swift_once();
    if (!v6)
      return 0;
    goto LABEL_11;
  }
  if (v6)
  {
LABEL_11:
    if (qword_1EE3B59A8 == v4 && v6 == unk_1EE3B59B0 || (sub_19A991298() & 1) != 0)
    {
      v25 = objc_msgSend(a1, sel_uniqueIdentifier);
      v26 = sub_19A990D58();
      v28 = v27;

      v29 = objc_msgSend(a1, sel_domainIdentifier);
      if (v29)
      {
        v30 = v29;
        v31 = sub_19A990D58();
        v33 = v32;

      }
      else
      {
        v31 = 0;
        v33 = 0xE000000000000000;
      }
      v34 = (objc_class *)type metadata accessor for SearchResult.Item();
      v35 = (char *)objc_allocWithZone(v34);
      v36 = &v35[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
      *(_QWORD *)v36 = 0;
      *((_QWORD *)v36 + 1) = 0;
      v37 = &v35[OBJC_IVAR___TPSSearchResultItem_contentType];
      *(_QWORD *)v37 = 0;
      *((_QWORD *)v37 + 1) = 0;
      v38 = &v35[OBJC_IVAR___TPSSearchResultItem_title];
      *(_QWORD *)v38 = 0;
      *((_QWORD *)v38 + 1) = 0;
      v39 = &v35[OBJC_IVAR___TPSSearchResultItem_body];
      *(_QWORD *)v39 = 0;
      *((_QWORD *)v39 + 1) = 0;
      *(_QWORD *)&v35[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
      v40 = (uint64_t *)&v35[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
      *v40 = v26;
      v40[1] = v28;
      v41 = (uint64_t *)&v35[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
      *v41 = v31;
      v41[1] = v33;
      v62.receiver = v35;
      v62.super_class = v34;
      v12 = (char *)objc_msgSendSuper2(&v62, sel_init);
      v42 = objc_msgSend(a1, sel_attributeSet);
      v43 = CSSearchableItemAttributeSet.correlationIdentifier.getter();
      v45 = v44;

      v46 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
      swift_beginAccess();
      *v46 = v43;
      v46[1] = v45;

      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  return 0;
}

uint64_t sub_19A986000(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_19A9911CC();
  result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v9 = sub_19A9911CC();
    result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v8 = sub_19A9911CC();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    type metadata accessor for SearchResult.Item();
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      sub_19A991178();
      v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = sub_19A9911D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

id sub_19A986198(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char *v14;
  char *v15;
  id v16;
  double (*v17)(uint64_t);
  uint64_t v18;
  double v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  char *v32;
  uint64_t *v33;
  char *v34;
  char *v35;
  char *v36;
  id v37;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  _OWORD v42[2];
  uint64_t v43[4];
  objc_super v44;
  uint64_t v45;

  v6 = a2;
  v8 = MEMORY[0x1E0DEE9D8];
  v45 = MEMORY[0x1E0DEE9D8];
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0)
      v3 = a2;
    else
      v3 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v9 = sub_19A9911CC();
    if (v9)
      goto LABEL_3;
LABEL_30:
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0x8000000000000000) != 0)
      goto LABEL_42;
    goto LABEL_31;
  }
  v9 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
    goto LABEL_30;
LABEL_3:
  if ((uint64_t)v9 < 1)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v40 = a3;
  v10 = 0;
  v41 = &a1[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  v11 = *MEMORY[0x1E0CA6A78];
  do
  {
    if ((v6 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x19AECD88C](v10, v6);
    else
      v12 = *(id *)(v6 + 8 * v10 + 32);
    v13 = v12;
    v14 = sub_19A985A6C(v12);
    if (!v14)
    {

      goto LABEL_6;
    }
    v15 = v14;
    v16 = objc_msgSend(v13, sel_attributeSet);
    if (objc_msgSend(v16, sel_attributeForKey_, v11))
    {
      sub_19A9910A0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v42, 0, sizeof(v42));
    }
    sub_19A91E3C0((uint64_t)v42, (uint64_t)v43);
    if (v43[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {

        v17 = *(double (**)(uint64_t))v41;
        if (*(_QWORD *)v41)
        {
          v18 = swift_retain();
          v19 = v17(v18);
          sub_19A9642B0((uint64_t)v17);
          v20 = (double *)&v15[OBJC_IVAR___TPSSearchResultItem_relevance];
          swift_beginAccess();
          *v20 = v19;
        }

        goto LABEL_21;
      }
    }
    else
    {
      sub_19A91E1E0((uint64_t)v43);
    }

LABEL_21:
    MEMORY[0x19AECD52C]();
    if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_19A990E60();
    sub_19A990E78();
    sub_19A990E54();
LABEL_6:
    ++v10;
  }
  while (v9 != v10);
  swift_bridgeObjectRelease();
  v21 = v45;
  a3 = v40;
  v8 = MEMORY[0x1E0DEE9D8];
  if (v45 < 0)
  {
LABEL_42:
    v39 = swift_bridgeObjectRetain();
    v22 = (uint64_t)sub_19A983934(v39);
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
LABEL_31:
  if ((v21 & 0x4000000000000000) != 0)
    goto LABEL_42;
  v22 = v21 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
LABEL_33:
  v43[0] = v22;
  sub_19A983C04(v43);
  swift_bridgeObjectRelease();
  v23 = v43[0];
  v24 = (uint64_t *)&a1[OBJC_IVAR___TPSSearchQuery_maxCount];
  swift_beginAccess();
  v3 = sub_19A986000(*v24, v23);
  v4 = v25;
  v6 = v26;
  v9 = v27;
  swift_release();
  if ((v9 & 1) == 0)
  {
LABEL_34:
    v28 = sub_19A9837B4(v3, v4, v6, v9);
    goto LABEL_41;
  }
  sub_19A9912A4();
  swift_unknownObjectRetain_n();
  v29 = swift_dynamicCastClass();
  if (!v29)
  {
    swift_unknownObjectRelease();
    v29 = MEMORY[0x1E0DEE9D8];
  }
  v30 = *(_QWORD *)(v29 + 16);
  swift_release();
  if (__OFSUB__(v9 >> 1, v6))
    goto LABEL_44;
  if (v30 != (v9 >> 1) - v6)
  {
LABEL_45:
    swift_unknownObjectRelease();
    goto LABEL_34;
  }
  v28 = swift_dynamicCastClass();
  if (!v28)
  {
    swift_unknownObjectRelease();
    v28 = MEMORY[0x1E0DEE9D8];
  }
LABEL_41:
  swift_unknownObjectRelease();
  v31 = (objc_class *)type metadata accessor for SearchResult();
  v32 = (char *)objc_allocWithZone(v31);
  v33 = (uint64_t *)&v32[OBJC_IVAR___TPSSearchResult_items];
  *(_QWORD *)&v32[OBJC_IVAR___TPSSearchResult_items] = v8;
  v34 = &v32[OBJC_IVAR___TPSSearchResult_suggestions];
  *(_QWORD *)&v32[OBJC_IVAR___TPSSearchResult_suggestions] = v8;
  *(_QWORD *)&v32[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *v33 = v28;
  v35 = a1;
  swift_bridgeObjectRetain();
  v36 = v32;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v34 = a3;

  swift_bridgeObjectRelease();
  v44.receiver = v36;
  v44.super_class = v31;
  v37 = objc_msgSendSuper2(&v44, sel_init);

  return v37;
}

unint64_t sub_19A986660()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6C48;
  if (!qword_1EE3B6C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EE3B6578);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6C48);
  }
  return result;
}

uint64_t CSSearchableItemAttributeSet.relevanceScore.getter()
{
  void *v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_attributeForKey_, *MEMORY[0x1E0CA6A78]))
  {
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_19A91E3C0((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)v4);
    return 0;
  }
}

uint64_t CSSearchableItemAttributeSet.correlationIdentifier.getter()
{
  return sub_19A9867FC();
}

void CSSearchableItemAttributeSet.correlationIdentifier.setter(uint64_t a1, uint64_t a2)
{
  sub_19A986980(a1, a2, _sSo20CSCustomAttributeKeyC8TipsCoreE022correlationIDAttributeC0ABvgZ_0);
}

void (*CSSearchableItemAttributeSet.correlationIdentifier.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = CSSearchableItemAttributeSet.correlationIdentifier.getter();
  a1[1] = v3;
  return sub_19A9867D4;
}

void sub_19A9867D4(uint64_t a1, char a2)
{
  sub_19A986A40(a1, a2, _sSo20CSCustomAttributeKeyC8TipsCoreE022correlationIDAttributeC0ABvgZ_0);
}

uint64_t CSSearchableItemAttributeSet.collectionIdentifier.getter()
{
  return sub_19A9867FC();
}

uint64_t sub_19A9867FC()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  v1 = (void *)sub_19A990D34();
  v2 = objc_msgSend(v0, sel_attributeForKey_, v1);

  if (v2)
  {
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_19A91E3C0((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast())
      return v4;
    else
      return 0;
  }
  else
  {
    sub_19A91E1E0((uint64_t)v6);
    return 0;
  }
}

void sub_19A9868D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (*(_QWORD *)(a1 + 8))
  {
    v6 = *a2;
    swift_bridgeObjectRetain();
    v7 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v8 = v7;
    v9 = (id)a5();
    objc_msgSend(v6, sel_setValue_forCustomKey_, v8, v9);

  }
}

void CSSearchableItemAttributeSet.collectionIdentifier.setter(uint64_t a1, uint64_t a2)
{
  sub_19A986980(a1, a2, _sSo20CSCustomAttributeKeyC8TipsCoreE021collectionIDAttributeC0ABvgZ_0);
}

void sub_19A986980(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  void *v3;
  void *v5;
  id v6;
  id v7;

  if (a2)
  {
    v5 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v6 = v5;
    v7 = (id)a3();
    objc_msgSend(v3, sel_setValue_forCustomKey_, v6, v7);

  }
}

void (*CSSearchableItemAttributeSet.collectionIdentifier.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = CSSearchableItemAttributeSet.collectionIdentifier.getter();
  a1[1] = v3;
  return sub_19A986A34;
}

void sub_19A986A34(uint64_t a1, char a2)
{
  sub_19A986A40(a1, a2, _sSo20CSCustomAttributeKeyC8TipsCoreE021collectionIDAttributeC0ABvgZ_0);
}

void sub_19A986A40(uint64_t a1, char a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(void **)(a1 + 16);
      swift_bridgeObjectRetain();
      v6 = (void *)sub_19A990D34();
      swift_bridgeObjectRelease();
      v7 = v6;
      v8 = (void *)a3();
      objc_msgSend(v5, sel_setValue_forCustomKey_, v7, v8);

    }
    swift_bridgeObjectRelease();
  }
  else if (v4)
  {
    v9 = *(void **)(a1 + 16);
    v10 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v12 = v10;
    v11 = (void *)a3();
    objc_msgSend(v9, sel_setValue_forCustomKey_, v12, v11);

  }
}

unint64_t static CSCustomAttributeKey.correlationIDAttributeKeyName.getter()
{
  return 0xD000000000000024;
}

unint64_t static CSCustomAttributeKey.collectionIDAttributeKeyName.getter()
{
  return 0xD000000000000023;
}

uint64_t _sSo20CSCustomAttributeKeyC8TipsCoreE022correlationIDAttributeC0ABvgZ_0()
{
  id v0;
  void *v1;
  id v2;
  uint64_t result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CA6AC0]);
  v1 = (void *)sub_19A990D34();
  v2 = objc_msgSend(v0, sel_initWithKeyName_searchable_searchableByDefault_unique_multiValued_, v1, 0, 0, 0, 0);

  if (v2)
    return (uint64_t)v2;
  sub_19A991160();
  swift_bridgeObjectRelease();
  result = sub_19A9911C0();
  __break(1u);
  return result;
}

uint64_t _sSo20CSCustomAttributeKeyC8TipsCoreE021collectionIDAttributeC0ABvgZ_0()
{
  id v0;
  void *v1;
  id v2;
  uint64_t result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CA6AC0]);
  v1 = (void *)sub_19A990D34();
  v2 = objc_msgSend(v0, sel_initWithKeyName_searchable_searchableByDefault_unique_multiValued_, v1, 1, 0, 0, 0);

  if (v2)
    return (uint64_t)v2;
  sub_19A991160();
  swift_bridgeObjectRelease();
  result = sub_19A9911C0();
  __break(1u);
  return result;
}

uint64_t sub_19A986D80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CSSearchableItemAttributeSet.correlationIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_19A986DA8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_19A9868D0(a1, a2, a3, a4, _sSo20CSCustomAttributeKeyC8TipsCoreE022correlationIDAttributeC0ABvgZ_0);
}

uint64_t sub_19A986DC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CSSearchableItemAttributeSet.collectionIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_19A986DEC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_19A9868D0(a1, a2, a3, a4, _sSo20CSCustomAttributeKeyC8TipsCoreE021collectionIDAttributeC0ABvgZ_0);
}

void *static SearchQuery.MatchingStyle.allCases.getter()
{
  return &unk_1E395DB30;
}

unint64_t SearchQuery.MatchingStyle.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t sub_19A986E2C()
{
  return sub_19A99134C();
}

uint64_t *sub_19A986E58@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_19A986E74(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E395E0B0;
}

void *static SearchQuery.ContentTypeFilter.allCases.getter()
{
  return &unk_1E395E0E8;
}

uint64_t sub_19A986E94()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

uint64_t sub_19A986ED8()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

void sub_19A986F18(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E395E120;
}

BOOL static SearchQuery.QueryError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SearchQuery.QueryError.hash(into:)()
{
  return sub_19A99134C();
}

uint64_t SearchQuery.QueryError.hashValue.getter()
{
  sub_19A991340();
  sub_19A99134C();
  return sub_19A991364();
}

uint64_t SearchQuery.identifier.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchQuery_identifier);
}

uint64_t SearchQuery.identifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSSearchQuery_identifier);
}

uint64_t (*SearchQuery.identifier.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SearchQuery.searchTerm.getter()
{
  return sub_19A908FD4(&OBJC_IVAR___TPSSearchQuery_searchTerm);
}

uint64_t SearchQuery.searchTerm.setter(uint64_t a1, uint64_t a2)
{
  return sub_19A95A1F4(a1, a2, &OBJC_IVAR___TPSSearchQuery_searchTerm);
}

uint64_t (*SearchQuery.searchTerm.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.options.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSSearchQuery_options;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SearchQuery.options.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SearchQuery.options.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.matchingStyle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSSearchQuery_matchingStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SearchQuery.matchingStyle.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SearchQuery.matchingStyle.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.contentTypeFilter.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SearchQuery.contentTypeFilter.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SearchQuery.contentTypeFilter.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.maxCount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSSearchQuery_maxCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SearchQuery.maxCount.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSSearchQuery_maxCount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SearchQuery.maxCount.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.isCancelled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSSearchQuery_isCancelled);
  swift_beginAccess();
  return *v1;
}

double sub_19A987770(uint64_t a1, double a2)
{
  double (*v3)(uint64_t, double);
  uint64_t v4;
  double v5;

  v3 = *(double (**)(uint64_t, double))(a1 + 32);
  v4 = swift_retain();
  v5 = v3(v4, a2);
  swift_release();
  return v5;
}

id SearchQuery.__allocating_init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;

  v8 = v7;
  v32 = a6;
  v33 = a7;
  v30 = a4;
  v31 = a5;
  v29 = a3;
  v11 = sub_19A990B0C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)objc_allocWithZone(v8);
  v16 = (uint64_t *)&v15[OBJC_IVAR___TPSSearchQuery_identifier];
  v17 = v15;
  sub_19A990B00();
  v18 = sub_19A990AE8();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *v16 = v18;
  v16[1] = v20;
  v21 = &v17[OBJC_IVAR___TPSSearchQuery_searchTerm];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0xE000000000000000;
  v22 = &v17[OBJC_IVAR___TPSSearchQuery_options];
  *(_QWORD *)&v17[OBJC_IVAR___TPSSearchQuery_options] = 0;
  v23 = &v17[OBJC_IVAR___TPSSearchQuery_matchingStyle];
  *(_QWORD *)&v17[OBJC_IVAR___TPSSearchQuery_matchingStyle] = 0;
  v24 = &v17[OBJC_IVAR___TPSSearchQuery_contentTypeFilter];
  *(_QWORD *)&v17[OBJC_IVAR___TPSSearchQuery_contentTypeFilter] = 0;
  *(_QWORD *)&v17[OBJC_IVAR___TPSSearchQuery_maxCount] = 50;
  v17[OBJC_IVAR___TPSSearchQuery_isCancelled] = 0;
  v25 = &v17[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = 0;
  swift_beginAccess();
  *v16 = a1;
  v16[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v26 = v30;
  *(_QWORD *)v21 = v29;
  *((_QWORD *)v21 + 1) = v26;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v22 = v31;
  swift_beginAccess();
  *(_QWORD *)v23 = v32;
  swift_beginAccess();
  *(_QWORD *)v24 = v33;

  v34.receiver = v17;
  v34.super_class = v8;
  return objc_msgSendSuper2(&v34, sel_init);
}

id SearchQuery.init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *ObjectType;
  uint64_t v32;
  objc_super v33;

  v32 = a7;
  v29 = a5;
  v30 = a6;
  v28 = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = sub_19A990B0C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)&v7[OBJC_IVAR___TPSSearchQuery_identifier];
  v16 = v7;
  sub_19A990B00();
  v17 = sub_19A990AE8();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *v15 = v17;
  v15[1] = v19;
  v20 = &v16[OBJC_IVAR___TPSSearchQuery_searchTerm];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0xE000000000000000;
  v21 = &v16[OBJC_IVAR___TPSSearchQuery_options];
  *(_QWORD *)&v16[OBJC_IVAR___TPSSearchQuery_options] = 0;
  v22 = &v16[OBJC_IVAR___TPSSearchQuery_matchingStyle];
  *(_QWORD *)&v16[OBJC_IVAR___TPSSearchQuery_matchingStyle] = 0;
  v23 = &v16[OBJC_IVAR___TPSSearchQuery_contentTypeFilter];
  *(_QWORD *)&v16[OBJC_IVAR___TPSSearchQuery_contentTypeFilter] = 0;
  *(_QWORD *)&v16[OBJC_IVAR___TPSSearchQuery_maxCount] = 50;
  v16[OBJC_IVAR___TPSSearchQuery_isCancelled] = 0;
  v24 = &v16[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  *(_QWORD *)v24 = 0;
  *((_QWORD *)v24 + 1) = 0;
  swift_beginAccess();
  *v15 = a1;
  v15[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v25 = v28;
  *(_QWORD *)v20 = a3;
  *((_QWORD *)v20 + 1) = v25;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v21 = v29;
  swift_beginAccess();
  *(_QWORD *)v22 = v30;
  swift_beginAccess();
  *(_QWORD *)v23 = v32;

  v33.receiver = v16;
  v33.super_class = ObjectType;
  return objc_msgSendSuper2(&v33, sel_init);
}

id SearchQuery.__allocating_init(identifier:searchTerm:)()
{
  objc_class *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v2, v3, 0, 0, 0);

  return v4;
}

id SearchQuery.init(identifier:searchTerm:)()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v1, v2, 0, 0, 0);

  return v3;
}

uint64_t SearchQuery.description.getter()
{
  sub_19A991160();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  type metadata accessor for TPSSearchQueryOptions(0);
  sub_19A9911A8();
  sub_19A990DAC();
  swift_beginAccess();
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_beginAccess();
  sub_19A991280();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  return 0;
}

id SearchQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SearchQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static SearchQuery.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchQuery.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  void *v20;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  swift_beginAccess();
  v7 = (void *)sub_19A991040();
  v8 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v7, v8);

  v9 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  v10 = *v9;
  v11 = (void *)sub_19A990D34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v10, v11);

  v12 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  v13 = *v12;
  v14 = (void *)sub_19A990D34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v13, v14);

  v15 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  v16 = *v15;
  v17 = (void *)sub_19A990D34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v16, v17);

  v18 = (unsigned __int8 *)(v1 + OBJC_IVAR___TPSSearchQuery_isCancelled);
  swift_beginAccess();
  v19 = *v18;
  v20 = (void *)sub_19A990D34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v19, v20);

}

id SearchQuery.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

char *SearchQuery.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  char *v18;
  char *v19;
  unsigned __int8 *v20;

  v2 = v1;
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v4 = sub_19A990FEC();
  if (!v4)
    goto LABEL_12;
  v5 = (void *)v4;
  v6 = sub_19A990FEC();
  if (!v6)
  {

    a1 = v5;
LABEL_12:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v7 = (void *)v6;
  sub_19A90A170(0, &qword_1EE3B68A8);
  v8 = (void *)sub_19A990FEC();
  if (v8)
  {
    sub_19A99104C();

    v8 = 0;
  }
  v9 = (void *)sub_19A990D34();
  v10 = objc_msgSend(a1, sel_decodeIntegerForKey_, v9);

  if (v10 == (id)2)
    v11 = 2;
  else
    v11 = v10 == (id)1;
  v12 = (void *)sub_19A990D34();
  v13 = (unint64_t)objc_msgSend(a1, sel_decodeIntegerForKey_, v12);

  if (v13 != 2)
    v13 = v13 == 1;
  v14 = (void *)sub_19A990D34();
  v15 = objc_msgSend(a1, sel_decodeIntegerForKey_, v14);

  v16 = (void *)sub_19A990D34();
  v17 = objc_msgSend(a1, sel_decodeBoolForKey_, v16);

  v18 = (char *)objc_msgSend(v2, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v5, v7, v8, v11, v13);
  v19 = &v18[OBJC_IVAR___TPSSearchQuery_maxCount];
  swift_beginAccess();
  *(_QWORD *)v19 = v15;
  v20 = (unsigned __int8 *)&v18[OBJC_IVAR___TPSSearchQuery_isCancelled];
  swift_beginAccess();
  *v20 = v17;
  return v18;
}

uint64_t SearchQuery.hash.getter()
{
  uint64_t v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = sub_19A990E00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SearchQuery.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v8;
  char *v10;
  _BYTE v11[24];
  uint64_t v12;

  swift_getObjectType();
  sub_19A91E378(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_19A91E1E0((uint64_t)v11);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    return v8 & 1;
  }
  v3 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_identifier);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  v6 = &v10[OBJC_IVAR___TPSSearchQuery_identifier];
  swift_beginAccess();
  if (v4 == *(_QWORD *)v6 && v5 == *((_QWORD *)v6 + 1))
  {

    v8 = 1;
  }
  else
  {
    v8 = sub_19A991298();

  }
  return v8 & 1;
}

unint64_t sub_19A988BF8()
{
  unint64_t result;

  result = qword_1EE3B6CA8;
  if (!qword_1EE3B6CA8)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for SearchQuery.MatchingStyle, &type metadata for SearchQuery.MatchingStyle);
    atomic_store(result, (unint64_t *)&qword_1EE3B6CA8);
  }
  return result;
}

uint64_t sub_19A988C3C()
{
  return sub_19A988CCC(&qword_1EE3B6CB0, &qword_1EE3B6CB8);
}

unint64_t sub_19A988C64()
{
  unint64_t result;

  result = qword_1EE3B6CC0;
  if (!qword_1EE3B6CC0)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for SearchQuery.ContentTypeFilter, &type metadata for SearchQuery.ContentTypeFilter);
    atomic_store(result, (unint64_t *)&qword_1EE3B6CC0);
  }
  return result;
}

uint64_t sub_19A988CA8()
{
  return sub_19A988CCC(&qword_1EE3B6CC8, &qword_1EE3B6CD0);
}

uint64_t sub_19A988CCC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF50], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_19A988D10()
{
  unint64_t result;

  result = qword_1EE3B6CD8;
  if (!qword_1EE3B6CD8)
  {
    result = MEMORY[0x19AECE27C](&protocol conformance descriptor for SearchQuery.QueryError, &type metadata for SearchQuery.QueryError);
    atomic_store(result, (unint64_t *)&qword_1EE3B6CD8);
  }
  return result;
}

uint64_t type metadata accessor for SearchQuery()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchQuery.__allocating_init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

ValueMetadata *type metadata accessor for SearchQuery.MatchingStyle()
{
  return &type metadata for SearchQuery.MatchingStyle;
}

ValueMetadata *type metadata accessor for SearchQuery.ContentTypeFilter()
{
  return &type metadata for SearchQuery.ContentTypeFilter;
}

uint64_t storeEnumTagSinglePayload for SearchQuery.QueryError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19A988DF4 + 4 * byte_19A99B435[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19A988E28 + 4 * byte_19A99B430[v4]))();
}

uint64_t sub_19A988E28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A988E30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19A988E38);
  return result;
}

uint64_t sub_19A988E44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19A988E4CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19A988E50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A988E58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchQuery.QueryError()
{
  return &type metadata for SearchQuery.QueryError;
}

uint64_t sub_19A988E74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_19A988E98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_19A988EB4()
{
  return _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0();
}

uint64_t sub_19A988EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D3E0);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = (uint64_t *)&unk_1EE3B6C40;
  else
    v2 = (uint64_t *)&unk_1ED03D3F8;
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

id _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0()
{
  id v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EE3CC800);
  sub_19A988EC8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19A99A940;
  *(_QWORD *)(inited + 32) = type metadata accessor for ResultContext();
  v2 = sub_19A90A170(0, (unint64_t *)&unk_1ED03D150);
  *(_QWORD *)(inited + 40) = v2;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited, (uint64_t)sel_findMatchingResultIdFromContexts_reply_, 0, 0);
  swift_setDeallocating();
  sub_19A988EC8();
  v3 = swift_initStackObject();
  *(_OWORD *)(v3 + 16) = xmmword_19A99A940;
  *(_QWORD *)(v3 + 32) = sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  *(_QWORD *)(v3 + 40) = v2;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v3, (uint64_t)sel_availableUserGuideIdentifiersWithReply_, 0, 1);
  swift_setDeallocating();
  sub_19A988EC8();
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19A99A9B0;
  *(_QWORD *)(v4 + 32) = sub_19A90A170(0, &qword_1EE3B6CE0);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v4, (uint64_t)sel_fetchDocumentWithIdentifier_reply_, 0, 1);
  swift_setDeallocating();
  return v0;
}

void sub_19A989088()
{
  id v0;
  __CFString *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0D02718]);
  v1 = CFSTR("FeatureDiscoverability");
  v2 = objc_msgSend(v0, sel_initWithUseCase_, v1);

  qword_1EE3B6CE8 = (uint64_t)v2;
}

void sub_19A9890E8()
{
  qword_1EE3B6CF0 = 0x292A28746E756F63;
  *(_QWORD *)algn_1EE3B6CF8 = 0xE800000000000000;
}

id TipsBiomeSQLQueryManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipsBiomeSQLQueryManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeSQLQueryManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipsBiomeSQLQueryManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeSQLQueryManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19A989220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25[2];
  _BYTE v26[32];
  __int128 v27;
  _OWORD v28[2];
  _QWORD v29[2];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a1;
  v32 = a2;
  v23 = a5 + 64;
  v6 = 1 << *(_BYTE *)(a5 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a5 + 64);
  v24 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v10 << 6);
LABEL_9:
      v13 = *(_QWORD *)(a5 + 56);
      v14 = (_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * v12);
      v15 = v14[1];
      *(_QWORD *)&v27 = *v14;
      *((_QWORD *)&v27 + 1) = v15;
      sub_19A91E8A8(v13 + 32 * v12, (uint64_t)v28);
      swift_bridgeObjectRetain();
      goto LABEL_28;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v16 < v24)
    {
      v17 = *(_QWORD *)(v23 + 8 * v16);
      if (v17)
        goto LABEL_13;
      v18 = v10 + 2;
      ++v10;
      if (v16 + 1 < v24)
      {
        v17 = *(_QWORD *)(v23 + 8 * v18);
        if (v17)
          goto LABEL_16;
        v10 = v16 + 1;
        if (v16 + 2 < v24)
        {
          v17 = *(_QWORD *)(v23 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_13;
          }
          v18 = v16 + 3;
          v10 = v16 + 2;
          if (v16 + 3 < v24)
            break;
        }
      }
    }
LABEL_27:
    v8 = 0;
    memset(v28, 0, sizeof(v28));
    v27 = 0u;
LABEL_28:
    sub_19A98A67C((uint64_t)&v27, (uint64_t)v29);
    if (!v29[1])
    {
      swift_release();
      return v31;
    }
    sub_19A959AA0(&v30, &v27);
    sub_19A91E8A8((uint64_t)&v27, (uint64_t)v26);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_19A991160();
      sub_19A990DAC();
      sub_19A990DAC();
      sub_19A990DAC();
      sub_19A990DAC();
      swift_bridgeObjectRelease();
      sub_19A990DAC();
      sub_19A9911A8();
      sub_19A990DAC();
LABEL_5:
      sub_19A990DAC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    if (swift_dynamicCast())
    {
      v25[0] = 0;
      v25[1] = 0xE000000000000000;
      sub_19A991160();
      sub_19A990DAC();
      sub_19A990DAC();
      sub_19A990DAC();
      sub_19A990DAC();
      swift_bridgeObjectRelease();
      sub_19A990DAC();
      sub_19A9911A8();
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    if (qword_1ED03D5E8 != -1)
      swift_once();
    v19 = (id)qword_1ED03D5F0;
    v20 = sub_19A990F98();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v25[0] = v22;
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)(v21 + 4) = sub_19A91E7D8(0xD00000000000002BLL, 0x800000019A9A1440, v25);
      _os_log_impl(&dword_19A906000, v19, v20, "%s", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AECE318](v22, -1, -1);
      MEMORY[0x19AECE318](v21, -1, -1);
    }

LABEL_6:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v27);
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  v17 = *(_QWORD *)(v23 + 8 * v18);
  if (v17)
  {
LABEL_16:
    v16 = v18;
LABEL_13:
    v8 = (v17 - 1) & v17;
    v12 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
    goto LABEL_9;
  }
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v24)
    {
      v10 = v24 - 1;
      goto LABEL_27;
    }
    v17 = *(_QWORD *)(v23 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_13;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_19A989778(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void (*v10)(char *, uint64_t);
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;
  __int128 v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  _OWORD *v53;
  int64_t v54;
  char *v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _BYTE v63[32];
  __int128 v64;
  _OWORD v65[2];
  uint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;

  v4 = sub_19A990ADC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    return;
  v8 = a2;
  v9 = objc_msgSend(v8, sel_startDate);
  sub_19A990AB8();

  sub_19A990AAC();
  v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v7, v4);
  v11 = objc_msgSend(v8, sel_endDate);
  sub_19A990AB8();

  sub_19A990AAC();
  v10(v7, v4);
  v66 = 0;
  v67 = 0xE000000000000000;
  sub_19A991160();
  sub_19A990DAC();
  v12 = objc_msgSend(a1, sel_stream);
  sub_19A990D58();

  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  sub_19A990F14();
  sub_19A990DAC();
  sub_19A990F14();
  sub_19A990DAC();
  v69 = v66;
  v70 = v67;
  v13 = objc_msgSend(a1, sel_filterParametersForBiomeQuery);
  if (!v13)
  {

    return;
  }
  v14 = v13;
  v15 = sub_19A990CC8();

  v56 = 0;
  v17 = *(_QWORD *)(v15 + 64);
  v52 = v15 + 64;
  v18 = 1 << *(_BYTE *)(v15 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v21 = (unint64_t)(v18 + 63) >> 6;
  v22 = v65;
  v55 = &v68;
  v47 = v21 - 1;
  *(_QWORD *)&v16 = 136315138;
  v49 = v16;
  v48 = 0x800000019A9A1410;
  v51 = v8;
  v50 = v15;
  v54 = v21;
  v53 = v65;
  while (1)
  {
    if (v20)
    {
      v26 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v27 = v26 | (v56 << 6);
LABEL_10:
      v28 = *(_QWORD *)(v15 + 56);
      v29 = (_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v27);
      v30 = v29[1];
      *(_QWORD *)&v64 = *v29;
      *((_QWORD *)&v64 + 1) = v30;
      sub_19A91E8A8(v28 + 32 * v27, (uint64_t)v22);
      swift_bridgeObjectRetain();
      goto LABEL_29;
    }
    v31 = v56 + 1;
    if (__OFADD__(v56, 1))
    {
      __break(1u);
      goto LABEL_61;
    }
    if (v31 < v21)
    {
      v32 = *(_QWORD *)(v52 + 8 * v31);
      if (v32)
        goto LABEL_14;
      v33 = v56 + 2;
      ++v56;
      if (v31 + 1 < v21)
      {
        v32 = *(_QWORD *)(v52 + 8 * v33);
        if (v32)
          goto LABEL_17;
        v56 = v31 + 1;
        if (v31 + 2 < v21)
        {
          v32 = *(_QWORD *)(v52 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_14;
          }
          v33 = v31 + 3;
          v56 = v31 + 2;
          if (v31 + 3 < v21)
            break;
        }
      }
    }
LABEL_28:
    v20 = 0;
    memset(v65, 0, sizeof(v65));
    v64 = 0u;
LABEL_29:
    sub_19A98A67C((uint64_t)&v64, (uint64_t)&v66);
    v34 = v67;
    if (!v67)
    {

      swift_release();
      return;
    }
    v57 = v66;
    sub_19A959AA0(v55, &v64);
    sub_19A91E8A8((uint64_t)&v64, (uint64_t)v63);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6D28);
    if (!swift_dynamicCast())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6D50);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_19A91E8A8((uint64_t)&v64, (uint64_t)&v58);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v23 = sub_19A989220(v69, v70, v57, v34, v62);
          v25 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
          v69 = v23;
          v70 = v25;
          goto LABEL_7;
        }
LABEL_48:
        swift_bridgeObjectRelease();
LABEL_49:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
        goto LABEL_7;
      }
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        v60 = 0;
        v61 = 0xE000000000000000;
        sub_19A990DAC();
        sub_19A990DAC();
        swift_bridgeObjectRelease();
        sub_19A990DAC();
        sub_19A9911A8();
        sub_19A990DAC();
      }
      else
      {
        if (!swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          if (qword_1ED03D5E8 != -1)
            swift_once();
          v43 = (id)qword_1ED03D5F0;
          v44 = sub_19A990F98();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = swift_slowAlloc();
            v46 = swift_slowAlloc();
            v58 = v46;
            *(_DWORD *)v45 = v49;
            *(_QWORD *)(v45 + 4) = sub_19A91E7D8(0xD000000000000024, v48, &v58);
            _os_log_impl(&dword_19A906000, v43, v44, "%s", (uint8_t *)v45, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x19AECE318](v46, -1, -1);
            MEMORY[0x19AECE318](v45, -1, -1);
          }

          goto LABEL_49;
        }
        v58 = 0;
        v59 = 0xE000000000000000;
        sub_19A990DAC();
        sub_19A990DAC();
        swift_bridgeObjectRelease();
        sub_19A990DAC();
        sub_19A9911A8();
      }
      sub_19A990DAC();
      goto LABEL_48;
    }
    swift_bridgeObjectRelease();
    sub_19A91E8A8((uint64_t)&v64, (uint64_t)&v58);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_48;
    v35 = *(_QWORD *)(v60 + 16);
    if (v35)
    {
      v36 = v60 + 32;
      swift_bridgeObjectRetain();
      v37 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      do
      {
        sub_19A91E8A8(v36, (uint64_t)&v58);
        v60 = 0;
        v61 = 0xE000000000000000;
        sub_19A9911A8();
        v38 = v60;
        v39 = v61;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v58);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v37 = sub_19A96A420(0, v37[2] + 1, 1, v37);
        v41 = v37[2];
        v40 = v37[3];
        if (v41 >= v40 >> 1)
          v37 = sub_19A96A420((_QWORD *)(v40 > 1), v41 + 1, 1, v37);
        v37[2] = v41 + 1;
        v42 = &v37[2 * v41];
        v42[4] = v38;
        v42[5] = v39;
        v36 += 32;
        --v35;
      }
      while (v35);
      swift_bridgeObjectRelease_n();
      v8 = v51;
      v15 = v50;
    }
    else
    {
      swift_bridgeObjectRelease();
      v37 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v58 = (uint64_t)v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
    sub_19A98A6C4();
    sub_19A990D04();
    swift_bridgeObjectRelease();
    v58 = 0;
    v59 = 0xE000000000000000;
    sub_19A991160();
    swift_bridgeObjectRelease();
    v58 = 0x20444E41200ALL;
    v59 = 0xE600000000000000;
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
    v21 = v54;
    v22 = v53;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
  }
  v32 = *(_QWORD *)(v52 + 8 * v33);
  if (v32)
  {
LABEL_17:
    v31 = v33;
LABEL_14:
    v20 = (v32 - 1) & v32;
    v27 = __clz(__rbit64(v32)) + (v31 << 6);
    v56 = v31;
    goto LABEL_10;
  }
  while (1)
  {
    v31 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v31 >= v21)
    {
      v56 = v47;
      goto LABEL_28;
    }
    v32 = *(_QWORD *)(v52 + 8 * v31);
    ++v33;
    if (v32)
      goto LABEL_14;
  }
LABEL_61:
  __break(1u);
}

uint64_t _s8TipsCore0A20BiomeSQLQueryManagerC14countsForEvent_8intervalSuSo013TPSContextualcH0C_So14NSDateIntervalCtFZ_0(void *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  char **v4;
  uint64_t v5;
  char **v6;
  _QWORD *v7;
  _QWORD *v8;
  id i;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  char **v19;
  char **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unsigned __int8 v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;

  sub_19A989778(a1, a2);
  if (!v2)
    return 0;
  if (qword_1EE3B6108 != -1)
    swift_once();
  v3 = (void *)sub_19A990F68();
  swift_bridgeObjectRelease();
  v4 = &selRef_storeCachedResponseData_forSessionTask_;
  v5 = 0;
  if (objc_msgSend(v3, sel_next))
  {
    v6 = &selRef_enumerateIndexesUsingBlock_;
    v7 = &qword_1ED03CFF0[2];
    v8 = qword_1ED03CFF0 + 16;
    v32 = v3;
    while (1)
    {
      for (i = objc_msgSend(v3, v6[6], v5); ; i = objc_msgSend(v3, v6[6], v31))
      {
        v10 = i;
        if (!v10)
          break;
        v11 = v10;
        if (v7[189] != -1)
          swift_once();
        v12 = (void *)v8[190];
        v34 = 0;
        v35 = 0xE000000000000000;
        v13 = v12;
        sub_19A991160();
        swift_bridgeObjectRelease();
        v34 = 0xD000000000000024;
        v35 = 0x800000019A9A1380;
        swift_getErrorValue();
        sub_19A991304();
        sub_19A990DAC();
        swift_bridgeObjectRelease();
        v15 = v34;
        v14 = v35;
        v16 = sub_19A990F98();
        if (os_log_type_enabled(v13, v16))
        {
          swift_bridgeObjectRetain_n();
          v17 = swift_slowAlloc();
          v18 = v7;
          v19 = v4;
          v20 = v6;
          v21 = swift_slowAlloc();
          v34 = v21;
          *(_DWORD *)v17 = 136315138;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v17 + 4) = sub_19A91E7D8(v15, v14, &v34);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19A906000, v13, v16, "%s", (uint8_t *)v17, 0xCu);
          swift_arrayDestroy();
          v22 = v21;
          v6 = v20;
          v4 = v19;
          v7 = v18;
          v3 = v32;
          MEMORY[0x19AECE318](v22, -1, -1);
          v23 = v17;
          v8 = &qword_1ED03CFF0[2];
          MEMORY[0x19AECE318](v23, -1, -1);
        }

        swift_bridgeObjectRelease();
LABEL_8:
        if ((objc_msgSend(v3, v4[418]) & 1) == 0)
        {
          v5 = v31;
          goto LABEL_30;
        }
      }
      v24 = objc_msgSend(v3, sel_row);
      if (!v24)
        goto LABEL_8;
      v25 = v24;
      v26 = sub_19A990CC8();

      if (qword_1EE3B6110 != -1)
        swift_once();
      v33 = qword_1EE3B6CF0;
      swift_bridgeObjectRetain();
      sub_19A991124();
      if (*(_QWORD *)(v26 + 16) && (v27 = sub_19A979C60((uint64_t)&v34), (v28 & 1) != 0))
      {
        sub_19A91E8A8(*(_QWORD *)(v26 + 56) + 32 * v27, (uint64_t)&v36);
      }
      else
      {
        v36 = 0u;
        v37 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_19A95BA78((uint64_t)&v34);
      if (!*((_QWORD *)&v37 + 1))
        break;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_8;
      v5 = v33;
      v29 = objc_msgSend(v3, v4[418]);
      if ((v29 & 1) == 0)
        goto LABEL_30;
    }
    sub_19A91E1E0((uint64_t)&v36);
    goto LABEL_8;
  }
LABEL_30:

  return v5;
}

uint64_t type metadata accessor for TipsBiomeSQLQueryManager()
{
  return objc_opt_self();
}

uint64_t sub_19A98A67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6DD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_19A98A6C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B6D30;
  if (!qword_1EE3B6D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED03D140);
    result = MEMORY[0x19AECE27C](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B6D30);
  }
  return result;
}

uint64_t ResultContext.resultId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_resultId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResultContext.contextData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  sub_19A98A784(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8));
  return v1;
}

uint64_t sub_19A98A784(uint64_t a1, unint64_t a2)
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

id ResultContext.__allocating_init(resultId:contextData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ResultContext.init(resultId:contextData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  char *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = &v4[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v4[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t ResultContext.conditions.getter()
{
  char v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  ResultContext.hasConditions.getter();
  if ((v0 & 1) == 0)
    return sub_19A958CA8(MEMORY[0x1E0DEE9D8]);
  v1 = (void *)objc_opt_self();
  v2 = (void *)sub_19A990A7C();
  v8[0] = 0;
  v3 = objc_msgSend(v1, sel_JSONObjectWithData_options_error_, v2, 0, v8);

  if (v3)
  {
    v4 = v8[0];
    sub_19A9910A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6D50);
    if (swift_dynamicCast())
      return v7;
    return sub_19A958CA8(MEMORY[0x1E0DEE9D8]);
  }
  v6 = v8[0];
  sub_19A9909BC();

  return swift_willThrow();
}

void ResultContext.hasConditions.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_19A98AA44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  char v7;

  if ((v1 & 0xFF000000000000) != 0)
  {
    v2 = sub_19A98AAC8(1819047278, 0xE400000000000000);
    v4 = v3;
    sub_19A98C0F0(v0, v1);
    v6 = v5;
    sub_19A96692C(v2, v4);
    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_19A98AAC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6D98);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_19A98C39C((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_19A991190();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_19A98C594(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_19A990DB8();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_19A98C5F8(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x1E0C80A78](*(_QWORD *)&v14[0]);
    sub_19A98BA6C();
    __asm { BR              X12 }
  }
  sub_19A98C6F0(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_0(v17, v17[3]);
  sub_19A990950();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t ResultContext.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  sub_19A991160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8);
  sub_19A98A784(v1, v2);
  sub_19A990A4C();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A96692C(v1, v2);
  return 0x6449746C75736572;
}

uint64_t ResultContext.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13[5];

  v13[4] = *(id *)MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v13[1] = (id)0xE000000000000000;
  sub_19A991160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8);
  sub_19A98A784(v1, v2);
  sub_19A990A4C();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A96692C(v1, v2);
  sub_19A990DAC();
  ResultContext.hasConditions.getter();
  if ((v3 & 1) == 0)
    goto LABEL_5;
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_19A990A7C();
  v13[0] = 0;
  v6 = objc_msgSend(v4, sel_JSONObjectWithData_options_error_, v5, 0, v13);

  if (!v6)
  {
    v9 = v13[0];
    v10 = (void *)sub_19A9909BC();

    swift_willThrow();
    v8 = 0;
    goto LABEL_7;
  }
  v7 = v13[0];
  sub_19A9910A0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6D50);
  if ((swift_dynamicCast() & 1) != 0)
    v8 = v12;
  else
LABEL_5:
    v8 = (void *)sub_19A958CA8(MEMORY[0x1E0DEE9D8]);
LABEL_7:
  v13[0] = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6D58);
  sub_19A990D7C();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  return 0x6449746C75736572;
}

id ResultContext.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ResultContext.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ResultContext.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ResultContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ResultContext.encode(with:)(NSCoder with)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)sub_19A990D34();
  v3 = (void *)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

  v4 = (void *)sub_19A990A7C();
  v5 = (id)sub_19A990D34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v4, v5);

}

id ResultContext.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ResultContext.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  objc_super v21;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_19A90A170(0, (unint64_t *)&qword_1ED03D3F0);
  v5 = v2;
  v6 = sub_19A990FEC();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  v8 = sub_19A990D58();
  v10 = v9;

  sub_19A90A170(0, &qword_1EE3B6D68);
  v11 = sub_19A990FEC();
  if (!v11)
  {
    swift_bridgeObjectRelease();
LABEL_5:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v12 = (void *)v11;
  v13 = sub_19A990A88();
  v15 = v14;

  v16 = (char *)objc_allocWithZone(ObjectType);
  v17 = (uint64_t *)&v16[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *v17 = v8;
  v17[1] = v10;
  v18 = (uint64_t *)&v16[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *v18 = v13;
  v18[1] = v15;
  v21.receiver = v16;
  v21.super_class = ObjectType;
  v19 = objc_msgSendSuper2(&v21, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v19;
}

void sub_19A98B78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_19A98B7EC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x19A98B9D0);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_19A98B9F4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_19A990DF4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x19AECD4D8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_19A98BA6C()
{
  __asm { BR              X11 }
}

_QWORD *sub_19A98BACC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_19A98BD5C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_19A98C3DC(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_19A98C49C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_19A98C514((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_19A98BDD0(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_19A98BE34(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_19A990914();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_19A990938();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_19A99092C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_19A98BEE0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_19A99116C();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
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

uint64_t sub_19A98BF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_19A98B78C((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_19A98C03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_19A990914();
  v11 = result;
  if (result)
  {
    result = sub_19A990938();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_19A99092C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_19A98B78C(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_19A98C0F0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_19A98C13C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_19A98C170 + *((int *)qword_19A98C348 + (v0 >> 62))))();
}

uint64_t sub_19A98C180@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t type metadata accessor for ResultContext()
{
  return objc_opt_self();
}

uint64_t method lookup function for ResultContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ResultContext.__allocating_init(resultId:contextData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_19A98C39C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6DA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19A98C3DC(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_19A98C49C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_19A990944();
  swift_allocObject();
  result = sub_19A990908();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_19A990A58();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_19A98C514(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_19A990944();
  swift_allocObject();
  result = sub_19A990908();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_19A98C594(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_19A98C3DC(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_19A98C49C((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_19A98C514((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_19A98C5F8(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_19A990944();
      swift_allocObject();
      sub_19A990920();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_19A990A58();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_19A98C694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_19A98BDD0((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_19A98C708, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_19A98C6F0(__int128 *a1, uint64_t a2)
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

uint64_t sub_19A98C708@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_19A98BEE0(a1, a2);
}

void *sub_19A98C724()
{
  void *result;

  result = (void *)sub_19A98C740();
  off_1EE3B6DB0 = result;
  return result;
}

unint64_t sub_19A98C740()
{
  id v0;
  uint64_t inited;
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  unint64_t v11;

  v0 = (id)BiomeLibrary();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6E00);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19A99A9A0;
  *(_QWORD *)(inited + 32) = sub_19A990D58();
  *(_QWORD *)(inited + 40) = v2;
  v3 = objc_msgSend(objc_msgSend(v0, sel_App), sel_InFocus);
  swift_unknownObjectRelease();
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = sub_19A990D58();
  *(_QWORD *)(inited + 64) = v4;
  v5 = objc_msgSend(objc_msgSend(v0, sel_Device), sel_Wireless);
  swift_unknownObjectRelease();
  v6 = objc_msgSend(v5, sel_Bluetooth);
  swift_unknownObjectRelease();
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 80) = sub_19A990D58();
  *(_QWORD *)(inited + 88) = v7;
  v8 = objc_msgSend(objc_msgSend(v0, sel_Discoverability), sel_Signals);
  swift_unknownObjectRelease();
  *(_QWORD *)(inited + 96) = v8;
  *(_QWORD *)(inited + 104) = sub_19A990D58();
  *(_QWORD *)(inited + 112) = v9;
  v10 = objc_msgSend(objc_msgSend(v0, sel_UserFocus), sel_ComputedMode);
  swift_unknownObjectRelease();
  *(_QWORD *)(inited + 120) = v10;
  v11 = sub_19A958DDC(inited);
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_19A98C928()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v5[2];

  if (qword_1ED03D5D0 != -1)
    swift_once();
  v0 = (id)qword_1ED03D5D8;
  sub_19A991160();
  swift_bridgeObjectRelease();
  v5[1] = 0xE900000000000020;
  sub_19A990DAC();
  sub_19A990DAC();
  v1 = sub_19A990F98();
  if (os_log_type_enabled(v0, v1))
  {
    swift_bridgeObjectRetain_n();
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5[0] = v3;
    *(_DWORD *)v2 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(0x726F66206B6E6953, 0xE900000000000020, v5);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v0, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v3, -1, -1);
    MEMORY[0x19AECE318](v2, -1, -1);

    return swift_bridgeObjectRelease();
  }
  else
  {

    return swift_bridgeObjectRelease();
  }
}

void sub_19A98CB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  v8 = a2 + 16;
  swift_beginAccess();
  v9 = MEMORY[0x19AECE39C](v8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *(NSObject **)(v9 + OBJC_IVAR___TPSBiomeDataProvider_registrationQueue);
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v10;
    v12[3] = a3;
    v12[4] = a4;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_19A98F2E4;
    *(_QWORD *)(v13 + 24) = v12;
    aBlock[4] = sub_19A98F2B8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_19A96CCFC;
    aBlock[3] = &block_descriptor_52_0;
    v14 = _Block_copy(aBlock);
    v15 = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v11, v14);
    _Block_release(v14);
    LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v11 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      a5(a3, a4);

    }
  }
}

uint64_t sub_19A98CCC8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_19A98CD10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t *v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  v7 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v8 = a4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v7;
  *v7 = 0x8000000000000000;
  sub_19A959A54((uint64_t)v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *v7 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_19A98CEA0()
{
  char *v0;
  char *v1;
  NSObject *v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  void (*v14)();
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t aBlock;
  unint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t (*v37)();
  uint64_t v38;

  v1 = v0;
  if (qword_1ED03D5D0 != -1)
LABEL_31:
    swift_once();
  aBlock = 0;
  v34 = 0xE000000000000000;
  v2 = (id)qword_1ED03D5D8;
  sub_19A991160();
  swift_bridgeObjectRelease();
  aBlock = 0xD00000000000001FLL;
  v34 = 0x800000019A9A1630;
  v3 = &v1[OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6DF8);
  sub_19A990CE0();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = aBlock;
  v4 = v34;
  v6 = sub_19A990F98();
  if (os_log_type_enabled(v2, v6))
  {
    swift_bridgeObjectRetain_n();
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    aBlock = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A91E7D8(v5, v4, &aBlock);
    sub_19A991058();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A906000, v2, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECE318](v8, -1, -1);
    MEMORY[0x19AECE318](v7, -1, -1);
  }

  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)v3;
  v29 = *(_QWORD *)v3 + 64;
  v10 = 1 << *(_BYTE *)(*(_QWORD *)v3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(*(_QWORD *)v3 + 64);
  v30 = (unint64_t)(v10 + 63) >> 6;
  v31 = OBJC_IVAR___TPSBiomeDataProvider_registrationQueue;
  v32 = v9;
  result = swift_bridgeObjectRetain();
  v14 = 0;
  v15 = 0;
  while (v12)
  {
    v16 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    v17 = v16 | (v15 << 6);
LABEL_8:
    v18 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * v17);
    v19 = *v18;
    v20 = v18[1];
    v21 = *(NSObject **)&v1[v31];
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v1;
    v22[3] = v19;
    v22[4] = v20;
    swift_bridgeObjectRetain();
    v23 = v1;
    sub_19A9642B0((uint64_t)v14);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_19A98EA14;
    *(_QWORD *)(v24 + 24) = v22;
    v37 = sub_19A98F2B8;
    v38 = v24;
    aBlock = MEMORY[0x1E0C809B0];
    v34 = 1107296256;
    v35 = sub_19A96CCFC;
    v36 = &block_descriptor_13_0;
    v25 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    dispatch_sync(v21, v25);
    _Block_release(v25);
    LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    v14 = sub_19A98EA14;
    if ((v20 & 1) != 0)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
  v26 = v15 + 1;
  if (__OFADD__(v15, 1))
    goto LABEL_30;
  if (v26 >= v30)
  {
LABEL_28:
    swift_release();
    return sub_19A9642B0((uint64_t)v14);
  }
  v27 = *(_QWORD *)(v29 + 8 * v26);
  ++v15;
  if (v27)
    goto LABEL_27;
  v15 = v26 + 1;
  if (v26 + 1 >= v30)
    goto LABEL_28;
  v27 = *(_QWORD *)(v29 + 8 * v15);
  if (v27)
    goto LABEL_27;
  v15 = v26 + 2;
  if (v26 + 2 >= v30)
    goto LABEL_28;
  v27 = *(_QWORD *)(v29 + 8 * v15);
  if (v27)
    goto LABEL_27;
  v15 = v26 + 3;
  if (v26 + 3 >= v30)
    goto LABEL_28;
  v27 = *(_QWORD *)(v29 + 8 * v15);
  if (v27)
    goto LABEL_27;
  v15 = v26 + 4;
  if (v26 + 4 >= v30)
    goto LABEL_28;
  v27 = *(_QWORD *)(v29 + 8 * v15);
  if (v27)
  {
LABEL_27:
    v12 = (v27 - 1) & v27;
    v17 = __clz(__rbit64(v27)) + (v15 << 6);
    goto LABEL_8;
  }
  v28 = v26 + 5;
  if (v28 >= v30)
    goto LABEL_28;
  v27 = *(_QWORD *)(v29 + 8 * v28);
  if (v27)
  {
    v15 = v28;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v15 >= v30)
      goto LABEL_28;
    v27 = *(_QWORD *)(v29 + 8 * v15);
    ++v28;
    if (v27)
      goto LABEL_27;
  }
  __break(1u);
  return result;
}

void sub_19A98D378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  id v9;
  void *v10;

  v5 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  v6 = *v5;
  if (*(_QWORD *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_19A979BFC(a2, a3);
    if ((v8 & 1) != 0)
    {
      v9 = *(id *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_cancel);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v10 = (void *)sub_19A979E70(a2, a3);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_19A98D4BC(uint64_t a1, uint64_t a2)
{
  char *v2;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v5 = *(NSObject **)&v2[OBJC_IVAR___TPSBiomeDataProvider_registrationQueue];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_19A98E9EC;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_19A98EA08;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_19A96CCFC;
  v12[3] = &block_descriptor_7;
  v8 = _Block_copy(v12);
  v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_19A98D600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint8_t *v14;
  void *v15;
  id v16;
  uint64_t v17[3];

  v5 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  v6 = *v5;
  if (*(_QWORD *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = sub_19A979BFC(a2, a3);
    if ((v8 & 1) != 0)
    {
      v9 = *(id *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1ED03D5D0 != -1)
        swift_once();
      v10 = (id)qword_1ED03D5D8;
      sub_19A991160();
      swift_bridgeObjectRelease();
      v17[0] = 0xD00000000000001CLL;
      v17[1] = 0x800000019A9A1610;
      sub_19A990DAC();
      v11 = sub_19A990F98();
      if (os_log_type_enabled(v10, v11))
      {
        swift_bridgeObjectRetain_n();
        v16 = v9;
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        v17[0] = v13;
        *(_DWORD *)v12 = 136315138;
        swift_bridgeObjectRetain();
        sub_19A91E7D8(0xD00000000000001CLL, 0x800000019A9A1610, v17);
        sub_19A991058();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19A906000, v10, v11, "%s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECE318](v13, -1, -1);
        v14 = v12;
        v9 = v16;
        MEMORY[0x19AECE318](v14, -1, -1);

      }
      else
      {

      }
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_cancel);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v15 = (void *)sub_19A979E70(a2, a3);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_19A98D918(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  unint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  _QWORD *v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _BYTE v50[32];
  __int128 v51;
  _OWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  __int128 v55;

  v46 = (void **)result;
  if (!a2)
    return result;
  v3 = a3;
  v43 = a2 + 64;
  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (a3)
    v9 = (_QWORD *)a3;
  v44 = v8;
  v45 = v9;
  v41 = v8 - 1;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v10 << 6);
LABEL_12:
      v16 = *(_QWORD *)(a2 + 56);
      v17 = (_QWORD *)(*(_QWORD *)(a2 + 48) + 16 * v15);
      v18 = v17[1];
      *(_QWORD *)&v51 = *v17;
      *((_QWORD *)&v51 + 1) = v18;
      sub_19A91E8A8(v16 + 32 * v15, (uint64_t)v52);
      swift_bridgeObjectRetain();
      goto LABEL_31;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_55;
    }
    if (v19 < v44)
    {
      v20 = *(_QWORD *)(v43 + 8 * v19);
      if (v20)
        goto LABEL_16;
      v21 = v10 + 2;
      ++v10;
      if (v19 + 1 < v44)
      {
        v20 = *(_QWORD *)(v43 + 8 * v21);
        if (v20)
          goto LABEL_19;
        v10 = v19 + 1;
        if (v19 + 2 < v44)
        {
          v20 = *(_QWORD *)(v43 + 8 * (v19 + 2));
          if (v20)
          {
            v19 += 2;
            goto LABEL_16;
          }
          v21 = v19 + 3;
          v10 = v19 + 2;
          if (v19 + 3 < v44)
            break;
        }
      }
    }
LABEL_30:
    v7 = 0;
    memset(v52, 0, sizeof(v52));
    v51 = 0u;
LABEL_31:
    sub_19A98A67C((uint64_t)&v51, (uint64_t)&v53);
    v22 = v54;
    if (!v54)
      return swift_release();
    v23 = v53;
    sub_19A959AA0(&v55, &v51);
    sub_19A91E8A8((uint64_t)&v51, (uint64_t)v50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6490);
    if (!swift_dynamicCast())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6DE0);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_19A98E7B0(v3);
        swift_bridgeObjectRelease();
        sub_19A91E8A8((uint64_t)&v51, (uint64_t)&v48);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B6DE8);
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_51;
        v11 = *v46;
        v12 = (void *)sub_19A990D34();
        swift_bridgeObjectRelease();
        v13 = objc_msgSend(v11, sel_filterWithKeyPath_comparison_value_, v12, 3, v47);
        swift_unknownObjectRelease();

        goto LABEL_8;
      }
      if (swift_dynamicCast())
      {
        sub_19A98E7B0(v3);
        swift_bridgeObjectRelease();
        v29 = *v46;
        v30 = (void *)sub_19A990D34();
        swift_bridgeObjectRelease();
        v31 = (void *)sub_19A990D34();
        swift_bridgeObjectRelease();
        v32 = objc_msgSend(v29, sel_filterWithKeyPath_value_, v30, v31);
      }
      else
      {
        if (!swift_dynamicCast())
        {
          if (qword_1ED03D5D0 != -1)
            swift_once();
          v48 = 0;
          v49 = 0xE000000000000000;
          v34 = (id)qword_1ED03D5D8;
          sub_19A991160();
          sub_19A990DAC();
          swift_bridgeObjectRelease();
          sub_19A990DAC();
          __swift_project_boxed_opaque_existential_0(&v51, *((uint64_t *)&v52[0] + 1));
          swift_getDynamicType();
          sub_19A9913A0();
          sub_19A990DAC();
          swift_bridgeObjectRelease();
          v36 = v48;
          v35 = v49;
          v37 = sub_19A990F98();
          if (os_log_type_enabled(v34, v37))
          {
            swift_bridgeObjectRetain_n();
            v38 = swift_slowAlloc();
            v42 = v3;
            v39 = swift_slowAlloc();
            v48 = v39;
            *(_DWORD *)v38 = 136315138;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v38 + 4) = sub_19A91E7D8(v36, v35, &v48);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_19A906000, v34, v37, "%s", (uint8_t *)v38, 0xCu);
            swift_arrayDestroy();
            v40 = v39;
            v3 = v42;
            MEMORY[0x19AECE318](v40, -1, -1);
            MEMORY[0x19AECE318](v38, -1, -1);
          }

LABEL_51:
          swift_bridgeObjectRelease();
LABEL_8:
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v51);
          goto LABEL_9;
        }
        sub_19A98E7B0(v3);
        swift_bridgeObjectRelease();
        v33 = *v46;
        v30 = (void *)sub_19A990D34();
        swift_bridgeObjectRelease();
        v31 = (void *)sub_19A990F5C();
        v32 = objc_msgSend(v33, sel_filterWithKeyPath_value_, v30, v31);
      }

      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    v24 = v3;
    swift_bridgeObjectRetain();
    v25 = v45;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_19A96A420(0, v45[2] + 1, 1, v45);
    v27 = v25[2];
    v26 = v25[3];
    if (v27 >= v26 >> 1)
      v25 = sub_19A96A420((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
    v25[2] = v27 + 1;
    v28 = &v25[2 * v27];
    v28[4] = v23;
    v28[5] = v22;
    sub_19A98D918(v46, a2, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v51);
    v3 = v24;
LABEL_9:
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
  }
  v20 = *(_QWORD *)(v43 + 8 * v21);
  if (v20)
  {
LABEL_19:
    v19 = v21;
LABEL_16:
    v7 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v19 << 6);
    v10 = v19;
    goto LABEL_12;
  }
  while (1)
  {
    v19 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v19 >= v44)
    {
      v10 = v41;
      goto LABEL_30;
    }
    v20 = *(_QWORD *)(v43 + 8 * v19);
    ++v21;
    if (v20)
      goto LABEL_16;
  }
LABEL_55:
  __break(1u);
  return result;
}

id TipsBiomeDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipsBiomeDataProvider.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v1 = sub_19A990FA4();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_19A990C50();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_19A990FBC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations;
  v8 = v0;
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[v7] = sub_19A958DE8(MEMORY[0x1E0DEE9D8]);
  v12 = OBJC_IVAR___TPSBiomeDataProvider_registrationQueue;
  sub_19A97B0BC();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D8], v3);
  sub_19A990C38();
  v14 = v9;
  sub_19A97B0F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
  sub_19A98E9A8((unint64_t *)&qword_1ED03D3C0, &qword_1ED03D3B8, MEMORY[0x1E0DEAF38]);
  sub_19A9910B8();
  *(_QWORD *)&v8[v12] = sub_19A990FE0();

  v10 = (objc_class *)type metadata accessor for TipsBiomeDataProvider();
  v13.receiver = v8;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for TipsBiomeDataProvider()
{
  return objc_opt_self();
}

id TipsBiomeDataProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TipsBiomeDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_19A98E300(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19A98E338(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_19A98E31C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19A98E4A4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_19A98E338(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D408);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A98E4A4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B59F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A98E60C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B6C58);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B5980);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_19A991208();
  __break(1u);
  return result;
}

uint64_t sub_19A98E7B0(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
    {
      v8 = MEMORY[0x1E0DEE9D8];
      sub_19A98E31C(0, v2, 0);
      v3 = a1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_19A990DAC();
        swift_bridgeObjectRelease();
        v5 = *(_QWORD *)(v8 + 16);
        v4 = *(_QWORD *)(v8 + 24);
        if (v5 >= v4 >> 1)
          sub_19A98E31C(v4 > 1, v5 + 1, 1);
        v3 += 16;
        *(_QWORD *)(v8 + 16) = v5 + 1;
        v6 = v8 + 16 * v5;
        *(_QWORD *)(v6 + 32) = 46;
        *(_QWORD *)(v6 + 40) = 0xE100000000000000;
        --v2;
      }
      while (v2);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
      sub_19A98E9A8((unint64_t *)&qword_1EE3B6D30, (uint64_t *)&unk_1ED03D140, MEMORY[0x1E0DEAF20]);
      sub_19A990D04();
      swift_release();
    }
  }
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  sub_19A990DAC();
  swift_bridgeObjectRetain();
  sub_19A990DAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x646F42746E657665;
}

uint64_t sub_19A98E9A8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x19AECE27C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_19A98E9EC()
{
  uint64_t *v0;

  sub_19A98D600(v0[2], v0[3], v0[4]);
}

uint64_t sub_19A98E9F8()
{
  return swift_deallocObject();
}

uint64_t sub_19A98EA08()
{
  uint64_t v0;

  return sub_19A96CCDC(*(uint64_t (**)(void))(v0 + 16));
}

void sub_19A98EA14()
{
  uint64_t *v0;

  sub_19A98D378(v0[2], v0[3], v0[4]);
}

uint64_t sub_19A98EA20()
{
  return swift_deallocObject();
}

uint64_t sub_19A98EA30()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_19A98EA54()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_19A990D34();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t sub_19A98EA94(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  char *v5;
  char *v6;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t result;
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  void *v44;
  const void *v45;
  id v46;
  NSObject *v47;
  _QWORD *v48;
  uint64_t v49;
  void *v50;
  char *v51;
  id v52;
  _QWORD v53[2];
  const __CFString *v54;
  id v55;
  char *v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t aBlock;
  unint64_t v65;
  void *v66;
  void *v67;
  uint64_t (*v68)();
  _QWORD *v69;
  id v70[2];

  v6 = v5;
  v60 = a4;
  v61 = a5;
  v62 = a2;
  v63 = a3;
  v8 = (_QWORD *)sub_19A990FBC();
  v58 = *(v8 - 1);
  v59 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_19A990FA4();
  MEMORY[0x1E0C80A78](v11);
  v12 = sub_19A990C50();
  MEMORY[0x1E0C80A78](v12);
  if (qword_1EE3B6118 != -1)
    swift_once();
  v13 = a1;
  v14 = objc_msgSend(a1, sel_stream);
  v15 = sub_19A990D58();
  v17 = v16;

  swift_beginAccess();
  v18 = off_1EE3B6DB0;
  if (*((_QWORD *)off_1EE3B6DB0 + 2) && (v19 = sub_19A979BFC(v15, v17), (v20 & 1) != 0))
  {
    v56 = v6;
    v21 = *(void **)(v18[7] + 8 * v19);
    swift_endAccess();
    v57 = v21;
    swift_bridgeObjectRelease();
    aBlock = 0;
    v65 = 0xE000000000000000;
    sub_19A991160();
    swift_bridgeObjectRelease();
    aBlock = 0x6C7070612E6D6F63;
    v65 = 0xEF2E737069742E65;
    v55 = v13;
    v22 = objc_msgSend(v13, sel_stream);
    sub_19A990D58();

    sub_19A990DAC();
    swift_bridgeObjectRelease();
    sub_19A990DAC();
    sub_19A990DAC();
    v53[1] = aBlock;
    aBlock = 0;
    v65 = 0xE000000000000000;
    sub_19A991160();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000010;
    v65 = 0x800000019A9A1650;
    v54 = CFSTR("FeatureDiscoverability");
    sub_19A990D58();
    sub_19A990DAC();
    swift_bridgeObjectRelease();
    v53[0] = sub_19A97B0BC();
    sub_19A990DAC();
    sub_19A990DAC();
    sub_19A990C38();
    aBlock = MEMORY[0x1E0DEE9D8];
    sub_19A97B0F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D3B8);
    sub_19A98E9A8((unint64_t *)&qword_1ED03D3C0, &qword_1ED03D3B8, MEMORY[0x1E0DEAF38]);
    sub_19A9910B8();
    (*(void (**)(char *, _QWORD, id))(v58 + 104))(v10, *MEMORY[0x1E0DEF8D0], v59);
    v23 = (void *)sub_19A990FE0();
    v24 = objc_allocWithZone(MEMORY[0x1E0D025E0]);
    v25 = v23;
    v26 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
    v27 = objc_msgSend(v24, sel_initWithIdentifier_targetQueue_waking_, v26, v25, 1);

    v59 = v25;
    v28 = objc_msgSend(v57, sel_DSLPublisherWithUseCase_, v54);
    v70[0] = v28;
    v29 = objc_msgSend(v55, sel_filterParametersForBiomeQuery);
    if (v29)
    {
      v30 = v29;
      v31 = sub_19A990CC8();

    }
    else
    {
      v31 = 0;
    }
    v33 = v56;
    sub_19A98D918((uint64_t)v70, v31, 0);
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v28, sel_subscribeOn_, v27);
    v35 = swift_allocObject();
    v36 = v62;
    v37 = v63;
    *(_QWORD *)(v35 + 16) = v62;
    *(_QWORD *)(v35 + 24) = v37;
    v68 = sub_19A98F1B8;
    v69 = (_QWORD *)v35;
    v38 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v65 = 1107296256;
    v66 = sub_19A95DD88;
    v67 = &block_descriptor_22_0;
    v39 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    v40 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v41 = (_QWORD *)swift_allocObject();
    v41[2] = v40;
    v41[3] = v36;
    v42 = v60;
    v43 = v61;
    v41[4] = v37;
    v41[5] = v42;
    v41[6] = v43;
    v68 = (uint64_t (*)())sub_19A98F218;
    v69 = v41;
    aBlock = v38;
    v65 = 1107296256;
    v66 = sub_19A98CCC8;
    v67 = &block_descriptor_31;
    v44 = _Block_copy(&aBlock);
    v60 = v27;
    v45 = v44;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    v46 = objc_msgSend(v34, sel_sinkWithCompletion_receiveInput_, v39, v45);
    _Block_release(v45);
    _Block_release(v39);

    v47 = *(NSObject **)&v33[OBJC_IVAR___TPSBiomeDataProvider_registrationQueue];
    v48 = (_QWORD *)swift_allocObject();
    v48[2] = v33;
    v48[3] = v36;
    v48[4] = v37;
    v48[5] = v46;
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + 16) = sub_19A98F25C;
    *(_QWORD *)(v49 + 24) = v48;
    v68 = sub_19A98F2B8;
    v69 = (_QWORD *)v49;
    aBlock = v38;
    v65 = 1107296256;
    v66 = sub_19A96CCFC;
    v67 = &block_descriptor_41;
    v50 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    v51 = v33;
    v52 = v46;
    swift_retain();
    swift_release();
    dispatch_sync(v47, v50);
    _Block_release(v50);

    LOBYTE(v52) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v52 & 1) != 0)
      __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_19A98F194()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A98F1B8()
{
  return sub_19A98C928();
}

uint64_t sub_19A98F1C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_19A98F1E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_19A98F218(uint64_t a1)
{
  uint64_t v1;

  sub_19A98CB38(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(uint64_t, uint64_t))(v1 + 40));
}

uint64_t sub_19A98F228()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A98F25C()
{
  uint64_t v0;

  return sub_19A98CD10(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_19A98F268()
{
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A98F2A8()
{
  return swift_deallocObject();
}

uint64_t __getPPCExtensibleSSOAuthenticatorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSStringCacheController formattedDataWithData:].cold.1(v0);
}

uint64_t __getPPCRedirectClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded].cold.1(v0);
}

uint64_t sub_19A990818()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_19A990824()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_19A990830()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_19A99083C()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_19A990848()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_19A990854()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_19A990860()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_19A99086C()
{
  return MEMORY[0x1E0CAE760]();
}

uint64_t sub_19A990878()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_19A990884()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_19A990890()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_19A99089C()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_19A9908A8()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_19A9908B4()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_19A9908C0()
{
  return MEMORY[0x1E0CAE840]();
}

uint64_t sub_19A9908CC()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_19A9908D8()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_19A9908E4()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_19A9908F0()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_19A9908FC()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_19A990908()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_19A990914()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_19A990920()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_19A99092C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_19A990938()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_19A990944()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_19A990950()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_19A99095C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_19A990968()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_19A990974()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_19A990980()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_19A99098C()
{
  return MEMORY[0x1E0CAF910]();
}

uint64_t sub_19A990998()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_19A9909A4()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_19A9909B0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_19A9909BC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_19A9909C8()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_19A9909D4()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_19A9909E0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_19A9909EC()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_19A9909F8()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_19A990A04()
{
  return MEMORY[0x1E0CAFF78]();
}

uint64_t sub_19A990A10()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_19A990A1C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_19A990A28()
{
  return MEMORY[0x1E0CAFFB8]();
}

uint64_t sub_19A990A34()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19A990A40()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_19A990A4C()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_19A990A58()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_19A990A64()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_19A990A70()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_19A990A7C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_19A990A88()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_19A990A94()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_19A990AA0()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_19A990AAC()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_19A990AB8()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_19A990AC4()
{
  return MEMORY[0x1E0CB0820]();
}

uint64_t sub_19A990AD0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_19A990ADC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_19A990AE8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_19A990AF4()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_19A990B00()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_19A990B0C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_19A990B18()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_19A990B24()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_19A990B30()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_19A990B3C()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_19A990B48()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_19A990B54()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_19A990B60()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_19A990B6C()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_19A990B78()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_19A990B84()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_19A990B90()
{
  return MEMORY[0x1E0CCE388]();
}

uint64_t sub_19A990B9C()
{
  return MEMORY[0x1E0CCE6E8]();
}

uint64_t sub_19A990BA8()
{
  return MEMORY[0x1E0CCE708]();
}

uint64_t sub_19A990BB4()
{
  return MEMORY[0x1E0CCE718]();
}

uint64_t sub_19A990BC0()
{
  return MEMORY[0x1E0CCE728]();
}

uint64_t sub_19A990BCC()
{
  return MEMORY[0x1E0CCE730]();
}

uint64_t sub_19A990BD8()
{
  return MEMORY[0x1E0CCEA28]();
}

uint64_t sub_19A990BE4()
{
  return MEMORY[0x1E0CCEA48]();
}

uint64_t sub_19A990BF0()
{
  return MEMORY[0x1E0CCEA88]();
}

uint64_t sub_19A990BFC()
{
  return MEMORY[0x1E0CCEAA8]();
}

uint64_t sub_19A990C08()
{
  return MEMORY[0x1E0CCEAB8]();
}

uint64_t sub_19A990C14()
{
  return MEMORY[0x1E0CCEAD0]();
}

uint64_t sub_19A990C20()
{
  return MEMORY[0x1E0CCEAD8]();
}

uint64_t sub_19A990C2C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_19A990C38()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_19A990C44()
{
  return MEMORY[0x1E0DEF590]();
}

uint64_t sub_19A990C50()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_19A990C5C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_19A990C68()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_19A990C74()
{
  return MEMORY[0x1E0DEF6F8]();
}

uint64_t sub_19A990C80()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_19A990C8C()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_19A990C98()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_19A990CA4()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_19A990CB0()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_19A990CBC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_19A990CC8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_19A990CD4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_19A990CE0()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t sub_19A990CEC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_19A990CF8()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_19A990D04()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_19A990D10()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19A990D1C()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_19A990D28()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_19A990D34()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19A990D40()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_19A990D4C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_19A990D58()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19A990D64()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_19A990D70()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_19A990D7C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19A990D88()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_19A990D94()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_19A990DA0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19A990DAC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19A990DB8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19A990DC4()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_19A990DD0()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_19A990DDC()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_19A990DE8()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_19A990DF4()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_19A990E00()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t sub_19A990E0C()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_19A990E18()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_19A990E24()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19A990E30()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19A990E3C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19A990E48()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_19A990E54()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19A990E60()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19A990E6C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_19A990E78()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19A990E84()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_19A990E90()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_19A990E9C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_19A990EA8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_19A990EB4()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_19A990EC0()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_19A990ECC()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_19A990ED8()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_19A990EE4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_19A990EF0()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_19A990EFC()
{
  return MEMORY[0x1E0DF0878]();
}

uint64_t sub_19A990F08()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_19A990F14()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_19A990F20()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_19A990F2C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_19A990F38()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_19A990F44()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_19A990F50()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_19A990F5C()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_19A990F68()
{
  return MEMORY[0x1E0D02580]();
}

uint64_t sub_19A990F74()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_19A990F80()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_19A990F8C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19A990F98()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_19A990FA4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_19A990FB0()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_19A990FBC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_19A990FC8()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_19A990FD4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_19A990FE0()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_19A990FEC()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_19A990FF8()
{
  return MEMORY[0x1E0CB2028]();
}

uint64_t sub_19A991004()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_19A991010()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_19A99101C()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_19A991028()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_19A991034()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_19A991040()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_19A99104C()
{
  return MEMORY[0x1E0CB23E8]();
}

uint64_t sub_19A991058()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19A991064()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19A991070()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_19A99107C()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_19A991088()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_19A991094()
{
  return MEMORY[0x1E0CB2518]();
}

uint64_t sub_19A9910A0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19A9910AC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_19A9910B8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_19A9910C4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_19A9910D0()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_19A9910DC()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_19A9910E8()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_19A9910F4()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_19A991100()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_19A99110C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_19A991118()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_19A991124()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_19A991130()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_19A99113C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_19A991148()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_19A991154()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_19A991160()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19A99116C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19A991178()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_19A991184()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19A991190()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19A99119C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_19A9911A8()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_19A9911B4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19A9911C0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19A9911CC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19A9911D8()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_19A9911E4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19A9911F0()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19A9911FC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_19A991208()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19A991214()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_19A991220()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_19A99122C()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_19A991238()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_19A991244()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_19A991250()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_19A99125C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_19A991268()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_19A991274()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_19A991280()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19A99128C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_19A991298()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19A9912A4()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_19A9912B0()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_19A9912BC()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_19A9912C8()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_19A9912D4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_19A9912E0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19A9912EC()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_19A9912F8()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_19A991304()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_19A991310()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19A99131C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19A991328()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19A991334()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19A991340()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19A99134C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19A991358()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_19A991364()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19A991370()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_19A99137C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_19A991388()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_19A991394()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_19A9913A0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x1E0CD6420](pkcs12_data, options, items);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1E0C84968]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

