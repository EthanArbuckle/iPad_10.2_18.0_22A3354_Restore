@implementation CHAwardsDataProvider

- (CHAwardsDataProvider)init
{
  CHAwardsDataProvider *result;

  result = (CHAwardsDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.CHAwardsDataProvider", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider));
}

- (id)achievementsForWorkoutIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHAwardsDataProvider *v9;
  uint64_t v10;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->awardsDataProvider[OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider + 16];
  v8 = *(_QWORD *)&self->awardsDataProvider[OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider + 24];
  sub_100016804((Class *)((char *)&self->super.isa + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider), v7);
  v9 = self;
  v10 = dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)(v4, v6, v7, v8);

  swift_bridgeObjectRelease(v6);
  sub_10017DAE4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

@end
