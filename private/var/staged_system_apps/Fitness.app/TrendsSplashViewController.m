@implementation TrendsSplashViewController

- (_TtC10FitnessApp26TrendsSplashViewController)initWithAvailabilityManager:(id)a3
{
  return (_TtC10FitnessApp26TrendsSplashViewController *)sub_100160110(a3);
}

- (_TtC10FitnessApp24TrendsListViewController)listViewController
{
  return (_TtC10FitnessApp24TrendsListViewController *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController];
}

- (void)setListViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController];
  *(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController] = a3;
  v3 = a3;

}

- (void)viewDidLoad
{
  _TtC10FitnessApp26TrendsSplashViewController *v2;

  v2 = self;
  sub_10016043C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp26TrendsSplashViewController *v4;

  v4 = self;
  sub_1001609D4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10FitnessApp26TrendsSplashViewController *v4;

  v4 = self;
  sub_100160AC0(a3);

}

- (void)buttonTappedWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp26TrendsSplashViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001614F4();

}

- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC10FitnessApp26TrendsSplashViewController *result;

  result = (_TtC10FitnessApp26TrendsSplashViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsSplashViewController", 37, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC10FitnessApp26TrendsSplashViewController *result;

  v6 = a5;
  result = (_TtC10FitnessApp26TrendsSplashViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsSplashViewController", 37, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_observers]);
}

@end
