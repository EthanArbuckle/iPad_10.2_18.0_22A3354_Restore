@implementation StoryPassthroughMusicCurationProvider

- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  sub_1A7ADBF34();
  v11 = (void *)sub_1A712202C((uint64_t)v9, a4, (uint64_t)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
  return v11;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  void *v3;

  swift_beginAccess();
  if (!*(_QWORD *)self->recentlyUsedFlexSongIDs)
    return (NSArray *)0;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v3 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  uint64_t v4;

  if (a3)
    v4 = sub_1A7AE3A10();
  else
    v4 = 0;
  swift_beginAccess();
  *(_QWORD *)self->recentlyUsedFlexSongIDs = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  void *v3;

  swift_beginAccess();
  if (!*(_QWORD *)self->recentlyUsedAppleMusicSongIDs)
    return (NSArray *)0;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v3 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  uint64_t v4;

  if (a3)
    v4 = sub_1A7AE3A10();
  else
    v4 = 0;
  swift_beginAccess();
  *(_QWORD *)self->recentlyUsedAppleMusicSongIDs = v4;
  swift_bridgeObjectRelease();
}

@end
