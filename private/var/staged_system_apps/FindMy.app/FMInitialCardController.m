@implementation FMInitialCardController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy23FMInitialCardController *v4;

  v4 = self;
  sub_100011F34(a3);

}

- (_TtC6FindMy23FMInitialCardController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy23FMInitialCardController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy23FMInitialCardController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy23FMInitialCardController_discoveryCoordinator) = 0;
  v4 = a3;

  result = (_TtC6FindMy23FMInitialCardController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMInitialCardController.swift", 36, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy23FMInitialCardController *v4;

  v4 = self;
  sub_1003C8F88(a3);

}

- (_TtC6FindMy23FMInitialCardController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy23FMInitialCardController *result;

  v4 = a4;
  result = (_TtC6FindMy23FMInitialCardController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMInitialCardController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy23FMInitialCardController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy23FMInitialCardController_selectionSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMInitialCardController_discoveryCoordinator));
}

@end
