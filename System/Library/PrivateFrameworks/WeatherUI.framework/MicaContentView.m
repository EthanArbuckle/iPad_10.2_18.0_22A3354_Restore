@implementation MicaContentView

- (_TtC9WeatherUI15MicaContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AFFA19DC();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC9WeatherUI15MicaContentView *v6;

  v5 = a3;
  v6 = self;
  MicaContentView.willMove(toWindow:)((UIWindow_optional *)a3);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC9WeatherUI15MicaContentView *v5;

  v4 = a3;
  v5 = self;
  MicaContentView.layoutSublayers(of:)((CALayer)v4);

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC9WeatherUI15MicaContentView *v7;
  id v8;

  sub_1B0008584();
  v6 = a3;
  v7 = self;
  v8 = MicaContentView.action(for:forKey:)();

  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC9WeatherUI15MicaContentView)initWithFrame:(CGRect)a3
{
  MicaContentView.init(frame:)();
}

- (void).cxx_destruct
{

}

@end
