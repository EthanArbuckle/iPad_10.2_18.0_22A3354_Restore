@implementation FigaroEventFieldViewController

- (_TtC5JSApp30FigaroEventFieldViewController)initWithCoder:(id)a3
{
  _TtC5JSApp30FigaroEventFieldViewController *result;

  result = (_TtC5JSApp30FigaroEventFieldViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/FigaroEventFieldViewController.swift", 42, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  NSString v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FigaroEventFieldViewController();
  v2 = v8.receiver;
  -[FigaroEventFieldViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = objc_msgSend(v2, "tableView", v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for FigaroEventFieldCell();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
    v7 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", ObjCClassFromMetadata, v7);

  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp30FigaroEventFieldViewController_data))[2];
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
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC5JSApp30FigaroEventFieldViewController_data);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 8 * a4 + 32) + 16);
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
  _TtC5JSApp30FigaroEventFieldViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_3E08C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC5JSApp30FigaroEventFieldViewController)initWithStyle:(int64_t)a3
{
  _TtC5JSApp30FigaroEventFieldViewController *result;

  result = (_TtC5JSApp30FigaroEventFieldViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroEventFieldViewController", 36, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC5JSApp30FigaroEventFieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5JSApp30FigaroEventFieldViewController *result;

  v4 = a4;
  result = (_TtC5JSApp30FigaroEventFieldViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroEventFieldViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5JSApp30FigaroEventFieldViewController_data));
}

@end
