@implementation FMMultipartEntityListDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_cellsViewModel))[2];
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
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_cellsViewModel);
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
  _TtC6FindMy31FMMultipartEntityListDataSource *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10039D604(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC6FindMy31FMMultipartEntityListDataSource)init
{
  _TtC6FindMy31FMMultipartEntityListDataSource *result;

  result = (_TtC6FindMy31FMMultipartEntityListDataSource *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMMultipartEntityListDataSource", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_selectedDevice;
  v4 = type metadata accessor for FMIPDevice(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_mediator));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_deviceSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_locationSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_cellsViewModel));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_itemAger));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource_delayedUpdateWorkItem));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy31FMMultipartEntityListDataSource__listTitle]);
}

@end
