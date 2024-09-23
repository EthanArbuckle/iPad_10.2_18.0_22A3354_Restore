@implementation DebugNotificationFetchSchedulesViewController

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1008DEC98();
}

- (void)viewDidLoad
{
  _TtC7Weather45DebugNotificationFetchSchedulesViewController *v2;

  v2 = self;
  sub_1008DED10();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1008DEE10();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather45DebugNotificationFetchSchedulesViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_1008DEE44(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithStyle:(int64_t)a3
{
  sub_1008DF48C();
}

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1008DF4C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Weather45DebugNotificationFetchSchedulesViewController_fetchSchedules));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather45DebugNotificationFetchSchedulesViewController____lazy_storage___dateFormatter));
}

@end
