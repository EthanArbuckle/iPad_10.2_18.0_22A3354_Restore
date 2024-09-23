@implementation BiomePublishers.ScanTurns

- (void)subscribe:(id)a3
{
  _TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1CB7DFB48();
  swift_unknownObjectRelease();

}

- (_TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns)init
{
  _TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns *result;

  result = (_TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_upstream));
  v3 = (char *)self + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_turnsStartDateTime;
  v4 = sub_1CB846018();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_inner));
}

@end
