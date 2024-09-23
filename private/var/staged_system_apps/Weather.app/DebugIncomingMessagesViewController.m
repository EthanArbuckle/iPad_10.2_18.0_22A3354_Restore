@implementation DebugIncomingMessagesViewController

- (_TtC7Weather35DebugIncomingMessagesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10048FB8C();
}

- (void)viewDidLoad
{
  _TtC7Weather35DebugIncomingMessagesViewController *v2;

  v2 = self;
  sub_10048FC04();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_10048FCFC();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  NSString v4;

  sub_10048FD30();
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather35DebugIncomingMessagesViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_10048FD88(v12);

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
  _TtC7Weather35DebugIncomingMessagesViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_100490240();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC7Weather35DebugIncomingMessagesViewController)initWithStyle:(int64_t)a3
{
  sub_10049040C();
}

- (_TtC7Weather35DebugIncomingMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100490444();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC7Weather35DebugIncomingMessagesViewController_notificationStore));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Weather35DebugIncomingMessagesViewController_messages));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather35DebugIncomingMessagesViewController____lazy_storage___dateFormatter));
}

@end
