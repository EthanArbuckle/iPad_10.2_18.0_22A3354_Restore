@implementation FlowOutputMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_command));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_commandExecutionInfo));
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_30_1();
  sub_246926154((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_legacyContext);
}

@end
