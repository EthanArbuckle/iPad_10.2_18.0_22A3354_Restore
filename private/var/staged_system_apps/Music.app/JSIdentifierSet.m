@implementation JSIdentifierSet

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore15JSIdentifierSet_storeCloudAlbumID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore15JSIdentifierSet_cloudUniversalLibraryID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore15JSIdentifierSet_storeAdamID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore15JSIdentifierSet_socialProfileID]);
}

@end
