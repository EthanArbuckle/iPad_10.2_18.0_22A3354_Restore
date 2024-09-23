@implementation TVRMSNowPlayingInfo

- (TVRMSNowPlayingInfo)initWithProtobuf:(id)a3
{
  id v4;
  TVRMSNowPlayingInfo *v5;
  uint64_t v6;
  NSString *trackName;
  uint64_t v8;
  NSString *artistName;
  uint64_t v10;
  NSString *albumName;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TVRMSNowPlayingInfo;
  v5 = -[TVRMSNowPlayingInfo init](&v16, sel_init);
  if (v5)
  {
    v5->_itemID = objc_msgSend(v4, "itemID");
    v5->_databaseID = objc_msgSend(v4, "databaseID");
    objc_msgSend(v4, "trackName");
    v6 = objc_claimAutoreleasedReturnValue();
    trackName = v5->_trackName;
    v5->_trackName = (NSString *)v6;

    objc_msgSend(v4, "artistName");
    v8 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v8;

    objc_msgSend(v4, "albumName");
    v10 = objc_claimAutoreleasedReturnValue();
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v10;

    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v12;
    objc_msgSend(v4, "timeRemaining");
    v5->_timeRemaining = v13;
    objc_msgSend(v4, "totalDuration");
    v5->_totalDuration = v14;
    v5->_revisionNumber = objc_msgSend(v4, "revisionNumber");
    v5->_mediaKind = (int)objc_msgSend(v4, "mediaKind");
    v5->_playbackState = (int)objc_msgSend(v4, "playbackState");
    v5->_likedState = (int)objc_msgSend(v4, "likedState");
    v5->_scrubbableState = (int)objc_msgSend(v4, "scrubbableState");
    v5->_canSkipNext = objc_msgSend(v4, "canSkipNext");
    v5->_canSkipPrevious = objc_msgSend(v4, "canSkipPrevious");
    v5->_likeable = objc_msgSend(v4, "likeable");
    v5->_canWishlist = objc_msgSend(v4, "canWishlist");
    v5->_hasChapterData = objc_msgSend(v4, "hasChapterData");
  }

  return v5;
}

- (id)protobuf
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setItemID:", self->_itemID);
  objc_msgSend(v3, "setDatabaseID:", self->_databaseID);
  objc_msgSend(v3, "setTrackName:", self->_trackName);
  objc_msgSend(v3, "setArtistName:", self->_artistName);
  objc_msgSend(v3, "setAlbumName:", self->_albumName);
  objc_msgSend(v3, "setTimestamp:", self->_timestamp);
  objc_msgSend(v3, "setTimeRemaining:", self->_timeRemaining);
  objc_msgSend(v3, "setTotalDuration:", self->_totalDuration);
  objc_msgSend(v3, "setRevisionNumber:", self->_revisionNumber);
  objc_msgSend(v3, "setMediaKind:", LODWORD(self->_mediaKind));
  objc_msgSend(v3, "setPlaybackState:", LODWORD(self->_playbackState));
  objc_msgSend(v3, "setLikedState:", LODWORD(self->_likedState));
  objc_msgSend(v3, "setScrubbableState:", LODWORD(self->_scrubbableState));
  objc_msgSend(v3, "setCanSkipNext:", self->_canSkipNext);
  objc_msgSend(v3, "setCanSkipPrevious:", self->_canSkipPrevious);
  objc_msgSend(v3, "setLikeable:", self->_likeable);
  objc_msgSend(v3, "setCanWishlist:", self->_canWishlist);
  objc_msgSend(v3, "setHasChapterData:", self->_hasChapterData);
  return v3;
}

- (NSString)artworkIdentifier
{
  void *v2;
  const __CFString *v3;
  NSString *trackName;
  unint64_t albumName;
  uint64_t v7;
  unint64_t artistName;

  if (self->_albumName)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    albumName = (unint64_t)self->_albumName;
    artistName = (unint64_t)self->_artistName;
    v3 = CFSTR("%@-%@");
LABEL_5:
    objc_msgSend(v2, "stringWithFormat:", v3, albumName, artistName);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_itemID)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    albumName = self->_databaseID;
    artistName = self->_itemID;
    v3 = CFSTR("%lld-%lld");
    goto LABEL_5;
  }
  trackName = self->_trackName;
  if (!trackName)
    return (NSString *)0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), trackName, v7);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPlaying
{
  return (unint64_t)(self->_playbackState - 4) < 3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Track name: %@, Artist name: %@, Album name: %@, Duration: %f, Time Remaining: %f, Media kind: %d, Playback state: %d"), self->_trackName, self->_artistName, self->_albumName, *(_QWORD *)&self->_totalDuration, *(_QWORD *)&self->_timeRemaining, self->_mediaKind, self->_playbackState);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(unint64_t)a3
{
  self->_databaseID = a3;
}

- (NSString)trackName
{
  return self->_trackName;
}

- (void)setTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_trackName, a3);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_artistName, a3);
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (int)revisionNumber
{
  return self->_revisionNumber;
}

- (void)setRevisionNumber:(int)a3
{
  self->_revisionNumber = a3;
}

- (int64_t)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(int64_t)a3
{
  self->_mediaKind = a3;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (int64_t)likedState
{
  return self->_likedState;
}

- (void)setLikedState:(int64_t)a3
{
  self->_likedState = a3;
}

- (int64_t)scrubbableState
{
  return self->_scrubbableState;
}

- (void)setScrubbableState:(int64_t)a3
{
  self->_scrubbableState = a3;
}

- (BOOL)canSkipNext
{
  return self->_canSkipNext;
}

- (void)setCanSkipNext:(BOOL)a3
{
  self->_canSkipNext = a3;
}

- (BOOL)canSkipPrevious
{
  return self->_canSkipPrevious;
}

- (void)setCanSkipPrevious:(BOOL)a3
{
  self->_canSkipPrevious = a3;
}

- (BOOL)canWishlist
{
  return self->_canWishlist;
}

- (void)setCanWishlist:(BOOL)a3
{
  self->_canWishlist = a3;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (void)setHasChapterData:(BOOL)a3
{
  self->_hasChapterData = a3;
}

- (BOOL)isLikeable
{
  return self->_likeable;
}

- (void)setLikeable:(BOOL)a3
{
  self->_likeable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end
