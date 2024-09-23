@implementation WeatherMapCircularGradientLayer

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)init
{
  return (_TtC11WeatherMaps31WeatherMapCircularGradientLayer *)sub_1DBF0B33C();
}

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1DBFF8B18();
  swift_unknownObjectRelease();
  return (_TtC11WeatherMaps31WeatherMapCircularGradientLayer *)sub_1DBF0B500(v4);
}

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF0B694();
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC11WeatherMaps31WeatherMapCircularGradientLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF0B7B4((uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapCircularGradientLayer_indicatorColor));
  swift_bridgeObjectRelease();
}

@end
