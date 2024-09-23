@implementation FMLostModeSummaryContentView

- (_TtC6FindMy28FMLostModeSummaryContentView)init
{
  return (_TtC6FindMy28FMLostModeSummaryContentView *)sub_10010D940();
}

- (_TtC6FindMy28FMLostModeSummaryContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10010F124();
}

- (void)didTryInteractWithDisabledMessageView
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMy28FMLostModeSummaryContentView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_1002B178C();

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC6FindMy28FMLostModeSummaryContentView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy28FMLostModeSummaryContentView *result;

  result = (_TtC6FindMy28FMLostModeSummaryContentView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMLostModeSummaryContentView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_notifyWhenFoundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_sendEmailUpdatesView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_phoneNumberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_emailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_messageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_disableButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_messageViewGestureRecognizer));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_delegate);
}

@end
