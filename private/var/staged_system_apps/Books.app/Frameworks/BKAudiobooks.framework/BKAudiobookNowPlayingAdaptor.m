@implementation BKAudiobookNowPlayingAdaptor

+ (id)sharedInstance
{
  if (qword_44D90 != -1)
    dispatch_once(&qword_44D90, &stru_38D18);
  return (id)qword_44D98;
}

- (BKAudiobookNowPlayingAdaptor)initWithPlayer:(id)a3
{
  id v5;
  BKAudiobookNowPlayingAdaptor *v6;
  BKAudiobookNowPlayingAdaptor *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookNowPlayingAdaptor;
  v6 = -[BKAudiobookNowPlayingAdaptor init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](v7, "player"));
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)setAudiobookPlayerActiveOutput:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (self->_audiobookPlayerActiveOutput != a3)
  {
    v3 = a3;
    self->_audiobookPlayerActiveOutput = a3;
    v5 = BKAudiobooksNowPlayingAdaptorLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "audiobook player set to active", buf, 2u);
      }

      MRMediaRemoteSetCanBeNowPlayingApplication(1);
      -[BKAudiobookNowPlayingAdaptor invalidatePlaybackQueue](self, "invalidatePlaybackQueue");
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "audiobook player set to inactive", v8, 2u);
      }

      MRMediaRemoteSetCanBeNowPlayingApplication(0);
    }
  }
}

- (void)invalidatePlaybackQueue
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = BKAudiobooksNowPlayingAdaptorLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "invalidatePlaybackQueue", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](MPNowPlayingInfoCenter, "defaultCenter"));
  objc_msgSend(v4, "invalidatePlaybackQueue");

}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  -[BKAudiobookNowPlayingAdaptor invalidatePlaybackQueue](self, "invalidatePlaybackQueue", a3, a4);
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 0);
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  -[BKAudiobookNowPlayingAdaptor invalidatePlaybackQueue](self, "invalidatePlaybackQueue", a3, a4);
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 0);
}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 0, a5, a4, a6);
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if ((unint64_t)(a5 - 1) <= 1)
    -[BKAudiobookNowPlayingAdaptor setAudiobookPlayerActiveOutput:](self, "setAudiobookPlayerActiveOutput:", 1, a4);
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 1);
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 1);
}

- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5
{
  -[BKAudiobookNowPlayingAdaptor nowPlayingInfoChanged:](self, "nowPlayingInfoChanged:", 0, a4, a5);
}

- (BOOL)audiobookPlayerActiveOutput
{
  return self->_audiobookPlayerActiveOutput;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BKAudiobookGenericCoverProvider)genericCoverProvider
{
  return (BKAudiobookGenericCoverProvider *)objc_loadWeakRetained((id *)&self->_genericCoverProvider);
}

- (void)setGenericCoverProvider:(id)a3
{
  objc_storeWeak((id *)&self->_genericCoverProvider, a3);
}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_genericCoverProvider);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
