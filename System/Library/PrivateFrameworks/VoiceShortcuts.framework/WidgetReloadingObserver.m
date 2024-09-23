@implementation WidgetReloadingObserver

- (void)reloadTimelines
{
  swift_retain();
  sub_1C14A86E0();
  swift_release();
}

- (void)databaseResultDidChange:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1C14A87C8();

  swift_release();
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  sub_1C1498018();
  sub_1C1499894();
  v7 = sub_1C1546E10();
  v8 = sub_1C1546E10();
  v9 = sub_1C1546E10();
  v10 = a3;
  v11 = swift_retain();
  sub_1C14A8810(v11, v7, v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
