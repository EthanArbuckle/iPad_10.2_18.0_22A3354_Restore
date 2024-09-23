@implementation ScrollableStackViewContainer

- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6A9F38();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI28ScrollableStackViewContainer *v2;

  v2 = self;
  sub_22B6A97F8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI28ScrollableStackViewContainer *v6;

  v5 = a3;
  v6 = self;
  sub_22B6A993C(a3);

}

- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI28ScrollableStackViewContainer *result;

  result = (_TtC9SeymourUI28ScrollableStackViewContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_stackViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_visualEffectView));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC9SeymourUI28ScrollableStackViewContainer *v5;

  v4 = a3;
  v5 = self;
  sub_22B6A9CBC(v4);

}

@end
