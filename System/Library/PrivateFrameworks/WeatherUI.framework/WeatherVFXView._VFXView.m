@implementation WeatherVFXView._VFXView

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3
{
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1AFB4402C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *v2;

  v2 = self;
  sub_1AFAC3670();

}

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v8 = sub_1B0008470();
  else
    v8 = 0;
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1AFC152EC(v8, x, y, width, height);
}

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithCoder:(id)a3
{
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1AFC15478(a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
