@implementation FMMeCardViewController

- (_TtC6FindMy22FMMeCardViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy22FMMeCardViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_selectionSubscription) = 0;
  v4 = a3;

  result = (_TtC6FindMy22FMMeCardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMMeCardViewController.swift", 35, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy22FMMeCardViewController *v4;

  v4 = self;
  sub_1002C3A80(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy22FMMeCardViewController *v4;

  v4 = self;
  sub_1002C3C9C(a3);

}

- (_TtC6FindMy22FMMeCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy22FMMeCardViewController *result;

  v4 = a4;
  result = (_TtC6FindMy22FMMeCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMMeCardViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_mediator));
  sub_100024F00((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_previousSelection);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_selectionSubscription));
}

@end
