@implementation VUIPlaybackPositionInfo

- (id)copyWithZone:(_NSZone *)a3
{
  VUIPlaybackPositionInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(VUIPlaybackPositionInfo);
  -[VUIPlaybackPositionInfo bookmarkTime](self, "bookmarkTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackPositionInfo setBookmarkTime:](v4, "setBookmarkTime:", v5);

  -[VUIPlaybackPositionInfo playCount](self, "playCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackPositionInfo setPlayCount:](v4, "setPlayCount:", v6);

  -[VUIPlaybackPositionInfo hasBeenPlayed](self, "hasBeenPlayed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackPositionInfo setHasBeenPlayed:](v4, "setHasBeenPlayed:", v7);

  return v4;
}

- (NSNumber)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkTime, a3);
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
  objc_storeStrong((id *)&self->_playCount, a3);
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(id)a3
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_bookmarkTime, 0);
}

@end
