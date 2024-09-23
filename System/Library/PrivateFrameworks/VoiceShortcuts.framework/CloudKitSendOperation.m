@implementation CloudKitSendOperation

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14VoiceShortcuts21CloudKitSendOperation *v9;

  v6 = sub_1C1546BD0();
  v8 = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C14D0264((uint64_t)a3, v6, v8, (char *)v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC14VoiceShortcuts21CloudKitSendOperation)init
{
  CloudKitSendOperation.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts21CloudKitSendOperation_environment);
  swift_release();
}

@end
