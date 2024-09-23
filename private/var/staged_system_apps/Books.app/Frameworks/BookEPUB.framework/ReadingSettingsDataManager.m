@implementation ReadingSettingsDataManager

- (_TtC8BookEPUB26ReadingSettingsDataManager)init
{
  _TtC8BookEPUB26ReadingSettingsDataManager *result;

  result = (_TtC8BookEPUB26ReadingSettingsDataManager *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.ReadingSettingsDataManager", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_paginationService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_locationProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_settingsManager));
  sub_34488((Class *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_themeDatabaseManager));
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_subscribers));
}

@end
