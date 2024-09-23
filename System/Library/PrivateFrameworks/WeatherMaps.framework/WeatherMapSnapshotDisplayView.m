@implementation WeatherMapSnapshotDisplayView

- (void)layoutSubviews
{
  _TtC11WeatherMaps29WeatherMapSnapshotDisplayView *v2;

  v2 = self;
  sub_1DBE932C8();

}

- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView *)sub_1DBE938BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithCoder:(id)a3
{
  return (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView *)sub_1DBE93988(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___mapLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___baseLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___weatherOverlayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___effectOverlayLayer));
}

@end
