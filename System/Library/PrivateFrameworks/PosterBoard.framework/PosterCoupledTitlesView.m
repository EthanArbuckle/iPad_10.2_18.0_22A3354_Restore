@implementation PosterCoupledTitlesView

- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterCoupledTitlesView *)sub_1CBAF2108(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithCoder:(id)a3
{
  id v4;
  _TtC11PosterBoard23PosterCoupledTitlesView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_titleLabelSpacingFromTopEdge) = (Class)0x4042000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_footerLabelSpacingFromBottomEdge) = (Class)0x4024000000000000;
  v4 = a3;

  result = (_TtC11PosterBoard23PosterCoupledTitlesView *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard23PosterCoupledTitlesView *v2;

  v2 = self;
  sub_1CBAF2898();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_lockFooterLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_homeFooterLabel));
}

@end
