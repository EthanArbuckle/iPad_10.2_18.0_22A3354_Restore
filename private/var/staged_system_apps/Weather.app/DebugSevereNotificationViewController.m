@implementation DebugSevereNotificationViewController

- (_TtC7Weather37DebugSevereNotificationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E8EFC();
}

- (void)viewDidLoad
{
  _TtC7Weather37DebugSevereNotificationViewController *v2;

  v2 = self;
  sub_1003E8F7C();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1003E9070((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  NSString v5;

  sub_1003E90A8((uint64_t)self, a4);
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
  _TtC7Weather37DebugSevereNotificationViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1003E911C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (_TtC7Weather37DebugSevereNotificationViewController)initWithStyle:(int64_t)a3
{
  sub_1003E97D4();
}

- (_TtC7Weather37DebugSevereNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1003E980C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController_notification;
  v4 = type metadata accessor for SevereNotificationEntity(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10016C680((uint64_t)self + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController_content);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController____lazy_storage___dateFormatter));
}

@end
