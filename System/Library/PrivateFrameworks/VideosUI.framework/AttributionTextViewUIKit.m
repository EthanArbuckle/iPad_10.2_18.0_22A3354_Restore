@implementation AttributionTextViewUIKit

- (void)handleSelected:(id)a3
{
  id v4;
  _TtC8VideosUI24AttributionTextViewUIKit *v5;

  v4 = a3;
  v5 = self;
  sub_1D9F8C3B8(v4);

}

- (_TtC8VideosUI24AttributionTextViewUIKit)init
{
  _TtC8VideosUI24AttributionTextViewUIKit *result;

  sub_1D9F8C598();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI24AttributionTextViewUIKit)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F8C628();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC8VideosUI24AttributionTextViewUIKit *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1D9F8C6DC(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI24AttributionTextViewUIKit *v2;

  v2 = self;
  sub_1D9F8C764();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI24AttributionTextViewUIKit)initWithFrame:(CGRect)a3
{
  sub_1D9F8CD8C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
