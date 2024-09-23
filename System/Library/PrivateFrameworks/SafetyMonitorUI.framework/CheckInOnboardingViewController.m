@implementation CheckInOnboardingViewController

- (void)viewDidLoad
{
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v2;

  v2 = self;
  CheckInOnboardingViewController.viewDidLoad()();

}

- (void)continueButtonAction
{
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v2;

  v2 = self;
  sub_245695E90();

}

- (void)notNowButtonAction
{
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v2;
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v3;
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v4;
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *v5;

  v5 = self;
  v2 = (_TtC15SafetyMonitorUI31CheckInOnboardingViewController *)-[CheckInOnboardingViewController navigationController](v5, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    -[CheckInOnboardingViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC15SafetyMonitorUI31CheckInOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *result;

  result = (_TtC15SafetyMonitorUI31CheckInOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI31CheckInOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC15SafetyMonitorUI31CheckInOnboardingViewController *result;

  v6 = a5;
  result = (_TtC15SafetyMonitorUI31CheckInOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
