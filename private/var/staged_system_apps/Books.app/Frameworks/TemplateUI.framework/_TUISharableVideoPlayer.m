@implementation _TUISharableVideoPlayer

- (_TUISharableVideoPlayer)initWithURL:(id)a3 videoId:(id)a4
{
  id v6;
  id v7;
  _TUISharableVideoPlayer *v8;
  _TUISharableVideoPlayer *v9;
  TUIVideoPlayer *v10;
  TUIVideoPlayer *player;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_TUISharableVideoPlayer;
  v8 = -[_TUISharableVideoPlayer init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_hostCount = 1;
    v10 = -[TUIVideoPlayer initWithUrl:videoId:]([TUIVideoPlayer alloc], "initWithUrl:videoId:", v6, v7);
    player = v9->_player;
    v9->_player = v10;

    v9->_triggerPlaybackEnabled = 1;
  }

  return v9;
}

- (void)incrementHostCount
{
  ++self->_hostCount;
}

- (void)decrementHostCount
{
  int64_t hostCount;
  BOOL v3;
  int64_t v4;

  hostCount = self->_hostCount;
  v3 = hostCount < 1;
  v4 = hostCount - 1;
  if (!v3)
    self->_hostCount = v4;
}

- (BOOL)shouldRelease
{
  return self->_hostCount == 0;
}

- (id)description
{
  void *v3;
  float v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer videoId](self->_player, "videoId"));
  -[TUIVideoPlayer rate](self->_player, "rate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<_TUISharableVideoPlayer: %p, videoId: %@, rate: %f, isPlaying: %i, triggerPlaybackEnabled: %i, isWithinVisibleBounds: %i>"), self, v3, v4, -[TUIVideoPlayer isPlaying](self->_player, "isPlaying"), self->_triggerPlaybackEnabled, self->_isWithinVisibleBounds));

  return v5;
}

- (TUIVideoPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (TUIVideoViewPlayerHosting)activeHost
{
  return (TUIVideoViewPlayerHosting *)objc_loadWeakRetained((id *)&self->_activeHost);
}

- (void)setActiveHost:(id)a3
{
  objc_storeWeak((id *)&self->_activeHost, a3);
}

- (BOOL)triggerPlaybackEnabled
{
  return self->_triggerPlaybackEnabled;
}

- (void)setTriggerPlaybackEnabled:(BOOL)a3
{
  self->_triggerPlaybackEnabled = a3;
}

- (BOOL)isWithinVisibleBounds
{
  return self->_isWithinVisibleBounds;
}

- (void)setIsWithinVisibleBounds:(BOOL)a3
{
  self->_isWithinVisibleBounds = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeHost);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
