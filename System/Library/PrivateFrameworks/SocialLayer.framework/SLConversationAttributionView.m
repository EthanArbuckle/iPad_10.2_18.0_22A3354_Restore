@implementation SLConversationAttributionView

- (SLConversationAttributionView)initWithVariant:(int64_t)a3
{
  SLConversationAttributionView *result;

  result = (SLConversationAttributionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (SLConversationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4
{
  id v4;
  SLConversationAttributionView *v5;

  v4 = a3;
  v5 = (SLConversationAttributionView *)specialized CollaborationAttributionView.init(highlight:variant:)(v4, 2);

  return v5;
}

- (SLConversationAttributionView)initWithCoder:(id)a3
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

@end
