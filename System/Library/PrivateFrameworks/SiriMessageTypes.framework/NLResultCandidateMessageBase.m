@implementation NLResultCandidateMessageBase

- (NSString)description
{
  _TtC16SiriMessageTypes28NLResultCandidateMessageBase *v2;
  void *v3;

  v2 = self;
  sub_24695C27C();

  v3 = (void *)sub_2469F5790();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes28NLResultCandidateMessageBase_responseStatusCode;
  v4 = OUTLINED_FUNCTION_25_4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_24695CB20((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes28NLResultCandidateMessageBase_fallbackParse, &qword_25442E258);
  sub_24695CB20((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes28NLResultCandidateMessageBase_languageVariantResult, &qword_25442E250);
  OUTLINED_FUNCTION_27_3();
}

@end
