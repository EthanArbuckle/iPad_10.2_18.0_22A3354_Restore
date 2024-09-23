@implementation CHWorkoutDetailedMetricsViewController

- (CHWorkoutDetailedMetricsViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 locationReadings:(id)a7
{
  id v11;
  id v12;

  v11 = a3;
  v12 = a4;
  return (CHWorkoutDetailedMetricsViewController *)sub_1005913D4(v11, a4, a5, a6, a7);
}

- (CHWorkoutDetailedMetricsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100596AF4();
}

- (void)viewDidLoad
{
  CHWorkoutDetailedMetricsViewController *v2;

  v2 = self;
  sub_100592228();

}

- (void)viewWillAppear:(BOOL)a3
{
  CHWorkoutDetailedMetricsViewController *v4;

  v4 = self;
  sub_100592B5C(a3);

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailedMetricsViewController(0);
  v2 = (char *)v5.receiver;
  -[CHWorkoutDetailedMetricsViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapView];
  v4 = *(id *)&v2[OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapGradientView];
  objc_msgSend(v3, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setFrame:");

}

- (void)close
{
  -[CHWorkoutDetailedMetricsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)durationChanged:(id)a3
{
  id v4;
  CHWorkoutDetailedMetricsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100594FEC(v4);

}

- (CHWorkoutDetailedMetricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHWorkoutDetailedMetricsViewController *result;

  v4 = a4;
  result = (CHWorkoutDetailedMetricsViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailedMetricsViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_locationReadings));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_workoutActivity));
  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_startDate;
  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_endDate, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_topViewHiddenConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_scrubbedAnnotation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapRoutePolyline));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_downhillRunDateIntervals));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_durationOptions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_durationControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_chartHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_chartsController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_chartProperties));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_distanceQueue));
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  CHWorkoutDetailedMetricsViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100596CA8((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for WorkoutLocationAnnotationView()), "initWithAnnotation:reuseIdentifier:", a4, 0);
}

@end
