@implementation RPWirelessPairingSession_Internal

- (BOOL)invalidated
{
  RPWirelessPairingSession_Internal *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1CF6A8C34((uint64_t)v2);

  return v3;
}

- (void)endSession
{
  RPWirelessPairingSession_Internal *v2;

  v2 = self;
  sub_1CF6A8D9C();

}

- (void)registerInvalidationHandlerWithInvokingOnQueue:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  RPWirelessPairingSession_Internal *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1CF6A8E4C(v8, (uint64_t)sub_1CF6A6F88, v7);

  swift_release();
}

- (void)dealloc
{
  RPWirelessPairingSession_Internal *v2;

  v2 = self;
  WirelessPairingSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  sub_1CF6A8CB8(*(id *)((char *)&self->super.isa + OBJC_IVAR___RPWirelessPairingSession_Internal__state));
}

- (RPWirelessPairingSession_Internal)init
{
  WirelessPairingSession.init()();
}

@end
