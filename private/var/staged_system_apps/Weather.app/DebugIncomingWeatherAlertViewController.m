@implementation DebugIncomingWeatherAlertViewController

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100565BA8();
}

- (void)viewDidLoad
{
  _TtC7Weather39DebugIncomingWeatherAlertViewController *v2;

  v2 = self;
  sub_100565C48();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_100565E00((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  NSString v5;

  sub_100565E5C((uint64_t)self, a4);
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather39DebugIncomingWeatherAlertViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_100565ED0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather39DebugIncomingWeatherAlertViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_1005660A0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather39DebugIncomingWeatherAlertViewController *v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_100566230();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithStyle:(int64_t)a3
{
  sub_100566AB4();
}

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100566AEC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController_alert;
  v4 = type metadata accessor for WeatherAlertEntity(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController_notifications));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController____lazy_storage___dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController_mapView));
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC7Weather39DebugIncomingWeatherAlertViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100566CA4((uint64_t)v7, (uint64_t)a4);
  v9 = v8;

  swift_unknownObjectRelease(a4);
  return v9;
}

@end
