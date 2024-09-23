@implementation ProgressView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC5TeaUI12ProgressView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1B153B308(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC5TeaUI12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12ProgressView *)ProgressView.init(frame:)();
}

- (_TtC5TeaUI12ProgressView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI12ProgressView *)ProgressView.init(coder:)(a3);
}

@end
