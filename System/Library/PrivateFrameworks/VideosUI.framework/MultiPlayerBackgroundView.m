@implementation MultiPlayerBackgroundView

- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithCoder:(id)a3
{
  _TtC8VideosUI25MultiPlayerBackgroundView *result;

  sub_1D9DDC32C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI25MultiPlayerBackgroundView *v2;

  v2 = self;
  sub_1D9DDC3B0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithFrame:(CGRect)a3
{
  sub_1D9DDC460();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___dimmingView));
  swift_release();
}

@end
