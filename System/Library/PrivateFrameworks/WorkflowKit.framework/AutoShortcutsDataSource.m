@implementation AutoShortcutsDataSource

- (_TtC11WorkflowKit23AutoShortcutsDataSource)init
{
  _TtC11WorkflowKit23AutoShortcutsDataSource *result;

  AutoShortcutsDataSource.init()();
  return result;
}

- (void)appShortcutsChanged
{
  _TtC11WorkflowKit23AutoShortcutsDataSource *v2;

  v2 = self;
  sub_1C180EB14();

}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11WorkflowKit23AutoShortcutsDataSource__collections;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6FA960);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
