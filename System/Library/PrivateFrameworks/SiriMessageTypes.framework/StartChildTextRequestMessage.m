@implementation StartChildTextRequestMessage

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_orchestrationTaskId;
  v4 = OUTLINED_FUNCTION_8_12();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_7_30(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType), *(_QWORD *)&self->super.super.super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType]);
}

@end
