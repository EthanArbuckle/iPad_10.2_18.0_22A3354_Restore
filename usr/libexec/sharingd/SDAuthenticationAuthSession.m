@implementation SDAuthenticationAuthSession

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_rangingSession));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_wifiRequest));
  sub_100225AB4(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_AWDLInfo), *(_QWORD *)&self->super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_AWDLInfo]);
}

@end
