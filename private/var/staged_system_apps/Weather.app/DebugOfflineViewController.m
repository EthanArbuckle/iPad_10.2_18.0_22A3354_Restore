@implementation DebugOfflineViewController

- (_TtC7Weather26DebugOfflineViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002C6A28();
}

- (void)viewDidLoad
{
  _TtC7Weather26DebugOfflineViewController *v2;

  v2 = self;
  sub_1002C6AB0();

}

- (_TtC7Weather26DebugOfflineViewController)initWithStyle:(int64_t)a3
{
  sub_1002C6BC8();
}

- (_TtC7Weather26DebugOfflineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1002C6C00();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Weather26DebugOfflineViewController_sections));
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_1002C6E84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_1002C6D94);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_1002C6E84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_1002C6E24);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return sub_1002C6ECC();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1002C6F00((uint64_t)self, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather26DebugOfflineViewController *v13;
  __n128 v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v15 = (void *)sub_1002C6F6C((uint64_t)v12, (uint64_t)v11, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather26DebugOfflineViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_1002C7108(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end
