@implementation NLParseResponse

- (NSString)description
{
  _TtC16SiriMessageTypes15NLParseResponse *v2;
  void *v3;

  v2 = self;
  sub_2469548A4();

  v3 = (void *)sub_2469F5790();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16SiriMessageTypes15NLParseResponse)init
{
  NLParseResponse.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes15NLParseResponse_responseStatusCode;
  v4 = OUTLINED_FUNCTION_25_4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_24691FF80((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes15NLParseResponse_fallbackParse, &qword_25442E258);
  sub_24691FF80((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes15NLParseResponse_languageVariantResult, &qword_25442E250);
  swift_bridgeObjectRelease();
}

@end
