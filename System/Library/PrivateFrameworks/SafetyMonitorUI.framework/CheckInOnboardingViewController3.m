@implementation CheckInOnboardingViewController3

- (void)viewDidLoad
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v2;

  v2 = self;
  CheckInOnboardingViewController3.viewDidLoad()();

}

- (void)continueButtonAction
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v2;

  v2 = self;
  sub_2456711EC();

}

- (void)showExampleButtonAction
{
  id v3;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v4;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v5;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v6;
  id v7;

  v3 = objc_allocWithZone((Class)type metadata accessor for CheckInOnboardingExampleDataViewController());
  v4 = self;
  v7 = CheckInOnboardingExampleDataViewController.init()();
  v5 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)-[CheckInOnboardingViewController3 navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    -[CheckInOnboardingViewController3 pushViewController:animated:](v5, sel_pushViewController_animated_, v7, 1);

    v4 = v6;
  }

}

- (void)notNowButtonAction
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v2;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v3;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v4;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *v5;

  v5 = self;
  v2 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)-[CheckInOnboardingViewController3 navigationController](v5, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    -[CheckInOnboardingViewController3 dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *result;

  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *result;

  v6 = a5;
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI32CheckInOnboardingViewController3_continueButton));
}

@end
