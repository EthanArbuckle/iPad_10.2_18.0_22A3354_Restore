@implementation RunPommesResponseMessage

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_45_1((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_pommesResult);
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_pommesSearchReason;
  v4 = OUTLINED_FUNCTION_37_2();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_nlResponse));
  OUTLINED_FUNCTION_7_22((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_userInput);
  OUTLINED_FUNCTION_27_3();
}

@end
