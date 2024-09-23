@implementation TextViewWrapper.TextView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_24A2A6624();
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_24A2A665C() & 1;
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  return (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView *)sub_24A2A6664(a4, x, y, width, height);
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithCoder:(id)a3
{
  return (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView *)sub_24A2A6740(a3);
}

@end
