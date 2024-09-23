@implementation JSSocialProfileCollectionItem

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore29JSSocialProfileCollectionItem_profile));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore29JSSocialProfileCollectionItem_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore29JSSocialProfileCollectionItem_subtitle]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore29JSSocialProfileCollectionItem_pendingFollowButtonSelectionPerformedContexts));
}

@end
