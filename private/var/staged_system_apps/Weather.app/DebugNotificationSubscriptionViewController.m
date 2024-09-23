@implementation DebugNotificationSubscriptionViewController

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004E2524();
}

- (void)viewDidLoad
{
  _TtC7Weather43DebugNotificationSubscriptionViewController *v2;

  v2 = self;
  sub_1004E25E8();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC7Weather43DebugNotificationSubscriptionViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1004E279C((uint64_t)v7, a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  NSString v5;

  sub_1004E28F4((uint64_t)self, a4);
  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather43DebugNotificationSubscriptionViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1004E29AC(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather43DebugNotificationSubscriptionViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_1004E2B24();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithStyle:(int64_t)a3
{
  sub_1004E3D2C();
}

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1004E3D64();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController_subscription;
  v4 = type metadata accessor for SubscriptionEntity(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100021AA4((uint64_t)self+ OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___fetchSchedule, &qword_100BE8E60);
  sub_100021AA4((uint64_t)self+ OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___deliverySchedule, &qword_100BE8E58);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___dateFormatter));
}

@end
