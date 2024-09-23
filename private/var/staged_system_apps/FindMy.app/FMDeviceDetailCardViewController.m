@implementation FMDeviceDetailCardViewController

- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC6FindMy32FMDeviceDetailCardViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_returnSelection;
  v6 = type metadata accessor for FMSelectedSection(0);
  swift_storeEnumTagMultiPayload(v5, v6, 11);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_selectionSubscription) = 0;
  v7 = a3;

  result = (_TtC6FindMy32FMDeviceDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMDeviceDetailCardViewController.swift", 45, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy32FMDeviceDetailCardViewController *v4;

  v4 = self;
  sub_1000656EC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy32FMDeviceDetailCardViewController *v4;

  v4 = self;
  sub_100065BF4(a3);

}

- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy32FMDeviceDetailCardViewController *result;

  v4 = a4;
  result = (_TtC6FindMy32FMDeviceDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMDeviceDetailCardViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_mediator));
  sub_100024F00((uint64_t)self + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_returnSelection);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_selectionSubscription));
}

@end
