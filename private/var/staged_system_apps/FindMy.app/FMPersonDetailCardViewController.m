@implementation FMPersonDetailCardViewController

- (_TtC6FindMy32FMPersonDetailCardViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy32FMPersonDetailCardViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_conditionsSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_selectionSubscription) = 0;
  v4 = a3;

  result = (_TtC6FindMy32FMPersonDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPersonDetailCardViewController.swift", 45, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy32FMPersonDetailCardViewController *v4;

  v4 = self;
  sub_10041F074(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy32FMPersonDetailCardViewController *v4;

  v4 = self;
  sub_10041F82C(a3);

}

- (_TtC6FindMy32FMPersonDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy32FMPersonDetailCardViewController *result;

  v4 = a4;
  result = (_TtC6FindMy32FMPersonDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPersonDetailCardViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_conditionsSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_selectionSubscription));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.tabBar[OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_selectedPersonIdentifier]);
}

@end
