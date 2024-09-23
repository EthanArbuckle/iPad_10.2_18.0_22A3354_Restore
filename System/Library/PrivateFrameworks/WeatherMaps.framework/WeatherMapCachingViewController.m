@implementation WeatherMapCachingViewController

- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFC851C();
}

- (void)viewDidLoad
{
  _TtC11WeatherMaps31WeatherMapCachingViewController *v2;

  v2 = self;
  sub_1DBFC8B64();

}

- (void)viewIsAppearing:(BOOL)a3
{
  self;
  sub_1DBFC8BE0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC11WeatherMaps31WeatherMapCachingViewController *v4;

  v4 = self;
  sub_1DBFC8C80(a3);

}

- (void)dealloc
{
  _TtC11WeatherMaps31WeatherMapCachingViewController *v2;

  v2 = self;
  WeatherMapCachingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_73();
  swift_unknownObjectWeakDestroy();
}

- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  WeatherMapCachingViewController.init(nibName:bundle:)();
}

@end
