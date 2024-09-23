@implementation SiriSharedUISuggestion

- (NSString)displayText
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DE130950();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)invocationText
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DE130950();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)suggestionId
{
  return (NSUUID *)(id)sub_1DE12FE7C();
}

@end
