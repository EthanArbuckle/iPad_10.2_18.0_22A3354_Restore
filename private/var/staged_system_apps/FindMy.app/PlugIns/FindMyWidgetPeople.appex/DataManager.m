@implementation DataManager

- (void)dealloc
{
  _TtC18FindMyWidgetPeople11DataManager *v2;

  v2 = self;
  sub_10002B8B4();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_userDefaultsManager));
  swift_bridgeObjectRelease(*(_QWORD *)&self->userDefaultsManager[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId]);
  v3 = *(_QWORD *)&self->userDefaultsManager[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_mapGenerator];

  swift_bridgeObjectRelease(v3);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_peopleDataService));

}

- (_TtC18FindMyWidgetPeople11DataManager)init
{
  _TtC18FindMyWidgetPeople11DataManager *result;

  result = (_TtC18FindMyWidgetPeople11DataManager *)_swift_stdlib_reportUnimplementedInitializer("FindMyWidgetPeople.DataManager", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
