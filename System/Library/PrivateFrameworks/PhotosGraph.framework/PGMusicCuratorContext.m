@implementation PGMusicCuratorContext

- (PGMusicCache)cache
{
  return (PGMusicCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PGMusicCuratorContext_cache));
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_useOnlyMusicForTopicInTopPickSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_useOnlyMusicForTopicInTopPickSuggestions;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)allowChillMixElection
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowChillMixElection;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowChillMixElection:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowChillMixElection;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)allowGetUpMixElection
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowGetUpMixElection;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowGetUpMixElection:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowGetUpMixElection;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)refreshSongMetadata
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_refreshSongMetadata;
  swift_beginAccess();
  return *v2;
}

- (void)setRefreshSongMetadata:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_refreshSongMetadata;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)forceShareableInBestSuggestions
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_forceShareableInBestSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setForceShareableInBestSuggestions:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_forceShareableInBestSuggestions;
  swift_beginAccess();
  *v4 = a3;
}

- (PGMusicCurationRecentlyUsedSongs)recentlyUsedSongs
{
  return (PGMusicCurationRecentlyUsedSongs *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___PGMusicCuratorContext_recentlyUsedSongs));
}

- (NSDictionary)musicCurationOverrideDictionary
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuratorContext_musicCurationOverrideDictionary);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setMusicCurationOverrideDictionary:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_1CA85B414();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___PGMusicCuratorContext_musicCurationOverrideDictionary);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)bypassMusicForTopicElection
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_bypassMusicForTopicElection;
  swift_beginAccess();
  return *v2;
}

- (void)setBypassMusicForTopicElection:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_bypassMusicForTopicElection;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)genre
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setGenre:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PGMusicCuratorContext_genre);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

+ (id)contextWithPhotoLibrary:(id)a3 adamIDsWithNegativeUserFeedback:(id)a4 allowExplicitMusicContent:(id)a5 cache:(id)a6 musicBag:(id)a7 recentlyUsedSongs:(id)a8 genre:(id)a9 configuration:(id)a10 error:(id *)a11
{
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  if (!a4)
  {
    v26 = 0;
    if (a9)
      goto LABEL_3;
LABEL_5:
    v24 = 0;
    v25 = 0;
    goto LABEL_6;
  }
  v26 = sub_1CA85B984();
  if (!a9)
    goto LABEL_5;
LABEL_3:
  v24 = sub_1CA85B534();
  v25 = v16;
LABEL_6:
  v17 = a3;
  v27 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v22 = sub_1CA3EBCF8(v17, v26, a5, (char *)a6, a7, a8, v24, v25, (uint64_t)a10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

- (PGMusicCuratorContext)init
{
  PGMusicCuratorContext *result;

  result = (PGMusicCuratorContext *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1CA37E6C8(*(id *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuratorContext____lazy_storage___keywordsByAdamID), self->configuration[OBJC_IVAR___PGMusicCuratorContext____lazy_storage___keywordsByAdamID]);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  PGMusicCuratorContext *v2;
  void *v3;

  v2 = self;
  MusicCuratorContext.description.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
