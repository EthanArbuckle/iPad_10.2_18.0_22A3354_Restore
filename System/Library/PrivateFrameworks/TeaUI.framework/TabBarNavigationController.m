@implementation TabBarNavigationController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26TabBarNavigationController_rootViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26TabBarNavigationController_animateAlongsideTabBarSnapshot));
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  UINavigationController *v8;
  UIViewController *v9;
  _TtC5TeaUI26TabBarNavigationController *v10;

  v8 = (UINavigationController *)a3;
  v9 = (UIViewController *)a4;
  v10 = self;
  TabBarNavigationController.navigationController(_:willShow:animated:)(v8, v9, a5);

}

- (void)viewDidLoad
{
  _TtC5TeaUI26TabBarNavigationController *v2;

  v2 = self;
  TabBarNavigationController.viewDidLoad()();

}

- (UITabBarItem)tabBarItem
{
  _TtC5TeaUI26TabBarNavigationController *v2;
  id v3;

  v2 = self;
  v3 = TabBarNavigationController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (NSArray)viewControllers
{
  _TtC5TeaUI26TabBarNavigationController *v2;
  void *v3;

  v2 = self;
  TabBarNavigationController.viewControllers.getter();

  sub_1B13D5C64();
  v3 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI26TabBarNavigationController *v4;

  v4 = self;
  TabBarNavigationController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5TeaUI26TabBarNavigationController *v4;

  v4 = self;
  TabBarNavigationController.viewDidAppear(_:)(a3);

}

- (_TtC5TeaUI26TabBarNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B161F2E4();
}

- (void)setViewControllers:(id)a3
{
  _TtC5TeaUI26TabBarNavigationController *v4;

  sub_1B13D5C64();
  sub_1B16B9B54();
  v4 = self;
  TabBarNavigationController.viewControllers.setter();

}

- (void)setTabBarItem:(id)a3
{
  id v5;
  _TtC5TeaUI26TabBarNavigationController *v6;

  v5 = a3;
  v6 = self;
  TabBarNavigationController.tabBarItem.setter(a3);

}

- (NSString)description
{
  _TtC5TeaUI26TabBarNavigationController *v2;
  void *v3;

  v2 = self;
  TabBarNavigationController.description.getter();

  v3 = (void *)sub_1B16B983C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  id v4;

  v4 = a3;
  TabBarNavigationController.init(rootViewController:navigationBarClass:)();
}

- (_TtC5TeaUI26TabBarNavigationController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  TabBarNavigationController.init(rootViewController:)();
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v6;
  _TtC5TeaUI26TabBarNavigationController *v7;
  id v8;
  _TtC5TeaUI26TabBarNavigationController *v9;
  _OWORD v10[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a3;
    v9 = self;
  }
  TabBarNavigationController.show(_:sender:)(a3, (uint64_t)v10);

  sub_1B13F77F4((uint64_t)v10);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  UIViewController *v9;
  _TtC5TeaUI26TabBarNavigationController *v10;

  v7 = a3;
  v8 = a4;
  v10 = self;
  TabBarNavigationController.navigationController(_:didShow:animated:)(&v10->super.super.super, v9, 0);

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC5TeaUI26TabBarNavigationController *v13;
  id v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = TabBarNavigationController.navigationController(_:animationControllerFor:from:to:)((uint64_t)v10, a4, (uint64_t)v11, v12);

  return v14;
}

@end
