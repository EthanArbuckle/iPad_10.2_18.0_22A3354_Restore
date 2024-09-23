@implementation Conversation

- (NSArray)turns
{
  void *v2;

  Conversation.turns.getter();
  type metadata accessor for ConversationTurn(0);
  v2 = (void *)sub_2464F8CC0();
  OUTLINED_FUNCTION_6_2();
  return (NSArray *)v2;
}

- (_TtC23SiriInvocationAnalytics12Conversation)initWithTurns:(id)a3
{
  uint64_t v3;
  _TtC23SiriInvocationAnalytics12Conversation *result;

  type metadata accessor for ConversationTurn(0);
  v3 = sub_2464F8CCC();
  Conversation.init(turns:)(v3);
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (id)debugString
{
  return sub_24649C0E8(self, (uint64_t)a2, (void (*)(void))Conversation.debugString());
}

- (_TtC23SiriInvocationAnalytics12Conversation)init
{
  Conversation.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
