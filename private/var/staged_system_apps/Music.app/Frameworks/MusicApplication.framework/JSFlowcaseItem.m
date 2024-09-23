@implementation JSFlowcaseItem

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_headlineText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_subtitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_descriptionTitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore14JSFlowcaseItem_thumbnailArtwork));
}

@end
