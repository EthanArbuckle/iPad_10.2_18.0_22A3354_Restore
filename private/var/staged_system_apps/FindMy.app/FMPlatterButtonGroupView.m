@implementation FMPlatterButtonGroupView

- (_TtC6FindMy24FMPlatterButtonGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100166B30();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy24FMPlatterButtonGroupView *v6;

  v5 = a3;
  v6 = self;
  sub_1001668E8((uint64_t)a3);

}

- (_TtC6FindMy24FMPlatterButtonGroupView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy24FMPlatterButtonGroupView *result;

  result = (_TtC6FindMy24FMPlatterButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterButtonGroupView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_buttonSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_contentView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy24FMPlatterButtonGroupView_actionButtonShowingConstraints));
}

@end
