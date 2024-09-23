@implementation BaseCollectionReusableView

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8VideosUI26BaseCollectionReusableView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1D9F8FC24();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI26BaseCollectionReusableView *v2;

  v2 = self;
  sub_1D9F8FC88();

}

- (_TtC8VideosUI26BaseCollectionReusableView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26BaseCollectionReusableView *result;

  sub_1D9F8FD38();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26BaseCollectionReusableView)initWithCoder:(id)a3
{
  _TtC8VideosUI26BaseCollectionReusableView *result;

  sub_1D9F8FD9C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
