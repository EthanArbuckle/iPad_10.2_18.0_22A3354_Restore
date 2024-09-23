@implementation PXStoryRelatedMusicCurationParameters

- (PXStoryRelatedMusicCurationParameters)init
{
  PXStoryRelatedMusicCurationParameters *v2;
  uint64_t v3;
  NSSet *recentlyUsedFlexSongIDs;
  uint64_t v5;
  NSSet *recentlyUsedAppleMusicSongIDs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryRelatedMusicCurationParameters;
  v2 = -[PXStoryRelatedMusicCurationParameters init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    recentlyUsedFlexSongIDs = v2->_recentlyUsedFlexSongIDs;
    v2->_recentlyUsedFlexSongIDs = (NSSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    recentlyUsedAppleMusicSongIDs = v2->_recentlyUsedAppleMusicSongIDs;
    v2->_recentlyUsedAppleMusicSongIDs = (NSSet *)v5;

  }
  return v2;
}

- (NSSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
}

@end
