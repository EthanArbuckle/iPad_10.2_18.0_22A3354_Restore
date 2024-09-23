@implementation DebugNotificationDeliveryScheduleViewController

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1006E50D4();
}

- (void)viewDidLoad
{
  _TtC7Weather47DebugNotificationDeliveryScheduleViewController *v2;

  v2 = self;
  sub_1006E514C();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1006E5240((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  NSString v5;

  sub_1006E5278((uint64_t)self, a4);
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
  _TtC7Weather47DebugNotificationDeliveryScheduleViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1006E532C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithStyle:(int64_t)a3
{
  sub_1006E5E48();
}

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1006E5E80();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for DeliveryScheduleEntity(0);
  sub_100094FE8(v3);
  v4 = type metadata accessor for PrecipitationNotification(0);
  sub_100094FE8(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather47DebugNotificationDeliveryScheduleViewController____lazy_storage___dateFormatter));
}

@end
