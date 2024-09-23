@implementation CarEVChargingAvailabilityViewController

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithViewModal:(id)a3
{
  char *v4;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CarEVChargingAvailabilityViewController_viewModal) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CarEVChargingAvailabilityViewController();
  v4 = (char *)a3;
  v5 = -[CarEVChargingAvailabilityViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  swift_unknownObjectWeakAssign(&v4[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_observer], v5);

  return v5;
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithCoder:(id)a3
{
  _TtC4Maps39CarEVChargingAvailabilityViewController *result;

  result = (_TtC4Maps39CarEVChargingAvailabilityViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/CarEVChargingAvailabilityViewController.swift", 50, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v5;
  id v6;

  v3 = type metadata accessor for CarEVChargingAvailabilityView();
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  -[CarEVChargingAvailabilityViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLoad
{
  _TtC4Maps39CarEVChargingAvailabilityViewController *v2;

  v2 = self;
  CarEVChargingAvailabilityViewController.viewDidLoad()();

}

- (void)evChargingViewModelDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v8;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v9;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v10;

  v4 = a3;
  v10 = self;
  v9 = (_TtC4Maps39CarEVChargingAvailabilityViewController *)-[CarEVChargingAvailabilityViewController view](v10, "view");
  if (v9)
  {
    v5 = type metadata accessor for CarEVChargingAvailabilityView();
    if (swift_dynamicCastClass(v9, v5))
    {
      v6 = *(_QWORD *)(*(char **)((char *)&v10->super.super.super.isa
                                + OBJC_IVAR____TtC4Maps39CarEVChargingAvailabilityViewController_viewModal)
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_sections);
      swift_bridgeObjectRetain(v6);
      sub_1001A4F4C(v7);

      swift_bridgeObjectRelease(v6);
      return;
    }

    v8 = v9;
  }
  else
  {

    v8 = v10;
  }

}

- (NSArray)focusOrderSubItems
{
  sub_100008B04((uint64_t *)&unk_10149EB30);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (NSArray)preferredFocusEnvironments
{
  sub_100008B04(&qword_10149EB28);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (void)configureForModalPresentation
{
  _TtC4Maps39CarEVChargingAvailabilityViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[CarEVChargingAvailabilityViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps39CarEVChargingAvailabilityViewController *result;

  v4 = a4;
  result = (_TtC4Maps39CarEVChargingAvailabilityViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.CarEVChargingAvailabilityViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CarEVChargingAvailabilityViewController_viewModal));
}

@end
