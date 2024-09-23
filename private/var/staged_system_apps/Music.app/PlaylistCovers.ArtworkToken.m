@implementation PlaylistCovers.ArtworkToken

- (id)copyWithZone:(void *)a3
{
  _TtCO9MusicCore14PlaylistCovers12ArtworkToken *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  PlaylistCovers.ArtworkToken.copy(with:)(v8);

  v4 = v9;
  v5 = sub_100007E68(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  _s5Music18DragDropToPlaylistV6OriginVwxx_0(v8);
  return v6;
}

- (id)stringRepresentation
{
  _TtCO9MusicCore14PlaylistCovers12ArtworkToken *v2;
  void *object;
  NSString v4;

  v2 = self;
  object = PlaylistCovers.ArtworkToken.stringRepresentation()().value._object;

  if (object)
  {
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_TtCO9MusicCore14PlaylistCovers12ArtworkToken)init
{
  _TtCO9MusicCore14PlaylistCovers12ArtworkToken *result;

  result = (_TtCO9MusicCore14PlaylistCovers12ArtworkToken *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.ArtworkToken", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation];
  v4 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 8];
  v5 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 16];
  v6 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 24];
  v7 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 32];
  objc_release(*(id *)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                               + 40]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_playlistTitle]);
}

@end
