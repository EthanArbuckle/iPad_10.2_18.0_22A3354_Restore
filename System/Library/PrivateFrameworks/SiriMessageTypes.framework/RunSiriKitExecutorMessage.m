@implementation RunSiriKitExecutorMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25RunSiriKitExecutorMessage_command));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25RunSiriKitExecutorMessage_commandExecutionInfo));
}

@end
