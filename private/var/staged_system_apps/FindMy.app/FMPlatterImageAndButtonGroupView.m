@implementation FMPlatterImageAndButtonGroupView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleLabel));
}

- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A703C();
}

- (void)setupSubviews
{
  _TtC6FindMy32FMPlatterImageAndButtonGroupView *v2;

  v2 = self;
  sub_1003A46A4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy32FMPlatterImageAndButtonGroupView *v6;

  v5 = a3;
  v6 = self;
  sub_1003A6D5C((uint64_t)a3);

}

- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy32FMPlatterImageAndButtonGroupView *result;

  result = (_TtC6FindMy32FMPlatterImageAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterImageAndButtonGroupView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_buttonSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_iconView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_actionButtonOnlyShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_secondaryActionButtonOnlyShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_bothActionButtonsShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_bothActionButtonHiddenConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleHiddenConstraints));
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitle]);
}

@end
