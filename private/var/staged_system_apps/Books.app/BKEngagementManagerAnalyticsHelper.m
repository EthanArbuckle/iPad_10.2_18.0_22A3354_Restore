@implementation BKEngagementManagerAnalyticsHelper

- (void)collectLocalSignalsAnalyticsWithTracker:(id)a3
{
  id v4;
  BKEngagementManagerAnalyticsHelper *v5;

  v4 = a3;
  v5 = self;
  EngagementManagerAnalyticsHelper.collectLocalSignalsAnalytics(with:)();

}

- (BKEngagementManagerAnalyticsHelper)init
{
  BKEngagementManagerAnalyticsHelper *result;

  result = (BKEngagementManagerAnalyticsHelper *)_swift_stdlib_reportUnimplementedInitializer("Books.EngagementManagerAnalyticsHelper", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKEngagementManagerAnalyticsHelper_engagementManager);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKEngagementManagerAnalyticsHelper_allProperties));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKEngagementManagerAnalyticsHelper_standardProperties));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKEngagementManagerAnalyticsHelper_sampleCapableProperties));
}

@end
