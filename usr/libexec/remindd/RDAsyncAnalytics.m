@implementation RDAsyncAnalytics

+ (void)recordFetchWith:(id)a3
{
  sub_100016090((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1007FB6A0, (uint64_t)sub_100576F34, (uint64_t)&unk_1007FB6B8);
}

+ (void)recordSaveWith:(id)a3
{
  sub_100016090((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1007FB600, (uint64_t)sub_100576EB4, (uint64_t)&unk_1007FB618);
}

- (_TtC7remindd16RDAsyncAnalytics)init
{
  _TtC7remindd16RDAsyncAnalytics *result;

  result = (_TtC7remindd16RDAsyncAnalytics *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDAsyncAnalytics", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd16RDAsyncAnalytics_q_fetchCounts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd16RDAsyncAnalytics_q_saveCounts));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd16RDAsyncAnalytics_q_postEventWorkItem));

}

@end
