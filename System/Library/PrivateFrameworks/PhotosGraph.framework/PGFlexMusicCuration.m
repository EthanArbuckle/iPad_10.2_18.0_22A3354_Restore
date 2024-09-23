@implementation PGFlexMusicCuration

- (NSArray)bestSongSuggestions
{
  return (NSArray *)sub_1CA4C1300();
}

- (NSArray)secondarySongSuggestions
{
  return (NSArray *)sub_1CA4C1300();
}

- (id)jsonRepresentation
{
  return sub_1CA4C1F74(self, (uint64_t)a2, (void (*)(void))FlexMusicCuration.jsonRepresentation());
}

- (id)expandedJsonRepresentation
{
  return sub_1CA4C1F74(self, (uint64_t)a2, (void (*)(void))FlexMusicCuration.expandedJsonRepresentation());
}

- (NSString)description
{
  PGFlexMusicCuration *v2;
  void *v3;

  v2 = self;
  FlexMusicCuration.description.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PGFlexMusicCuration)init
{
  PGFlexMusicCuration *result;

  result = (PGFlexMusicCuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)replaceBestSongSuggestionsWithFlexSongIds:(id)a3
{
  uint64_t v4;
  PGFlexMusicCuration *v5;
  id v6;

  v4 = sub_1CA85B7B0();
  v5 = self;
  v6 = FlexMusicCuration.replaceBestSongSuggestions(flexSongIds:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  PGFlexMusicCuration *v7;
  id v8;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = self;
  v8 = FlexMusicCuration.replaceFirstSongInBestSongSuggestions(with:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end
