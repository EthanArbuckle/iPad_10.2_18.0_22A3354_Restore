@implementation MediaShowcaseHostingView

- (_TtC8VideosUI24MediaShowcaseHostingView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI24MediaShowcaseHostingView *)sub_1D9F8F018();
}

- (_TtC8VideosUI24MediaShowcaseHostingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F8F094();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI24MediaShowcaseHostingView *v7;
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
  sub_1D9F8F120(a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
