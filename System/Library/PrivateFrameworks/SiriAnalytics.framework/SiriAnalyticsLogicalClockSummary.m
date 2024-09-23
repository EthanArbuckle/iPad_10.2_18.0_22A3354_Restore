@implementation SiriAnalyticsLogicalClockSummary

+ (BOOL)supportsSecureCoding
{
  return static LogicalClockSummary.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static LogicalClockSummary.supportsSecureCoding.setter(a3);
}

- (SiriAnalyticsLogicalClockSummary)initWithCoder:(id)a3
{
  id v3;
  SiriAnalyticsLogicalClockSummary *result;

  v3 = a3;
  LogicalClockSummary.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsLogicalClockSummary *v5;

  v4 = a3;
  v5 = self;
  sub_1A02A1008(v4);

}

- (SiriAnalyticsLogicalClockSummary)init
{
  LogicalClockSummary.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SiriAnalyticsLogicalClockSummary_clockIdentifier;
  v3 = OUTLINED_FUNCTION_9();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
