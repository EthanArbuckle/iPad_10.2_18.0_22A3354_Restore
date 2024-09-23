@implementation SDAuthenticationKeySession

- (void).cxx_destruct
{
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_lastUnlockDate, &qword_1007C4330);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_aksAuthSession));
  sub_100225AA0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken), *(_QWORD *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken]);
}

@end
