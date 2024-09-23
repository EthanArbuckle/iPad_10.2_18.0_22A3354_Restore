@implementation PGMusicCuration

- (NSString)description
{
  PGMusicCuration *v2;
  void *v3;

  v2 = self;
  MusicCuration.description.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)jsonRepresentation
{
  PGMusicCuration *v2;
  void *object;
  void *v4;

  v2 = self;
  object = MusicCuration.jsonRepresentation()().value._object;

  if (object)
  {
    v4 = (void *)sub_1CA85B510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PGMusicCuration)init
{
  PGMusicCuration *result;

  result = (PGMusicCuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  PGMusicCuration *v4;
  PGMusicCuration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CA85BD5C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = MusicCuration.isEqual(_:)((uint64_t)v8);

  sub_1CA2F0DBC((uint64_t)v8);
  return v6 & 1;
}

- (NSString)keySongAdamID
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions))[2])
  {
    type metadata accessor for Song();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1CA85B510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)keySongTitle
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions);
  if (*(_QWORD *)(v2 + 16)
    && (v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Song() - 8) + 80),
        *(_QWORD *)(v2 + ((v3 + 32) & ~v3) + 24)))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1CA85B510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)keySongArtist
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions);
  if (*(_QWORD *)(v2 + 16)
    && (v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Song() - 8) + 80),
        *(_QWORD *)(v2 + ((v3 + 32) & ~v3) + 40)))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1CA85B510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSNumber)keySongArousal
{
  PGMusicCuration *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MusicCuration.keySongArousal.getter();

  return (NSNumber *)v3;
}

- (NSNumber)keySongValence
{
  PGMusicCuration *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MusicCuration.keySongValence.getter();

  return (NSNumber *)v3;
}

- (id)replaceBestMusicSuggestionsWithAdamIds:(id)a3
{
  uint64_t v4;
  PGMusicCuration *v5;
  id v6;

  v4 = sub_1CA85B7B0();
  v5 = self;
  v6 = MusicCuration.replaceBestMusicSuggestions(adamIds:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  PGMusicCuration *v7;
  id v8;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = self;
  v8 = MusicCuration.replaceFirstSongInBestSongSuggestions(with:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end
