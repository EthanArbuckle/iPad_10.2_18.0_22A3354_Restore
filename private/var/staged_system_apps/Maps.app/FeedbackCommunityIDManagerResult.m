@implementation FeedbackCommunityIDManagerResult

- (NSString)anonymousId
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->anonymousId[OBJC_IVAR___FeedbackCommunityIDManagerResult_anonymousId];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (FeedbackCommunityIDManagerResult)init
{
  FeedbackCommunityIDManagerResult *result;

  result = (FeedbackCommunityIDManagerResult *)_swift_stdlib_reportUnimplementedInitializer("Maps.Result", 11, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->anonymousId[OBJC_IVAR___FeedbackCommunityIDManagerResult_anonymousId]);
}

@end
