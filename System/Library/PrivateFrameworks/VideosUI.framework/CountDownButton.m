@implementation CountDownButton

- (_TtC8VideosUI15CountDownButton)initWithCoder:(id)a3
{
  sub_1D9D20E0C(a3);
  return 0;
}

- (void)configureWithLayoutProperties
{
  _TtC8VideosUI15CountDownButton *v2;

  v2 = self;
  sub_1D9D21A50();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI15CountDownButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  sub_1D9D21F00();
}

- (_TtC8VideosUI15CountDownButton)initWithFrame:(CGRect)a3
{
  sub_1D9D21F38();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15CountDownButton_image));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15CountDownButton____lazy_storage___countDownIndicator));
}

@end
