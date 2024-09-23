@implementation UserEngagementStatsUtils

- (_TtC23SiriInvocationAnalytics24UserEngagementStatsUtils)init
{
  _TtC23SiriInvocationAnalytics24UserEngagementStatsUtils *result;

  sub_2464BCBCC();
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC23SiriInvocationAnalytics24UserEngagementStatsUtils_timeZone;
  v4 = OUTLINED_FUNCTION_31_5();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23SiriInvocationAnalytics24UserEngagementStatsUtils_calendar;
  v6 = OUTLINED_FUNCTION_20_7();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
