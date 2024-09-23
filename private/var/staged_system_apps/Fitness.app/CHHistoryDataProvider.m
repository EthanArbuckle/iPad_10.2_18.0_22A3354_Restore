@implementation CHHistoryDataProvider

- (CHHistoryDataProvider)initWithHealthStore:(id)a3
{
  return (CHHistoryDataProvider *)sub_10001CCE4(a3);
}

- (CHWorkoutDataProvider)workoutDataProvider
{
  return (CHWorkoutDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider));
}

- (void)setWorkoutDataProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider) = (Class)a3;
  v3 = a3;

}

- (FIMindfulnessSessionDataProvider)mindfulnessSessionDataProvider
{
  return (FIMindfulnessSessionDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider));
}

- (void)setMindfulnessSessionDataProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider) = (Class)a3;
  v3 = a3;

}

- (CHHistoryDataProvider)init
{
  CHHistoryDataProvider *result;

  result = (CHHistoryDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryDataProvider", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_eventHub));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_subscriptionToken));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_allHistoryItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_stackHistoryItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_historyTypeCounts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_activityTypeCounts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_onChangeHandlers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHHistoryDataProvider_allMindfulnessSessions));

}

@end
