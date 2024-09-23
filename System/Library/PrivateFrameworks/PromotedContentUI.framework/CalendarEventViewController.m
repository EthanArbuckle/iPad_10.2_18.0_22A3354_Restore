@implementation CalendarEventViewController

- (void)viewDidLoad
{
  _TtC17PromotedContentUI27CalendarEventViewController *v2;

  v2 = self;
  sub_1B12E1EE8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC17PromotedContentUI27CalendarEventViewController *v4;

  v4 = self;
  sub_1B12E2564(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC17PromotedContentUI27CalendarEventViewController *v4;

  v4 = self;
  sub_1B12E2B7C(a3);

}

- (_TtC17PromotedContentUI27CalendarEventViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B12E3530();
}

- (_TtC17PromotedContentUI27CalendarEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17PromotedContentUI27CalendarEventViewController *result;

  v4 = a4;
  result = (_TtC17PromotedContentUI27CalendarEventViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_actionResult;
  v4 = sub_1B137225C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_eventStore));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B12D0D40((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_backgroundedTime, (uint64_t *)&unk_1ED3893B0);
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_actionDelegate);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6;
  _TtC17PromotedContentUI27CalendarEventViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1B12E3650(a4);

}

@end
