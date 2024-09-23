@implementation CHScoreSummaryWrapper

- (NSString)description
{
  CHScoreSummaryWrapper *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  ScoreSummary.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CHScoreSummaryWrapper)init
{
  CHScoreSummaryWrapper *result;

  result = (CHScoreSummaryWrapper *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ScoreSummaryWrapper", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CHScoreSummaryWrapper_scoreSummary;
  v3 = type metadata accessor for ScoreSummary(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
