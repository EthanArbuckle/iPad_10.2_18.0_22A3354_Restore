@implementation DataManager

- (void)dealloc
{
  _TtC17FindMyWidgetItems11DataManager *v2;

  v2 = self;
  sub_100032B80();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17FindMyWidgetItems11DataManager_userDefaultsManager));
  swift_bridgeObjectRelease(*(_QWORD *)&self->userDefaultsManager[OBJC_IVAR____TtC17FindMyWidgetItems11DataManager_instanceId]);
  v3 = *(_QWORD *)&self->userDefaultsManager[OBJC_IVAR____TtC17FindMyWidgetItems11DataManager_mapGenerator];

  swift_bridgeObjectRelease(v3);
  v4 = *(_QWORD *)&self->userDefaultsManager[OBJC_IVAR____TtC17FindMyWidgetItems11DataManager_imageGenerator];

  swift_bridgeObjectRelease(v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17FindMyWidgetItems11DataManager_itemsDataService));

}

- (_TtC17FindMyWidgetItems11DataManager)init
{
  _TtC17FindMyWidgetItems11DataManager *result;

  result = (_TtC17FindMyWidgetItems11DataManager *)_swift_stdlib_reportUnimplementedInitializer("FindMyWidgetItems.DataManager", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
