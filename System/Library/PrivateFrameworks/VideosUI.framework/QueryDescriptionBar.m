@implementation QueryDescriptionBar

- (void)singlePressWithGesture:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9EE0698();

  OUTLINED_FUNCTION_4_3(v5);
}

- (_TtC8VideosUI19QueryDescriptionBar)init
{
  _TtC8VideosUI19QueryDescriptionBar *result;

  sub_1D9EE074C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI19QueryDescriptionBar)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9EE07F4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI19QueryDescriptionBar *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1D9EE0E9C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI19QueryDescriptionBar *v2;

  v2 = self;
  sub_1D9EE127C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI19QueryDescriptionBar)initWithFrame:(CGRect)a3
{
  sub_1D9EE2104();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_delegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar____lazy_storage___singlePressGesture);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_queryDescriptionBannerText);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_queryDescriptionBackgroundView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_additionalInformationView));
}

@end
