@implementation CHWorkoutDetailedBasicViewController

- (CHWorkoutDetailedBasicViewController)initWithSegmentDataSource:(id)a3
{
  id v3;
  CHWorkoutDetailedBasicViewController *v4;

  v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100256430(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithSplitDataSource:(id)a3
{
  id v3;
  CHWorkoutDetailedBasicViewController *v4;

  v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_1002567C4(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithIntervalDataSource:(id)a3
{
  id v3;
  CHWorkoutDetailedBasicViewController *v4;

  v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100256B40(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithSwimmingSetDataSource:(id)a3
{
  return (CHWorkoutDetailedBasicViewController *)sub_100255544(a3);
}

- (CHWorkoutDetailedBasicViewController)initWithSwimmingSplitDataSource:(id)a3
{
  return (CHWorkoutDetailedBasicViewController *)sub_10025577C(a3);
}

- (CHWorkoutDetailedBasicViewController)initWithTrackLapDataSource:(id)a3
{
  id v3;
  CHWorkoutDetailedBasicViewController *v4;

  v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100256F80(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithDownhillRunDataSource:(id)a3
{
  id v3;
  CHWorkoutDetailedBasicViewController *v4;

  v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_1002573C0(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  CHWorkoutDetailedBasicViewController *result;

  v5 = OBJC_IVAR___CHWorkoutDetailedBasicViewController_activityIndicator;
  v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithActivityIndicatorStyle:", 100);

  result = (CHWorkoutDetailedBasicViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/WorkoutDetailedBasicViewController.swift", 51, 2, 100, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CHWorkoutDetailedBasicViewController *v2;

  v2 = self;
  sub_100255ABC();

}

- (void)viewWillAppear:(BOOL)a3
{
  CHWorkoutDetailedBasicViewController *v4;

  v4 = self;
  sub_100255DE0(a3);

}

- (void)close
{
  -[CHWorkoutDetailedBasicViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHWorkoutDetailedBasicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHWorkoutDetailedBasicViewController *result;

  v4 = a4;
  result = (CHWorkoutDetailedBasicViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailedBasicViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedBasicViewController_metricController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedBasicViewController_activityIndicator));
}

@end
