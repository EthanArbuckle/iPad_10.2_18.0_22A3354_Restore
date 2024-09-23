id iCloudMailUnifiedSettingsProvider.__allocating_init(accountManager:presenter:)(void *a1, void *a2)
{
  objc_class *v2;
  char *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_mailSettingsProvider] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_accountManager] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_presenter] = a2;
  v10.receiver = v5;
  v10.super_class = v2;
  v6 = a1;
  v7 = a2;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_24B4C0294();

  return v8;
}

id iCloudMailUnifiedSettingsProvider.init(accountManager:presenter:)(void *a1, void *a2)
{
  char *v2;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v2[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_mailSettingsProvider] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_accountManager] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___iCloudMailUnifiedSettingsProvider_presenter] = a2;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for iCloudMailUnifiedSettingsProvider();
  v5 = a1;
  v6 = a2;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_24B4C0294();

  return v7;
}

uint64_t sub_24B4BFE44()
{
  return sub_24B4BFE90(0, 0);
}

uint64_t sub_24B4BFE90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSString *v8;
  Class v9;
  id v10;
  uint64_t v11;
  uint64_t result;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD v19[2];

  v4 = sub_24B4C0504();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B4C0294();
  v8 = (NSString *)sub_24B4C0510();
  v9 = NSClassFromString(v8);

  if (v9 && (swift_getObjCClassMetadata(), v19[1] = &unk_2579957B0, swift_dynamicCastTypeToObjCProtocolConditional()))
  {
    v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithManager_presenter_, *(_QWORD *)(v2 + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_accountManager), *(_QWORD *)(v2 + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_presenter));
    v11 = OBJC_IVAR___iCloudMailUnifiedSettingsProvider_mailSettingsProvider;
    *(_QWORD *)(v2 + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_mailSettingsProvider) = v10;
    result = swift_unknownObjectRelease();
    v13 = *(void **)(v2 + v11);
    if (v13)
    {
      swift_unknownObjectRetain();
      if (a2)
        v14 = (void *)sub_24B4C0510();
      else
        v14 = 0;
      objc_msgSend(v13, sel_onMailTapWithDeeplink_, v14);

      return swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_257994E90 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v4, (uint64_t)qword_257994E98);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    v16 = sub_24B4C04EC();
    v17 = sub_24B4C0540();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_24B4BE000, v16, v17, "[iCloudMailSettingsProvider] Unable to find MailSettingsSpecifierProvider", v18, 2u);
      MEMORY[0x24BD21290](v18, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

id iCloudMailUnifiedSettingsProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void iCloudMailUnifiedSettingsProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id iCloudMailUnifiedSettingsProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudMailUnifiedSettingsProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24B4C0214()
{
  uint64_t v0;

  v0 = sub_24B4C0504();
  __swift_allocate_value_buffer(v0, qword_257994E98);
  __swift_project_value_buffer(v0, (uint64_t)qword_257994E98);
  return sub_24B4C04F8();
}

void sub_24B4C0294()
{
  NSString *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v0 = NSOpenStepRootDirectory();
  sub_24B4C051C();

  swift_bridgeObjectRetain();
  sub_24B4C0534();
  sub_24B4C0528();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v5 = sub_24B4C0534();
  v6 = v1;
  sub_24B4C0528();
  swift_bridgeObjectRelease();
  v2 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v3 = (void *)sub_24B4C0510();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithPath_, v3, v5, v6, 0xD000000000000019, 0x800000024B4C0960);

  if (!v4 || (objc_msgSend(v4, sel_isLoaded) & 1) == 0)
    objc_msgSend(v4, sel_load);

}

uint64_t type metadata accessor for iCloudMailUnifiedSettingsProvider()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t method lookup function for iCloudMailUnifiedSettingsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of iCloudMailUnifiedSettingsProvider.__allocating_init(accountManager:presenter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of iCloudMailUnifiedSettingsProvider.navigateToiCloudMailSettings()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of iCloudMailUnifiedSettingsProvider.navigateToiCloudMailSettings(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
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

uint64_t sub_24B4C04EC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24B4C04F8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24B4C0504()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24B4C0510()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24B4C051C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24B4C0528()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_24B4C0534()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24B4C0540()
{
  return MEMORY[0x24BEE7910]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSOpenStepRootDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1120]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

