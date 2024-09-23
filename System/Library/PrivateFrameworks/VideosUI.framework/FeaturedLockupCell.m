@implementation FeaturedLockupCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI18FeaturedLockupCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  sub_1DA00E590(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC8VideosUI18FeaturedLockupCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI18FeaturedLockupCell *result;

  sub_1DA00F528();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI18FeaturedLockupCell)initWithCoder:(id)a3
{
  _TtC8VideosUI18FeaturedLockupCell *result;

  sub_1DA00F5A0((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
