@implementation CATGlobals

- (_TtC16SiriDialogEngine10CATGlobals)init
{
  _TtC16SiriDialogEngine10CATGlobals *result;

  CATGlobals.init()();
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16SiriDialogEngine10CATGlobals_siriLocale;
  v4 = OUTLINED_FUNCTION_19_10();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_59_2();
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_59_2();
  OUTLINED_FUNCTION_59_2();
  sub_1BFF17B38((uint64_t)self + OBJC_IVAR____TtC16SiriDialogEngine10CATGlobals_responseMode, &qword_1ED737308);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_143();
  swift_bridgeObjectRelease();
}

@end
