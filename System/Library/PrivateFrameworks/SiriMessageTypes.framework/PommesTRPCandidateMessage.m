@implementation PommesTRPCandidateMessage

- (NSString)debugDescription
{
  _TtC16SiriMessageTypes25PommesTRPCandidateMessage *v2;
  void *v3;

  v2 = self;
  sub_2468FABF4();

  v3 = (void *)sub_2469F5790();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes25PommesTRPCandidateMessage_pegasusId;
  v4 = OUTLINED_FUNCTION_8_12();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_45_1((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes25PommesTRPCandidateMessage_pommesResult);
  OUTLINED_FUNCTION_37_2();
  v5 = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_14_4(v5, v6, v7);
}

@end
