@implementation WFIconHostingView

- (WFIcon)icon
{
  return (WFIcon *)sub_2270880C4();
}

- (void)setIcon:(id)a3
{
  id v5;
  WFIconHostingView *v6;

  v5 = a3;
  v6 = self;
  sub_227088150(a3);

}

- (CGSize)iconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_227088368();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  double height;
  double width;
  WFIconHostingView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_2270883F0(width, height);

}

- (BOOL)useAccentColor
{
  return sub_227088578() & 1;
}

- (void)setUseAccentColor:(BOOL)a3
{
  WFIconHostingView *v4;

  v4 = self;
  sub_2270885F4(a3);

}

- (WFIconHostingView)initWithIcon:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  return (WFIconHostingView *)IconHostingView.init(icon:size:)(a3, width, height);
}

- (WFIconHostingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2270888B8();
}

+ (id)renderIcon:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = (void *)static IconHostingView.render(icon:with:)(v6, width, height);

  return v7;
}

- (WFIconHostingView)initWithFrame:(CGRect)a3
{
  IconHostingView.init(frame:)();
}

- (void).cxx_destruct
{

}

@end
