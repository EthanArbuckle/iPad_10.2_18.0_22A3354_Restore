@implementation WFSwiftAppShortcutDataSource

- (WFSwiftAppShortcutDataSource)initWithAppShortcutsProvider:(id)a3 denyListEnvironment:(unint64_t)a4 organizationStyle:(int64_t)a5
{
  uint64_t v8;

  swift_getObjectType();
  v8 = swift_unknownObjectRetain();
  return (WFSwiftAppShortcutDataSource *)sub_1C183E0D4(v8, a4, a5, (char *)self);
}

- (id)fetchAppShortcutForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5
{
  WFSwiftAppShortcutDataSource *v6;
  void *v7;

  sub_1C1B0F380();
  sub_1C1B0F224();
  v6 = self;
  sub_1C183C4A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6FB4B8);
  v7 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)appShortcutsChanged
{
  WFSwiftAppShortcutDataSource *v2;

  v2 = self;
  sub_1C183D6E0();

}

- (WFSwiftAppShortcutDataSource)init
{
  AppShortcutDataSource.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___WFSwiftAppShortcutDataSource__collections;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6FA960);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectRelease();
}

@end
