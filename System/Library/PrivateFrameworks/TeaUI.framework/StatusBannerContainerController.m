@implementation StatusBannerContainerController

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC5TeaUI31StatusBannerContainerController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B13BC668();

  return (UIViewController *)v3;
}

- (void)viewDidLoad
{
  _TtC5TeaUI31StatusBannerContainerController *v2;

  v2 = self;
  sub_1B13B0388();

}

- (_TtC5TeaUI31StatusBannerContainerController)initWithCoder:(id)a3
{
  StatusBannerContainerController.init(coder:)();
}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI31StatusBannerContainerController *v2;

  v2 = self;
  sub_1B14F4C14();

}

- (BOOL)_shouldOverlayTabBar
{
  _TtC5TeaUI31StatusBannerContainerController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1B14F4F00();

  return v3 & 1;
}

- (id)_hostingNavigationBar
{
  _TtC5TeaUI31StatusBannerContainerController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B14F4F58();

  return v3;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  id v2;

  sub_1B14F4FD4();
  return (UIViewController *)v2;
}

- (void)onStatusBannerTap
{
  _TtC5TeaUI31StatusBannerContainerController *v2;

  v2 = self;
  sub_1B14F5074();

}

- (_TtC5TeaUI31StatusBannerContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  StatusBannerContainerController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI31StatusBannerContainerController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI31StatusBannerContainerController_statusBannerViewController));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5TeaUI31StatusBannerContainerController *v6;

  v6 = self;
  StatusBannerContainerController.setEditing(_:animated:)(a3, a4);

}

- (BOOL)hidesBottomBarWhenPushed
{
  _TtC5TeaUI31StatusBannerContainerController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = StatusBannerContainerController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  _TtC5TeaUI31StatusBannerContainerController *v4;

  v4 = self;
  StatusBannerContainerController.hidesBottomBarWhenPushed.setter(a3);

}

- (UITabBarItem)tabBarItem
{
  _TtC5TeaUI31StatusBannerContainerController *v2;
  id v3;

  v2 = self;
  v3 = StatusBannerContainerController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5;
  _TtC5TeaUI31StatusBannerContainerController *v6;

  v5 = a3;
  v6 = self;
  StatusBannerContainerController.tabBarItem.setter(a3);

}

@end
