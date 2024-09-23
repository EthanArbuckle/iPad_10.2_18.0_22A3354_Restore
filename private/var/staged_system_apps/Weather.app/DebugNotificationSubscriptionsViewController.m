@implementation DebugNotificationSubscriptionsViewController

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E000C();
}

- (void)viewDidLoad
{
  _TtC7Weather44DebugNotificationSubscriptionsViewController *v2;

  v2 = self;
  sub_1003E0090();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC7Weather44DebugNotificationSubscriptionsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1003E019C((uint64_t)v7, a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1003E024C);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1003E02AC);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather44DebugNotificationSubscriptionsViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1003E0368(v12);

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
  _TtC7Weather44DebugNotificationSubscriptionsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_1003E058C(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithStyle:(int64_t)a3
{
  sub_1003E1AD4();
}

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1003E1B0C();
}

- (void).cxx_destruct
{
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                          + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController_notificationsManager));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController_notificationStore));
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                          + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController_notificationSubscriptionManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController____lazy_storage___dateFormatter));
}

@end
