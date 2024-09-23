@implementation JSCreditsSection

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore16JSCreditsSection_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore16JSCreditsSection_items));
}

@end
