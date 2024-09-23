@implementation NearbyTransitViewController

- (_TtC4Maps27NearbyTransitViewController)initWithActionCoordinator:(id)a3
{
  _TtC4Maps27NearbyTransitViewController *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC4Maps27NearbyTransitViewController *)sub_10017C990(a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (_TtC4Maps27NearbyTransitViewController)initWithCoder:(id)a3
{
  return (_TtC4Maps27NearbyTransitViewController *)sub_10017AC00(a3);
}

- (void)viewDidLoad
{
  _TtC4Maps27NearbyTransitViewController *v2;

  v2 = self;
  sub_10017AD08();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC4Maps27NearbyTransitViewController *v4;

  v4 = self;
  sub_10017BE34(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC4Maps27NearbyTransitViewController *v4;

  v4 = self;
  sub_10017BF88(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyTransitViewController();
  v4 = v5.receiver;
  -[NearbyTransitViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  +[NearbyTeachableMomentContaineeViewController hasDisplayedNearbyCard]_0();
  sub_10017C0D8();

}

- (_TtC4Maps27NearbyTransitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps27NearbyTransitViewController *result;

  v4 = a4;
  result = (_TtC4Maps27NearbyTransitViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.NearbyTransitViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitView;
  sub_10017D068(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitView), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((_QWORD *)v3 + 6), *((void **)v3 + 7));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitDeparturesProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_mapView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_actionCoordinator));
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v6;
  id v7;
  _TtC4Maps27NearbyTransitViewController *v8;

  v6 = (void *)objc_opt_self(GEOAPPortal);
  v7 = a3;
  v8 = self;
  objc_msgSend(v6, "captureUserAction:target:value:", 4, 44, 0);
  -[ContaineeViewController handleDismissAction:](v8, "handleDismissAction:", v7);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  _TtC4Maps27NearbyTransitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10017CB70(v5);

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  _TtC4Maps27NearbyTransitViewController *v8;

  v7 = a3;
  v8 = self;
  sub_10017CF18(a4);

}

@end
