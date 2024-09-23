@implementation JSSearchResultSection

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore21JSSearchResultSection_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore21JSSearchResultSection_items));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore21JSSearchResultSection_accessoryButtonTitle]);
}

@end
