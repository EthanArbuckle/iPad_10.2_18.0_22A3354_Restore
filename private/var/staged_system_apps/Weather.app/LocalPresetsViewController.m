@implementation LocalPresetsViewController

- (_TtC7Weather26LocalPresetsViewController)initWithCoder:(id)a3
{
  sub_1002966D4();
}

- (void)viewDidLoad
{
  _TtC7Weather26LocalPresetsViewController *v2;

  v2 = self;
  sub_100296730();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC7Weather26LocalPresetsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1002968C0((uint64_t)v7, a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  NSString v5;

  sub_100296944((uint64_t)self, a4);
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

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC7Weather26LocalPresetsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_1002969B8((uint64_t)v7, a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather26LocalPresetsViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_100296AB4(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  id v12;
  _TtC7Weather26LocalPresetsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (void (*)(char *, unint64_t, uint64_t))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_100296C08((uint64_t)v13, v11);

  (*(void (**)(void (*)(char *, unint64_t, uint64_t), uint64_t))(v8 + 8))(v11, v7);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC7Weather26LocalPresetsViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  v14 = a3;
  v15 = self;
  sub_100297144((uint64_t)v15, a4, (uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)didLongPressWithLongPressGesture:(id)a3
{
  id v4;
  _TtC7Weather26LocalPresetsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100297B60(v4);

}

- (_TtC7Weather26LocalPresetsViewController)initWithStyle:(int64_t)a3
{
  sub_100298264();
}

- (_TtC7Weather26LocalPresetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10029829C();
}

- (void).cxx_destruct
{
  sub_100298610((uint64_t)self + OBJC_IVAR____TtC7Weather26LocalPresetsViewController_currentAppState);
}

@end
