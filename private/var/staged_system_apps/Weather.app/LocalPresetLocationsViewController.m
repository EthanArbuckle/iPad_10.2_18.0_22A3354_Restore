@implementation LocalPresetLocationsViewController

- (_TtC7Weather34LocalPresetLocationsViewController)initWithCoder:(id)a3
{
  sub_10021C13C();
}

- (void)viewDidLoad
{
  _TtC7Weather34LocalPresetLocationsViewController *v2;

  v2 = self;
  sub_10021C198();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  sub_10021C2C8((uint64_t)self, a4);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_10021C334);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_10021C3E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_10021C368);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC7Weather34LocalPresetLocationsViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  v14 = sub_10021C428(v12);

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
  _TtC7Weather34LocalPresetLocationsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = a3;
  v13 = self;
  sub_10021C5A0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC7Weather34LocalPresetLocationsViewController)initWithStyle:(int64_t)a3
{
  sub_10021CE34();
}

- (_TtC7Weather34LocalPresetLocationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10021CE6C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000979AC((uint64_t)self + OBJC_IVAR____TtC7Weather34LocalPresetLocationsViewController_appState, type metadata accessor for PresetAppState);
  swift_bridgeObjectRelease();
  sub_1000986C4();
  swift_bridgeObjectRelease();
}

@end
