@implementation BlurImageView

- (_TtC17PromotedContentUI13BlurImageView)initWithCoder:(id)a3
{
  id v4;
  _TtC17PromotedContentUI13BlurImageView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___visualEffectView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___blurImageView) = 0;
  v4 = a3;

  result = (_TtC17PromotedContentUI13BlurImageView *)sub_1B1373174();
  __break(1u);
  return result;
}

- (_TtC17PromotedContentUI13BlurImageView)initWithFrame:(CGRect)a3
{
  _TtC17PromotedContentUI13BlurImageView *result;

  result = (_TtC17PromotedContentUI13BlurImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___blurImageView));
}

@end
