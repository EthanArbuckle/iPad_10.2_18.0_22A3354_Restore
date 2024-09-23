@implementation FMItemsListDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_cellsViewModel))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy21FMItemsListDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_10039AB88(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy21FMItemsListDataSource *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10038FA8C(v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy21FMItemsListDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_10039ACC4(a4);
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

- (void)handleTabAction
{
  _TtC6FindMy21FMItemsListDataSource *v2;

  v2 = self;
  sub_100393F18();

}

- (void)handleSecondaryTabAction
{
  _TtC6FindMy21FMItemsListDataSource *v2;

  v2 = self;
  sub_100394080();

}

- (void)handleTertiaryTabAction
{
  _TtC6FindMy21FMItemsListDataSource *v2;

  v2 = self;
  sub_1003940BC();

}

- (_TtC6FindMy21FMItemsListDataSource)init
{
  _TtC6FindMy21FMItemsListDataSource *result;

  result = (_TtC6FindMy21FMItemsListDataSource *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMItemsListDataSource", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_mediator));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_deviceSubscription));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_locationSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_cellsViewModel));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_itemAger));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_delayedUpdateWorkItem));

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy21FMItemsListDataSource__listTitle]);
}

@end
