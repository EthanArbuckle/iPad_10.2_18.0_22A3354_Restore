@implementation UpsellArtworkGrid

- (_TtC16MusicApplication17UpsellArtworkGrid)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC16MusicApplication17UpsellArtworkGrid *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworks) = (Class)_swiftEmptyArrayStorage;
  v5 = OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworkCachingReference;
  v6 = type metadata accessor for Artwork.Caching.Reference();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)swift_allocObject(v6, 16, 7);
  v7 = a3;

  result = (_TtC16MusicApplication17UpsellArtworkGrid *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/UpsellArtworkGrid.swift", 40, 2, 156, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication17UpsellArtworkGrid)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication17UpsellArtworkGrid *result;

  result = (_TtC16MusicApplication17UpsellArtworkGrid *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.UpsellArtworkGrid", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworks));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworkCachingReference));
}

@end
