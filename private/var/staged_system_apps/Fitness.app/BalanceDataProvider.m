@implementation BalanceDataProvider

- (_TtC10FitnessApp19BalanceDataProvider)initWithHealthStore:(id)a3 gregorianCalendar:(id)a4 historyDataProvider:(id)a5 activityDataProvider:(id)a6 isFaking:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;

  v7 = a7;
  v12 = type metadata accessor for Calendar(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (_TtC10FitnessApp19BalanceDataProvider *)sub_1001733C8((void (*)(char *, uint64_t))a3, (uint64_t)v14, (void (*)(char *, uint64_t))a5, a6, v7);
}

- (void)dealloc
{
  _TtC10FitnessApp19BalanceDataProvider *v2;

  v2 = self;
  sub_10017A850();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider_trainingLoadViewModelProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider_overnightSleepingSampleViewModelProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__stackedChartSleepingSampleViewModelProviderHolder));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__dayRange;
  v4 = type metadata accessor for GregorianDayRange(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__historyItemsInDayRange));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__historyListForTheWeek));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__workoutsWithEffortQuantities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__activitySummaries));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__activitySummariesForTheWeek));

  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider___observationRegistrar;
  v6 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (_TtC10FitnessApp19BalanceDataProvider)init
{
  _TtC10FitnessApp19BalanceDataProvider *result;

  result = (_TtC10FitnessApp19BalanceDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.BalanceDataProvider", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
