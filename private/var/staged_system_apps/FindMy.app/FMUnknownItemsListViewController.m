@implementation FMUnknownItemsListViewController

- (_TtC6FindMy32FMUnknownItemsListViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC6FindMy32FMUnknownItemsListViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC6FindMy32FMUnknownItemsListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMUnknownItemsListViewController.swift", 45, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FMUnknownItemsListViewController();
  -[FMBaseContentViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy32FMUnknownItemsListViewController *v4;

  v4 = self;
  sub_1004278A4(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy32FMUnknownItemsListViewController *v4;

  v4 = self;
  sub_100427A78(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMUnknownItemsListViewController();
  v4 = v5.receiver;
  -[FMUnknownItemsListViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  sub_1001E7C78();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_dataSource));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_delegate);
}

@end
