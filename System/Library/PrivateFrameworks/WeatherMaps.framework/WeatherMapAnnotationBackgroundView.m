@implementation WeatherMapAnnotationBackgroundView

- (double)_cornerRadius
{
  _TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1DBFC189C();
  v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  _TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *v4;

  v4 = self;
  sub_1DBFC12C4(a3);

}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)init
{
  return (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *)sub_1DBFC1990();
}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *)sub_1DBFC1B18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFC1C54();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *v2;

  v2 = self;
  sub_1DBFC1D58();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_materialView));
  sub_1DBFC2270((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_background);
}

@end
