@implementation FMItemDetailCardViewController

- (_TtC6FindMy30FMItemDetailCardViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC6FindMy30FMItemDetailCardViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_returnSelection;
  v6 = type metadata accessor for FMSelectedSection(0);
  swift_storeEnumTagMultiPayload(v5, v6, 16);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_selectionSubscription) = 0;
  v7 = a3;

  result = (_TtC6FindMy30FMItemDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMItemDetailCardViewController.swift", 43, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy30FMItemDetailCardViewController *v4;

  v4 = self;
  sub_100349A74(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy30FMItemDetailCardViewController *v4;

  v4 = self;
  sub_100349F4C(a3);

}

- (_TtC6FindMy30FMItemDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy30FMItemDetailCardViewController *result;

  v4 = a4;
  result = (_TtC6FindMy30FMItemDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMItemDetailCardViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_mediator));
  sub_100024F00((uint64_t)self + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_returnSelection);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_selectionSubscription));
}

@end
