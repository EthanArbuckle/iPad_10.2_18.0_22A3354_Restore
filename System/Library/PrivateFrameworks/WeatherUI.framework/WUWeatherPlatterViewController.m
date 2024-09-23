@implementation WUWeatherPlatterViewController

- (WUWeatherPlatterViewController)initWithLocation:(id)a3
{
  WUWeatherPlatterViewController *result;

  WeatherPlatterViewController.init(location:)(a3);
  return result;
}

- (WUWeatherPlatterViewController)initWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  WUWeatherPlatterViewController *result;
  uint64_t v7;

  v3 = sub_1B0005710();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B00056F8();
  WeatherPlatterViewController.init(url:)((uint64_t)v5);
  return result;
}

- (WUWeatherPlatterViewController)initWithCoder:(id)a3
{
  sub_1AFE8C008();
}

- (void)viewDidLoad
{
  WUWeatherPlatterViewController *v2;

  v2 = self;
  WeatherPlatterViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  WUWeatherPlatterViewController *v2;

  v2 = self;
  WeatherPlatterViewController.viewWillLayoutSubviews()();

}

- (WUWeatherPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B0008584();
  v5 = a4;
  WeatherPlatterViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

}

@end
