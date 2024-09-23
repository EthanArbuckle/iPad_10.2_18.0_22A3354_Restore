@implementation DatabaseSendOperation

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14VoiceShortcuts21DatabaseSendOperation *v9;

  v6 = sub_1C1546BD0();
  v8 = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C14A4DA4((uint64_t)a3, v6, v8, (char *)v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC14VoiceShortcuts21DatabaseSendOperation)init
{
  DatabaseSendOperation.init()();
}

- (void).cxx_destruct
{
  sub_1C147EFC0((id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14VoiceShortcuts21DatabaseSendOperation_object));

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts21DatabaseSendOperation_environment);
  swift_release();
}

@end
