@implementation JSCatalogPlaybackIntent

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_containerStoreItemMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_containerIdentifierSet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_items));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_itemIdentifiers));
}

@end
