@implementation ContentAvailabilityPlatterView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  nullsub_1(a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI30ContentAvailabilityPlatterView *result;

  sub_1D9D243F8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithCoder:(id)a3
{
  _TtC8VideosUI30ContentAvailabilityPlatterView *result;

  sub_1D9D244B8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_textLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_vibrantEffectView));
}

@end
