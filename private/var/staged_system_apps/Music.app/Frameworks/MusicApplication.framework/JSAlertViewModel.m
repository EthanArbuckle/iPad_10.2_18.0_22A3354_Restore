@implementation JSAlertViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore16JSAlertViewModel_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore16JSAlertViewModel_message]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore16JSAlertViewModel_alertActions));
}

@end
