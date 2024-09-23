@implementation MOFeedbackAssistant

+ (void)triggerFeedbackAssistantFlowWithFlowIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)(v4, v6);
  swift_bridgeObjectRelease(v6);
}

- (_TtC8momentsd19MOFeedbackAssistant)init
{
  return (_TtC8momentsd19MOFeedbackAssistant *)@objc MOFeedbackAssistantLogger.init()(self, (uint64_t)a2, type metadata accessor for MOFeedbackAssistant);
}

@end
