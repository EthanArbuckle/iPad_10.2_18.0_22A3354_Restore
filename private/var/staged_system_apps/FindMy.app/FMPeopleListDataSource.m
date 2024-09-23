@implementation FMPeopleListDataSource

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_mediator));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_peopleSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_locationSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_selectionSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_meCellViewModel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_cellsViewModel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_fenceCellModels));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_itemAger));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy22FMPeopleListDataSource_delayedUpdateWorkItem));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy22FMPeopleListDataSource *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100039E68(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy22FMPeopleListDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_10003D0A4(a4);
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

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_100057088(a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (void)addPeople
{
  _TtC6FindMy22FMPeopleListDataSource *v2;

  v2 = self;
  sub_100466370();

}

- (_TtC6FindMy22FMPeopleListDataSource)init
{
  _TtC6FindMy22FMPeopleListDataSource *result;

  result = (_TtC6FindMy22FMPeopleListDataSource *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPeopleListDataSource", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
