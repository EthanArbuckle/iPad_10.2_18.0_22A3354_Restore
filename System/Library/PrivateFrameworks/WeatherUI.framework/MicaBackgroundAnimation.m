@implementation MicaBackgroundAnimation

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9WeatherUI23MicaBackgroundAnimation *v10;
  id v11;

  v6 = sub_1B0008584();
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = MicaBackgroundAnimation.action(for:forKey:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC9WeatherUI23MicaBackgroundAnimation *v5;

  v4 = a3;
  v5 = self;
  MicaBackgroundAnimation.layoutSublayers(of:)((CALayer)v4);

}

- (_TtC9WeatherUI23MicaBackgroundAnimation)init
{
  MicaBackgroundAnimation.init()();
}

- (void).cxx_destruct
{
  void *v3;

  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WeatherUI23MicaBackgroundAnimation_rootMicaLayer);

}

@end
