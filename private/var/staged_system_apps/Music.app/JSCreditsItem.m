@implementation JSCreditsItem

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSCreditsItem_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSCreditsItem_subtitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSCreditsItem_audioTrait]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore13JSCreditsItem_artistIdentifierSet));
}

@end
