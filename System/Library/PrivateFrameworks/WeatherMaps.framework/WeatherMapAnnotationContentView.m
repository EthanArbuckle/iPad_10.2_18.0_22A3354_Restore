@implementation WeatherMapAnnotationContentView

- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBE9411C();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps31WeatherMapAnnotationContentView *v2;

  v2 = self;
  sub_1DBE941A8();

}

- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithFrame:(CGRect)a3
{
  sub_1DBE94290();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView_annotation));
  sub_1DBE94424((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView____lazy_storage___foregroundView));
}

@end
