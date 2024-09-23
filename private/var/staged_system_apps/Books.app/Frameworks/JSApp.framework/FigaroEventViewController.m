@implementation FigaroEventViewController

- (_TtC5JSApp25FigaroEventViewController)initWithCoder:(id)a3
{
  _TtC5JSApp25FigaroEventViewController *result;

  result = (_TtC5JSApp25FigaroEventViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/FigaroEventViewController.swift", 37, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5JSApp25FigaroEventViewController *v2;

  v2 = self;
  sub_58628();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v4;

  v4 = &OBJC_IVAR____TtC5JSApp25FigaroEventViewController_eventFields;
  if (a4)
    v4 = &OBJC_IVAR____TtC5JSApp25FigaroEventViewController_baseFields;
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa + *v4))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4;
  NSString v5;

  if (a4)
    v4 = 0xEB0000000073646CLL;
  else
    v4 = 0xEC00000073646C65;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5JSApp25FigaroEventViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_58810(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5JSApp25FigaroEventViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_58CF0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5JSApp25FigaroEventViewController)initWithStyle:(int64_t)a3
{
  _TtC5JSApp25FigaroEventViewController *result;

  result = (_TtC5JSApp25FigaroEventViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroEventViewController", 31, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC5JSApp25FigaroEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5JSApp25FigaroEventViewController *result;

  v4 = a4;
  result = (_TtC5JSApp25FigaroEventViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroEventViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5JSApp25FigaroEventViewController_event));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5JSApp25FigaroEventViewController_eventFields));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5JSApp25FigaroEventViewController_baseFields));
}

@end
