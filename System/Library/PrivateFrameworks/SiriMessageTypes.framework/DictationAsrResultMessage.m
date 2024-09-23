@implementation DictationAsrResultMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25DictationAsrResultMessage_speechPackage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25DictationAsrResultMessage_nluResult));
}

@end
