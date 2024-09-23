@implementation JSAFigaroSummaryViewController

- (JSAFigaroSummaryViewController)init
{
  return (JSAFigaroSummaryViewController *)FigaroSummaryViewController.init()();
}

- (JSAFigaroSummaryViewController)initWithCoder:(id)a3
{
  JSAFigaroSummaryViewController *result;

  result = (JSAFigaroSummaryViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/FigaroSummaryViewController.swift", 39, 2, 131, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  JSAFigaroSummaryViewController *v2;

  v2 = self;
  sub_6D14C();

}

- (void)infoTapped:(id)a3
{
  id v4;
  JSAFigaroSummaryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_6E380();

}

- (void)trashTapped:(id)a3
{
  id v4;
  JSAFigaroSummaryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_6E4A0();

}

- (void)valueChanged:(id)a3
{
  id v4;
  JSAFigaroSummaryViewController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = -[JSAFigaroSummaryViewController tableView](v5, "tableView");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "reloadData");

  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  id v6;
  JSAFigaroSummaryViewController *v7;
  double Height;
  CGRect v10;

  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___JSAFigaroSummaryViewController_toolbar);
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v10);

  return Height;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR___JSAFigaroSummaryViewController_toolbar));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  JSAFigaroSummaryViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_6E5E8();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  JSAFigaroSummaryViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_6D888(v11);

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
  JSAFigaroSummaryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_6DAB8(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (JSAFigaroSummaryViewController)initWithStyle:(int64_t)a3
{
  JSAFigaroSummaryViewController *result;

  result = (JSAFigaroSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroSummaryViewController", 33, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (JSAFigaroSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  JSAFigaroSummaryViewController *result;

  v4 = a4;
  result = (JSAFigaroSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.FigaroSummaryViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___JSAFigaroSummaryViewController_experienceEvents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___JSAFigaroSummaryViewController_performanceEvents));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___JSAFigaroSummaryViewController_segmentedControl));

}

@end
