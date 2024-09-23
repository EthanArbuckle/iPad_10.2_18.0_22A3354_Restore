@implementation WeatherMapSupplementaryOverlayContainer

- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer *)sub_1DBED0074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBED0160();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1DBED01E0((uint64_t)a4, x, y);

  return v10;
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer *v2;

  v2 = self;
  sub_1DBED02E4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer_overlayView));
}

@end
