@implementation AutoShortcutsAppsDataSource

- (void)appShortcutsChanged
{
  _TtC11WorkflowKit27AutoShortcutsAppsDataSource *v2;

  v2 = self;
  sub_1C17AE60C();

}

- (_TtC11WorkflowKit27AutoShortcutsAppsDataSource)init
{
  AutoShortcutsAppsDataSource.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11WorkflowKit27AutoShortcutsAppsDataSource__autoShortcutApps;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1E7328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WorkflowKit27AutoShortcutsAppsDataSource_appShortcutDataSource));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
