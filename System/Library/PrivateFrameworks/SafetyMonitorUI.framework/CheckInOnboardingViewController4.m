@implementation CheckInOnboardingViewController4

- (void)viewDidLoad
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v2;

  v2 = self;
  CheckInOnboardingViewController4.viewDidLoad()();

}

- (void)sendCheckIn
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v2;

  v2 = self;
  sub_24564BDF0();

}

- (void)notNowButtonAction
{
  void *v3;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v4;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v5;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v6;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *v7;

  v3 = (void *)objc_opt_self();
  v7 = self;
  objc_msgSend(v3, sel_setHasUserCompletedOnboarding_, 1);
  v4 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)-[CheckInOnboardingViewController4 navigationController](v7, sel_navigationController);
  if (v4)
  {
    v5 = v4;
    -[CheckInOnboardingViewController4 dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *result;

  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *result;

  v6 = a5;
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
