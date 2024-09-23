@implementation WeatherMapAnnotationLowHighLabelsView

- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFD0A14();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView *v2;

  v2 = self;
  sub_1DBFD0AD0();

}

- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithFrame:(CGRect)a3
{
  sub_1DBFD0EAC();
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_model);
  objc_release(*(id *)((char *)&self->super._animationInfo
                     + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_model));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_lowLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_highLabel));
}

@end
