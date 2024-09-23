@implementation CHWorkoutRouteViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (CHWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v16 = v15;
  type metadata accessor for ActivityType(0);
  v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v17);
  return (CHWorkoutRouteViewController *)sub_100274CC8(a3, v11, v13, a5, v14, v16, v18);
}

- (CHWorkoutRouteViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100276D4C();
}

- (void)viewWillAppear:(BOOL)a3
{
  CHWorkoutRouteViewController *v4;

  v4 = self;
  sub_100274F98(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WorkoutRouteViewController();
  v4 = v8.receiver;
  -[CHWorkoutRouteViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v5 = objc_msgSend(v4, "tabBarController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "tabBar");

    objc_msgSend(v7, "setScrollEdgeAppearance:", 0);
    v4 = v7;
  }

}

- (void)viewWillLayoutSubviews
{
  CHWorkoutRouteViewController *v2;

  v2 = self;
  sub_10027519C();

}

- (void)viewDidLoad
{
  CHWorkoutRouteViewController *v2;

  v2 = self;
  sub_1002754A8();

}

- (void)close
{
  -[CHWorkoutRouteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)shareButtonPressed
{
  CHWorkoutRouteViewController *v2;

  v2 = self;
  sub_100275820();

}

- (void)toggleMapType
{
  void *v2;
  uint64_t v3;
  CHWorkoutRouteViewController *v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_mapView);
  v4 = self;
  if (objc_msgSend(v2, "mapType") == (id)5)
    v3 = 1;
  else
    v3 = 5;
  sub_100275BC4(v3);

}

- (void)reportProblem
{
  void *v2;
  CHWorkoutRouteViewController *v3;
  double v4;
  CLLocationDegrees v5;
  double v6;
  CLLocationDegrees v7;
  id v8;
  id v9;
  id v10;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_mapView);
  v3 = self;
  objc_msgSend(v2, "centerCoordinate");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_workout), "trackId");
  v9 = objc_allocWithZone((Class)type metadata accessor for WorkoutDetailedBasicViewController());
  v10 = sub_100257700(v8, v5, v7);

  -[CHWorkoutRouteViewController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v10, 1, 0);
}

- (CHWorkoutRouteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHWorkoutRouteViewController *result;

  v4 = a4;
  result = (CHWorkoutRouteViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutRouteViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_toggleMapTypeButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_reportProblemButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_geoMapFeatureAccess));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___CHWorkoutRouteViewController_excludedActivityTypes));
  swift_bridgeObjectRelease(*(_QWORD *)&self->mapView[OBJC_IVAR___CHWorkoutRouteViewController_shareText]);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  CHWorkoutRouteViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100276E84((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  CHWorkoutRouteViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100277080((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0xE000000000000000;
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v4, &type metadata for String, a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  CHWorkoutRouteViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100277178();

  return v6;
}

@end
