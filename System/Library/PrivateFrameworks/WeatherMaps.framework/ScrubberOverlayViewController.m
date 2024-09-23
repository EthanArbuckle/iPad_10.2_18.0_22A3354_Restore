@implementation ScrubberOverlayViewController

- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFCEDF4();
}

- (void)loadView
{
  _TtC11WeatherMaps29ScrubberOverlayViewController *v2;

  v2 = self;
  sub_1DBFCEEBC();

}

- (void)viewDidLoad
{
  _TtC11WeatherMaps29ScrubberOverlayViewController *v2;

  v2 = self;
  sub_1DBFCEF40();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC11WeatherMaps29ScrubberOverlayViewController *v4;

  v4 = self;
  sub_1DBFCF2B0(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC11WeatherMaps29ScrubberOverlayViewController *v2;

  v2 = self;
  sub_1DBFCF450();

}

- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  sub_1DBFD037C();
}

- (void).cxx_destruct
{
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_scrubberForecastHintView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_hideTimer));
}

@end
