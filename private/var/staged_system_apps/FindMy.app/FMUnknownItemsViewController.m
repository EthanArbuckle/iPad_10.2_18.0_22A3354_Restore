@implementation FMUnknownItemsViewController

- (_TtC6FindMy28FMUnknownItemsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy28FMUnknownItemsViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_deviceSubscription) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_shownLandingView) = 0;
  v4 = a3;

  result = (_TtC6FindMy28FMUnknownItemsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMUnknownItemsViewController.swift", 41, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy28FMUnknownItemsViewController *v4;

  v4 = self;
  sub_100387C54(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy28FMUnknownItemsViewController *v4;

  v4 = self;
  sub_100387FBC(a3);

}

- (_TtC6FindMy28FMUnknownItemsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy28FMUnknownItemsViewController *result;

  v4 = a4;
  result = (_TtC6FindMy28FMUnknownItemsViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMUnknownItemsViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_selectionSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_deviceSubscription));
}

@end
