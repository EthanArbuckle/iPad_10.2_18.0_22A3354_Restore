@implementation OnboardingViewController

- (_TtC5TeaUI24OnboardingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14902F0();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI24OnboardingViewController *v4;

  v4 = self;
  OnboardingViewController.viewWillAppear(_:)(a3);

}

- (_TtC5TeaUI24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  OnboardingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI24OnboardingViewController_onboardingStepMonitor);
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI24OnboardingViewController_onDismissal));
  swift_bridgeObjectRelease();
}

@end
