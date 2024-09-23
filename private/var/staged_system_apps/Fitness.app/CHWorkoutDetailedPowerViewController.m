@implementation CHWorkoutDetailedPowerViewController

- (CHWorkoutDetailedPowerViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 formattingManager:(id)a6 isFirstPartyWorkout:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CHWorkoutDetailedPowerViewController *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (CHWorkoutDetailedPowerViewController *)sub_10010A080(v11, a4, v13, v14, a7);

  return v15;
}

- (CHWorkoutDetailedPowerViewController)initWithCoder:(id)a3
{
  CHWorkoutDetailedPowerViewController *result;

  result = (CHWorkoutDetailedPowerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailedPowerViewController.swift", 51, 2, 43, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CHWorkoutDetailedPowerViewController *v2;

  v2 = self;
  sub_100109678();

}

- (void)viewWillAppear:(BOOL)a3
{
  CHWorkoutDetailedPowerViewController *v4;

  v4 = self;
  sub_1001099C4(a3);

}

- (void)close
{
  -[CHWorkoutDetailedPowerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHWorkoutDetailedPowerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHWorkoutDetailedPowerViewController *result;

  v4 = a4;
  result = (CHWorkoutDetailedPowerViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailedPowerViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailedPowerViewController_dataStore));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedPowerViewController_workoutActivity));
  v3 = *(_QWORD *)&self->dataStore[OBJC_IVAR___CHWorkoutDetailedPowerViewController_powerView];
  v4 = *(_QWORD *)&self->powerView[OBJC_IVAR___CHWorkoutDetailedPowerViewController_powerView + 8];

  swift_release(v3);
  swift_release(v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedPowerViewController_powerController));
}

@end
