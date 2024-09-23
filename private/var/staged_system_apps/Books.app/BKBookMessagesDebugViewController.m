@implementation BKBookMessagesDebugViewController

- (BKBookMessagesDebugViewController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_manager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKBookMessagesDebugViewController_propertyConfiguration) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_configurations) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_properties) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BookMessagesDebugViewController();
  return -[BKBookMessagesDebugViewController initWithStyle:](&v3, "initWithStyle:", 2);
}

- (BKBookMessagesDebugViewController)initWithCoder:(id)a3
{
  id v4;
  BKBookMessagesDebugViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_manager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKBookMessagesDebugViewController_propertyConfiguration) = 0;
  v4 = a3;

  result = (BKBookMessagesDebugViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/BookMessagesDebugViewController.swift", 43, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  BKBookMessagesDebugViewController *v2;

  v2 = self;
  BookMessagesDebugViewController.viewDidLoad()();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  BKBookMessagesDebugViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = _s5Books31BookMessagesDebugViewControllerC05tableE0_21numberOfRowsInSectionSiSo07UITableE0C_SitF_0();

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  BKBookMessagesDebugViewController *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v5 = a3;
  v6 = self;
  _s5Books31BookMessagesDebugViewControllerC05tableE0_23titleForHeaderInSectionSSSgSo07UITableE0C_SitF_0();
  v8 = v7;

  if (v8)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BKBookMessagesDebugViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)BookMessagesDebugViewController.tableView(_:cellForRowAt:)(v11);

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
  BKBookMessagesDebugViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  BookMessagesDebugViewController.tableView(_:didSelectRowAt:)(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BKBookMessagesDebugViewController)initWithStyle:(int64_t)a3
{
  BKBookMessagesDebugViewController *result;

  result = (BKBookMessagesDebugViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookMessagesDebugViewController", 37, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (BKBookMessagesDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKBookMessagesDebugViewController *result;

  v4 = a4;
  result = (BKBookMessagesDebugViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookMessagesDebugViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKBookMessagesDebugViewController_configurations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKBookMessagesDebugViewController_properties));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___BKBookMessagesDebugViewController_propertyConfiguration));
}

@end
