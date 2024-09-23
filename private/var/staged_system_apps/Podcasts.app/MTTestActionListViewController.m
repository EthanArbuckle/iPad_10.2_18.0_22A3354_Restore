@implementation MTTestActionListViewController

- (_TtC8Podcasts30MTTestActionListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001B07F8(30);
}

- (_TtC8Podcasts30MTTestActionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_1001B07F8(31);
}

- (void)dismissFrom:(id)a3
{
  -[MTTestActionListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_orderedTestActionCategories))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_orderedTestActionCategories);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
    {
      v5 = *(_QWORD *)(v4 + 16 * a4 + 40);
      swift_bridgeObjectRetain(v5);
      v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v5);
      return v6;
    }
  }
  __break(1u);
  return self;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8Podcasts30MTTestActionListViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1001B08D4(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Podcasts30MTTestActionListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = MTTestActionListViewController.tableView(_:cellForRowAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Podcasts30MTTestActionListViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  MTTestActionListViewController.tableView(_:didSelectRowAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_orderedTestActionCategories));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_orderedTestActionsByCategoryName));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_tableView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts30MTTestActionListViewController_testRunner));
}

@end
