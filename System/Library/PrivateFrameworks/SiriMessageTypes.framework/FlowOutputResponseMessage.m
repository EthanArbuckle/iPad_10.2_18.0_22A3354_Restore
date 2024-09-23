@implementation FlowOutputResponseMessage

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes25FlowOutputResponseMessage_outputId;
  v4 = OUTLINED_FUNCTION_8_9();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_5_16(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC16SiriMessageTypes25FlowOutputResponseMessage_commandResult));
}

@end
