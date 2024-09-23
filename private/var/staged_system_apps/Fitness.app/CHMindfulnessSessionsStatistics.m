@implementation CHMindfulnessSessionsStatistics

- (CHMindfulnessSessionsStatistics)initWithSessionCount:(int64_t)a3 totalDuration:(double)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_sessionCount) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_totalDuration) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MindfulnessSessionsStatistics();
  return -[CHMindfulnessSessionsStatistics init](&v5, "init");
}

- (CHMindfulnessSessionsStatistics)init
{
  CHMindfulnessSessionsStatistics *result;

  result = (CHMindfulnessSessionsStatistics *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MindfulnessSessionsStatistics", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)formattedSessionCount
{
  void *v3;
  CHMindfulnessSessionsStatistics *v4;
  Class isa;
  id v6;
  id result;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v3 = (void *)objc_opt_self(FIUIFormattingManager);
  v4 = self;
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  v6 = objc_msgSend(v3, "stringWithNumber:decimalPrecision:", isa, 1);

  if (v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)formattedTotalDurationWithFormattingManager:(id)a3
{
  double v4;
  id v5;
  CHMindfulnessSessionsStatistics *v6;
  id result;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v4 = *(double *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_totalDuration);
  v5 = a3;
  v6 = self;
  result = objc_msgSend(v5, "stringWithDuration:durationFormat:", 3, v4);
  if (result)
  {
    v8 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v10 = v9;

    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
