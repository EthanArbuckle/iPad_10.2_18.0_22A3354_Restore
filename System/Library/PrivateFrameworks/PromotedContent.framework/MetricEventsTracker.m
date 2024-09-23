@implementation MetricEventsTracker

- (void)didReceiveAdResponse
{
  sub_1B11E5898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_adResponseTimestamp);
}

- (NSDate)adResponseTimestamp
{
  return (NSDate *)sub_1B11E27C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_adResponseTimestamp);
}

- (NSDate)placeholderPlacedTimestamp
{
  return (NSDate *)sub_1B11E27C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_placeholderPlacedTimestamp);
}

- (void)setPlaceholderPlacedTimestamp:(id)a3
{
  sub_1B121D1AC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_placeholderPlacedTimestamp);
}

- (NSDate)replacedPlaceholderTimestamp
{
  return (NSDate *)sub_1B11E27C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_replacedPlaceholderTimestamp);
}

- (void)setReplacedPlaceholderTimestamp:(id)a3
{
  sub_1B121D1AC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_replacedPlaceholderTimestamp);
}

- (void)setAdResponseTimestamp:(id)a3
{
  sub_1B121D1AC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_adResponseTimestamp);
}

- (NSDate)prerollAdRequestTimestamp
{
  return (NSDate *)sub_1B11E27C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdRequestTimestamp);
}

- (void)setPrerollAdRequestTimestamp:(id)a3
{
  sub_1B121D1AC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdRequestTimestamp);
}

- (NSDate)prerollAdResponseTimestamp
{
  return (NSDate *)sub_1B11E27C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdResponseTimestamp);
}

- (void)setPrerollAdResponseTimestamp:(id)a3
{
  sub_1B121D1AC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdResponseTimestamp);
}

- (void)didPlacePlaceholder
{
  sub_1B11E5898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_placeholderPlacedTimestamp);
}

- (void)didReplacePlaceholder
{
  sub_1B11E5898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_replacedPlaceholderTimestamp);
}

- (void)didRequestPrerollVideo
{
  sub_1B11E5898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdRequestTimestamp);
}

- (void)didReceivePrerollVideoResponse
{
  sub_1B11E5898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15PromotedContent19MetricEventsTracker_prerollAdResponseTimestamp);
}

- (void)sendAnalyticsEventFor:(int64_t)a3 interval:(double)a4 networkType:(unint64_t)a5 placementType:(unint64_t)a6 failed:(BOOL)a7
{
  swift_retain();
  sub_1B121D2DC(a3, a5, a6, a7, a4);
  swift_release();
}

@end
