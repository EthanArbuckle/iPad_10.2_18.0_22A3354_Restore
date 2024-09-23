@implementation DefaultsViewController

- (_TtC7Measure22DefaultsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure22DefaultsViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure22DefaultsViewController_cancellables) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC7Measure22DefaultsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/DefaultsViewController.swift", 36, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7Measure22DefaultsViewController *v2;

  v2 = self;
  sub_1000EAB48();

}

- (_TtC7Measure22DefaultsViewController)initWithStyle:(int64_t)a3
{
  _TtC7Measure22DefaultsViewController *result;

  result = (_TtC7Measure22DefaultsViewController *)_swift_stdlib_reportUnimplementedInitializer("Measure.DefaultsViewController", 30, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC7Measure22DefaultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Measure22DefaultsViewController *result;

  v4 = a4;
  result = (_TtC7Measure22DefaultsViewController *)_swift_stdlib_reportUnimplementedInitializer("Measure.DefaultsViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure22DefaultsViewController_cancellables));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 24 * a4 + 48) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Measure22DefaultsViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000EAF3C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return self;
  }
  v5 = *(_QWORD *)(v4 + 24 * a4 + 40);
  if (v5)
  {
    swift_bridgeObjectRetain(v5);
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC7Measure22DefaultsViewController *v13;
  unint64_t v14;
  double result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  double v23;
  uint64_t v24;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
  v12 = a3;
  v13 = self;
  v14 = IndexPath.section.getter();
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v14 >= *(_QWORD *)(v11 + 16))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v16 = *(_QWORD *)(v11 + 24 * v14 + 48);
  v17 = swift_bridgeObjectRetain(v16);
  v18 = IndexPath.row.getter(v17);
  if ((v18 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v18 >= *(_QWORD *)(v16 + 16))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v19 = v16 + 48 * v18;
  v20 = *(_QWORD *)(v19 + 64);
  v21 = *(unsigned __int8 *)(v19 + 72);

  swift_bridgeObjectRelease(v16);
  v22 = 216.0;
  if (!v20)
    v22 = 54.0;
  if (v21)
    v23 = v22;
  else
    v23 = 54.0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v23;
}

@end
