@implementation WeatherMapAnnotationContentBackgroundView

- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFD7B9C();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView *v2;

  v2 = self;
  sub_1DBFD7C44();

}

- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithFrame:(CGRect)a3
{
  sub_1DBFD7E58();
}

- (void).cxx_destruct
{
  sub_1DBF4F710((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_model, type metadata accessor for WeatherMapAnnotationContentViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_scaleLayer));
}

@end
