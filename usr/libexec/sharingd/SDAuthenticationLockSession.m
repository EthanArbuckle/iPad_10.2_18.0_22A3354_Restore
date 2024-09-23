@implementation SDAuthenticationLockSession

- (void).cxx_destruct
{
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_lastUnlockDate, &qword_1007C4330);
  sub_100225AA0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_rangingToken), *(_QWORD *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_rangingToken]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_aksAuthSession));
  sub_100225AA0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_authToken), *(_QWORD *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_authToken]);
  sub_1002443C8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_metrics, type metadata accessor for SDAuthenticationLockSession.Metrics);
}

@end
