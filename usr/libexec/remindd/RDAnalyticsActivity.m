@implementation RDAnalyticsActivity

- (id)waiterID
{
  _TtC7remindd19RDAnalyticsActivity *v2;
  NSString v3;

  v2 = self;
  sub_100383C90();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC7remindd19RDAnalyticsActivity)init
{
  _TtC7remindd19RDAnalyticsActivity *result;

  result = (_TtC7remindd19RDAnalyticsActivity *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDAnalyticsActivity", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_rateReducerConfiguration, (uint64_t *)&unk_10083ECE0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_executionDateStorage));
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_babysitter, (uint64_t *)&unk_10083E300);

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_configurations));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_states));

}

@end
