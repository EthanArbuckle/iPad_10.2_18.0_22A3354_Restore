@implementation PopoverViewController

- (void)dealloc
{
  _TtC11WeatherMaps21PopoverViewController *v2;

  v2 = self;
  sub_1DBEB985C();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps21PopoverViewController_delegate);
  v2 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_3_15(v2);
  v3 = sub_1DBFF6B8C();
  OUTLINED_FUNCTION_3_15(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAFE170);
  OUTLINED_FUNCTION_3_15(v4);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___locationLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___timeLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___conditionLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___temperatureRangeLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___temperatureLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___viewLocationButton);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___openLocationButton);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21PopoverViewController____lazy_storage___separator);
  swift_release();
}

- (_TtC11WeatherMaps21PopoverViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEB9A20();
}

- (void)loadView
{
  _TtC11WeatherMaps21PopoverViewController *v2;

  v2 = self;
  sub_1DBEB9B60();

}

- (void)viewDidLoad
{
  _TtC11WeatherMaps21PopoverViewController *v2;

  v2 = self;
  sub_1DBEB9C24();

}

- (void)viewDidLayoutSubviews
{
  _TtC11WeatherMaps21PopoverViewController *v2;

  v2 = self;
  sub_1DBEB9EF8();

}

- (_TtC11WeatherMaps21PopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  sub_1DBEBA608();
}

@end
