@implementation TabBarController

- (NSArray)viewControllers
{
  _TtC5TeaUI16TabBarController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TabBarController.viewControllers.getter();

  if (v3)
  {
    sub_1B13A1818(0, (unint64_t *)&qword_1ED183800);
    v4 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5TeaUI16TabBarController *v4;

  v4 = self;
  TabBarController.viewDidAppear(_:)(a3);

}

- (void)viewDidLoad
{
  _TtC5TeaUI16TabBarController *v2;

  v2 = self;
  TabBarController.viewDidLoad()();

}

- (_TtC5TeaUI16TabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  TabBarController.init(coder:)();
}

- (void)setViewControllers:(id)a3
{
  unint64_t v3;
  _TtC5TeaUI16TabBarController *v5;

  v3 = (unint64_t)a3;
  if (a3)
  {
    sub_1B13A1818(0, (unint64_t *)&qword_1ED183800);
    v3 = sub_1B16B9B54();
  }
  v5 = self;
  TabBarController.viewControllers.setter(v3);

}

- (_TtC5TeaUI16TabBarController)initWithTabs:(id)a3
{
  sub_1B13A1818(0, &qword_1EEF362F8);
  sub_1B16B9B54();
  TabBarController.init(tabs:)();
}

- (_TtC5TeaUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  TabBarController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI16TabBarController_extendedDelegate);
  sub_1B13F15EC((uint64_t)self + OBJC_IVAR____TtC5TeaUI16TabBarController_styler, qword_1ED179A60, &qword_1ED179A58);
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  UIViewController *v7;
  _TtC5TeaUI16TabBarController *v8;

  v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  TabBarController.tabBarController(_:shouldSelect:)(&v8->super, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  UIViewController *v7;
  _TtC5TeaUI16TabBarController *v8;

  v6 = a3;
  v7 = (UIViewController *)a4;
  v8 = self;
  TabBarController.tabBarController(_:didSelect:)(&v8->super, v7);

}

@end
