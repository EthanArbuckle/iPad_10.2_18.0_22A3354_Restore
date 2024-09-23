@implementation CHWorkoutDetailedHeartRateViewController

- (CHWorkoutDetailedHeartRateViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHWorkoutDetailedHeartRateViewController *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (CHWorkoutDetailedHeartRateViewController *)sub_100168D88(v7, a4, v9);

  return v10;
}

- (CHWorkoutDetailedHeartRateViewController)initWithCoder:(id)a3
{
  CHWorkoutDetailedHeartRateViewController *result;

  result = (CHWorkoutDetailedHeartRateViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailedHeartRateViewController.swift", 55, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CHWorkoutDetailedHeartRateViewController *v2;

  v2 = self;
  sub_10016839C();

}

- (void)viewWillAppear:(BOOL)a3
{
  CHWorkoutDetailedHeartRateViewController *v4;

  v4 = self;
  sub_1001686E8(a3);

}

- (void)close
{
  -[CHWorkoutDetailedHeartRateViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHWorkoutDetailedHeartRateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHWorkoutDetailedHeartRateViewController *result;

  v4 = a4;
  result = (CHWorkoutDetailedHeartRateViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailedHeartRateViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_dataStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_workout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_workoutActivity));
  swift_release(*(_QWORD *)&self->dataStore[OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_heartRateView]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_heartRateController));
}

@end
