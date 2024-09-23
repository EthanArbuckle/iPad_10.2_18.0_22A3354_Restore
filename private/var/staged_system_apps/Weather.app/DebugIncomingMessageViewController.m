@implementation DebugIncomingMessageViewController

- (_TtC7Weather34DebugIncomingMessageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002BB534();
}

- (void)viewDidLoad
{
  _TtC7Weather34DebugIncomingMessageViewController *v2;

  v2 = self;
  sub_1002BB5F8();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC7Weather34DebugIncomingMessageViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1002BB8C0((uint64_t)v7, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather34DebugIncomingMessageViewController *v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1002BB964();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather34DebugIncomingMessageViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_1002BBA5C(v12);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1002BBD54);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1002BBD94);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather34DebugIncomingMessageViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_1002BBDC8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC7Weather34DebugIncomingMessageViewController)initWithStyle:(int64_t)a3
{
  sub_1002BCCD8();
}

- (_TtC7Weather34DebugIncomingMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1002BCD10();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController_notificationStore));
  v3 = (char *)self + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController_message;
  v4 = type metadata accessor for IncomingMessageEntity(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10009D420(OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController____lazy_storage___userInfo);
  sub_10009D420(OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController____lazy_storage___events);
  sub_10009D420(OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController____lazy_storage___notifications);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController____lazy_storage___dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController_mapView));
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC7Weather34DebugIncomingMessageViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1002BCEF4((uint64_t)v7, (uint64_t)a4);
  v9 = v8;

  swift_unknownObjectRelease(a4);
  return v9;
}

@end
