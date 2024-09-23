@implementation RDStaledFileAttachmentCleanupActivity

- (id)waiterID
{
  _TtC7remindd37RDStaledFileAttachmentCleanupActivity *v2;
  NSString v3;

  v2 = self;
  sub_10019A490();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC7remindd37RDStaledFileAttachmentCleanupActivity)init
{
  _TtC7remindd37RDStaledFileAttachmentCleanupActivity *result;

  result = (_TtC7remindd37RDStaledFileAttachmentCleanupActivity *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDStaledFileAttachmentCleanupActivity", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_rateReducerConfiguration, (uint64_t *)&unk_10083ECE0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_executionDateStorage));
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_babysitter, (uint64_t *)&unk_10083E300);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_storeController));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_configurations));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_states));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_executable));
}

@end
