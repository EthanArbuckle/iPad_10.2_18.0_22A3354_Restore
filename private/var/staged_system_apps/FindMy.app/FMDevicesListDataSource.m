@implementation FMDevicesListDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_cellsViewModel))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_cellsViewModel);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 8 * a4 + 32) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy23FMDevicesListDataSource *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1002B4908(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy23FMDevicesListDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_1002BF96C(a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_TtC6FindMy23FMDevicesListDataSource)init
{
  _TtC6FindMy23FMDevicesListDataSource *result;

  result = (_TtC6FindMy23FMDevicesListDataSource *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMDevicesListDataSource", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_mediator));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_deviceSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_locationSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_cellsViewModel));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_itemAger));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource_delayedUpdateWorkItem));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy23FMDevicesListDataSource__listTitle]);
}

@end
