@implementation EntryLinksViewController

- (_TtC10FitnessApp24EntryLinksViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp24EntryLinksViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_hostingController) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp24EntryLinksViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/EntryListViewController.swift", 40, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10FitnessApp24EntryLinksViewController *v2;

  v2 = self;
  sub_100584AAC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EntryLinksViewController();
  v4 = v9.receiver;
  -[EntryLinksViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationController", v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(CHActivityHistoryNavigationController);
    v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
    if (!v8)

    objc_msgSend(v8, "detachPalette");
  }
  else
  {
    v8 = v4;
  }

}

- (_TtC10FitnessApp24EntryLinksViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24EntryLinksViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24EntryLinksViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.EntryLinksViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_dashboardViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_catalogTipDataModel));
}

@end
