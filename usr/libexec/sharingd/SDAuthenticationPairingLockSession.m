@implementation SDAuthenticationPairingLockSession

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary34SDAuthenticationPairingLockSession_passcode]);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAuthenticationPairingLockSession_aksPairingSession));
}

@end
