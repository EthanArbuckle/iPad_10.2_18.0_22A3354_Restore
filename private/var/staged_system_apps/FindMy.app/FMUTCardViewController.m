@implementation FMUTCardViewController

- (_TtC6FindMy22FMUTCardViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC6FindMy22FMUTCardViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_selectionSubscription) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_returnSelection;
  v6 = type metadata accessor for FMSelectedSection(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_bypassWelcomeScreen) = 0;
  v7 = a3;

  result = (_TtC6FindMy22FMUTCardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMUTCardViewController.swift", 35, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy22FMUTCardViewController *v4;

  v4 = self;
  sub_1003480B4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy22FMUTCardViewController *v4;

  v4 = self;
  sub_1003482C8(a3);

}

- (void)handleCloseAction
{
  void *v2;
  _TtC6FindMy22FMUTCardViewController *v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content);
  if (v2)
  {
    v5 = v2;
    v4 = self;
    sub_1001FDE20();

  }
}

- (_TtC6FindMy22FMUTCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy22FMUTCardViewController *result;

  v4 = a4;
  result = (_TtC6FindMy22FMUTCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMUTCardViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_selectionSubscription));
  sub_100348F3C((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_returnSelection);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content));
}

@end
