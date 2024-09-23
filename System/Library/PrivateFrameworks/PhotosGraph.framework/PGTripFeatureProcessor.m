@implementation PGTripFeatureProcessor

- (PGTripFeatureProcessor)init
{
  sub_1CA438AA4();
}

- (PGTripFeatureProcessor)initWithMomentNodes:(id)a3 graph:(id)a4 locationHelper:(id)a5 error:(id *)a6
{
  return (PGTripFeatureProcessor *)TripFeatureProcessor.init(momentNodes:graph:locationHelper:)(a3, a4, a5);
}

- (id)getScorePerMoment
{
  PGTripFeatureProcessor *v2;
  void *v3;

  v2 = self;
  sub_1CA4391AC();

  sub_1CA24EEC0(0, (unint64_t *)&qword_1EF94AB50);
  sub_1CA24E6C0((unint64_t *)&qword_1EF94AB58, (unint64_t *)&qword_1EF94AB50);
  v3 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)getScoresByLevelWithError:(id *)a3
{
  return sub_1CA4398D4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___PGTripFeatureProcessor_scoresByLevel);
}

- (id)frequencyPerLocationWithError:(id *)a3
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripFeatureProcessor_locationFrequency))
  {
    sub_1CA24EEC0(0, &qword_1EF94B030);
    sub_1CA24E6C0((unint64_t *)&unk_1EF958750, &qword_1EF94B030);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1CA85B3FC();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CA4390AC();
    v5 = (void *)swift_allocError();
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_BYTE *)(v6 + 32) = 3;
    swift_willThrow();
    if (a3)
    {
      v7 = (void *)sub_1CA85A358();

      v8 = v7;
      v3 = 0;
      *a3 = v7;
    }
    else
    {

      v3 = 0;
    }
  }
  return v3;
}

- (id)finalScoreByLevelWithError:(id *)a3
{
  return sub_1CA4398D4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___PGTripFeatureProcessor_finalTripLocationScoreByLevel);
}

- (void)sendAnalyticsEvent
{
  void *v3;
  PGTripFeatureProcessor *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = (void *)sub_1CA85B510();
  _s11PhotosGraph24TripTitleAnalyticsHelperC16analyticsPayload3forSDySSSo8NSObjectCGAA0C16FeatureProcessorC_tFZ_0((uint64_t)v4);
  sub_1CA24EEC0(0, (unint64_t *)&qword_1ED8723E0);
  v6 = (id)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_sendEvent_withPayload_, v5, v6);

}

- (id)processTripLocationsWithReporter:(id)a3 error:(id *)a4
{
  id v5;
  PGTripFeatureProcessor *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  sub_1CA439B58((uint64_t)v5);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF958740);
  v7 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PGTripFeatureProcessor_tripDateInterval;
  v4 = sub_1CA85A148();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
