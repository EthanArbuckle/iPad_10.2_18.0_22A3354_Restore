@implementation TabBarContainerController

- (_TtC5TeaUI25TabBarContainerController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B167E7FC();
}

- (void)viewDidLoad
{
  _TtC5TeaUI25TabBarContainerController *v2;

  v2 = self;
  sub_1B167E87C();

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI25TabBarContainerController *v2;

  v2 = self;
  sub_1B167E980();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)sub_1B167EAB0();
}

- (_TtC5TeaUI25TabBarContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  sub_1B167EADC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25TabBarContainerController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25TabBarContainerController____lazy_storage___intrinsicTabBar));
}

@end
