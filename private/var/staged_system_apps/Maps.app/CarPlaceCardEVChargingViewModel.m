@implementation CarPlaceCardEVChargingViewModel

- (BOOL)hasSummaryInfo
{
  return *(_QWORD *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle]
      && *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription) != 0;
}

- (NSString)summaryTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setSummaryTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle);
  v7 = *(_QWORD *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (NSAttributedString)summaryDescription
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription));
}

- (void)setSummaryDescription:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription) = (Class)a3;
  v3 = a3;

}

- (_TtP4Maps39CarPlaceCardEVChargingViewModelObserver_)observer
{
  return (_TtP4Maps39CarPlaceCardEVChargingViewModelObserver_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_observer);
}

- (void)setObserver:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_observer, a3);
}

- (BOOL)isActive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_isActive);
}

- (void)setIsActive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_isActive) = a3;
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_availabilityRefresher), "setIsActive:");
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItem:(id)a3 virtualGarageService:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC4Maps31CarPlaceCardEVChargingViewModel *)CarPlaceCardEVChargingViewModel.init(mapItem:virtualGarageService:)(v5, a4);
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItemIdentifier:(id)a3 plugs:(id)a4 initialAggregatedAvailabilityInfo:(id)a5 virtualGarageService:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v10 = sub_10000E4BC(0, &qword_101494730, GEOEVChargerPlug_ptr);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  return (_TtC4Maps31CarPlaceCardEVChargingViewModel *)CarPlaceCardEVChargingViewModel.init(mapItemIdentifier:plugs:initialAggregatedAvailabilityInfo:virtualGarageService:)(v12, v11, a5, a6);
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)init
{
  _TtC4Maps31CarPlaceCardEVChargingViewModel *result;

  result = (_TtC4Maps31CarPlaceCardEVChargingViewModel *)_swift_stdlib_reportUnimplementedInitializer("Maps.CarPlaceCardEVChargingViewModel", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_sections));
  swift_bridgeObjectRelease(*(_QWORD *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription));
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_observer);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_mapItemIdentifier));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_plugs));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_initialAggregatedAvailabilityInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_virtualGarageService));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_availabilityRefresher));
  sub_100042EEC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel____lazy_storage___chargerSymbolString));
}

- (void)evChargerAvailabilityDownloader:(id)a3 didDownloadAvailabilityWithPlugs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC4Maps31CarPlaceCardEVChargingViewModel *v10;

  v7 = sub_10000E4BC(0, &qword_101494730, GEOEVChargerPlug_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100042C9C(v8);

  swift_bridgeObjectRelease(v8);
}

@end
