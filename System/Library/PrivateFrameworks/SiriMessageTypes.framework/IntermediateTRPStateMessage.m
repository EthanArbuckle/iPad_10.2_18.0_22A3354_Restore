@implementation IntermediateTRPStateMessage

- (NSString)description
{
  _TtC16SiriMessageTypes27IntermediateTRPStateMessage *v2;
  void *v3;

  v2 = self;
  sub_24693BB78();

  v3 = (void *)sub_2469F5790();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  swift_bridgeObjectRelease();
  v3 = OUTLINED_FUNCTION_6_10((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes27IntermediateTRPStateMessage_routingDecision);
  sub_246922AB4(v3, v4, v5, v6);
}

@end
