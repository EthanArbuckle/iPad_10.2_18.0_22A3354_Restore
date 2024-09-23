@implementation CHASActivitySetupThreeRingsOnboardingViewController

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithPresentationContext:(int64_t)a3
{
  return (CHASActivitySetupThreeRingsOnboardingViewController *)sub_1000F4E90(a3);
}

- (void)viewDidLoad
{
  CHASActivitySetupThreeRingsOnboardingViewController *v2;

  v2 = self;
  sub_1000F5128();

}

- (void)viewDidAppear:(BOOL)a3
{
  CHASActivitySetupThreeRingsOnboardingViewController *v4;

  v4 = self;
  sub_1000F55A4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  CHASActivitySetupThreeRingsOnboardingViewController *v4;

  v4 = self;
  sub_1000F5680(a3);

}

- (void)didTapAcceptButton
{
  CHASActivitySetupThreeRingsOnboardingViewController *v2;

  v2 = self;
  sub_1000F5754();

}

- (void)didTapSkipButton
{
  id v2;
  id v3;
  CHASActivitySetupThreeRingsOnboardingViewController *v4;

  v4 = self;
  v2 = -[CHASActivitySetupThreeRingsOnboardingViewController delegate](v4, "delegate");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "buddyControllerDone:", v4);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  CHASActivitySetupThreeRingsOnboardingViewController *result;

  result = (CHASActivitySetupThreeRingsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySetupThreeRingsOnboardingViewController", 58, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  CHASActivitySetupThreeRingsOnboardingViewController *result;

  v6 = a5;
  result = (CHASActivitySetupThreeRingsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySetupThreeRingsOnboardingViewController", 58, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_observers]);
  sub_1000F61B4((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController__delegate]);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign(&self->OBWelcomeController_opaque[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController__delegate], a3);
}

- (id)delegate
{
  return (id)swift_unknownObjectWeakLoadStrong(&self->OBWelcomeController_opaque[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController__delegate]);
}

@end
