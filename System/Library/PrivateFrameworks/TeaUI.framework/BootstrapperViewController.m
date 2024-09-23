@implementation BootstrapperViewController

- (_TtC5TeaUI26BootstrapperViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1561D34();
}

- (_TtC5TeaUI26BootstrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  sub_1B1561DB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26BootstrapperViewController_mainViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26BootstrapperViewController_onboardingViewController));
}

- (void)viewDidLoad
{
  _TtC5TeaUI26BootstrapperViewController *v2;

  v2 = self;
  sub_1B1561E5C();

}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI26BootstrapperViewController *v2;

  v2 = self;
  sub_1B1562084();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)sub_1B15621F0();
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;

  sub_1B1562284();
  sub_1B1562310();
  v2 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end
