@implementation TVPPlayerBookmarkMonitor

- (void)setPlayerHasFinishedLoading:(BOOL)a3
{
  self->_playerHasFinishedLoading = a3;
}

- (void)setBookmarkPeriodicSaveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkPeriodicSaveTimer, a3);
}

- (TVPPlayerBookmarkMonitor)initWithPlayer:(id)a3
{
  id v4;
  TVPPlayerBookmarkMonitor *v5;
  TVPPlayerBookmarkMonitor *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlayerBookmarkMonitor;
  v5 = -[TVPPlayerBookmarkMonitor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerStateWillChange_, CFSTR("TVPPlaybackStateWillChangeNotification"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerCurrentMediaItemWillChange_, CFSTR("TVPPlaybackCurrentMediaItemWillChangeNotification"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerErrorDidOccur_, CFSTR("TVPPlaybackErrorNotification"), v4);

  }
  return v6;
}

- (NSTimer)bookmarkPeriodicSaveTimer
{
  return self->_bookmarkPeriodicSaveTimer;
}

- (void)_playerStateWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "object");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("TVPPlaybackStateNewStateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

  }
  else
  {
    v9 = (void *)v8;
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v10)
    {
      if (!v5)
        goto LABEL_16;
      goto LABEL_7;
    }
  }
  -[TVPPlayerBookmarkMonitor setPlayerHasFinishedLoading:](self, "setPlayerHasFinishedLoading:", 1);
  if (!v5)
    goto LABEL_16;
LABEL_7:
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v11)
  {

  }
  else
  {
    v12 = (void *)v11;
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v13)
      goto LABEL_16;
  }
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsBookmarks")))
    -[TVPPlayerBookmarkMonitor _updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:](self, "_updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:", v5, v22, v7 == v14);
  if (objc_msgSend(v5, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsPlayCounts")) && v7 == v14)
    -[TVPPlayerBookmarkMonitor _updatePlayCountForMediaItem:player:](self, "_updatePlayCountForMediaItem:player:", v5, v22);
LABEL_16:
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v15)
    -[TVPPlayerBookmarkMonitor setPlayerHasFinishedLoading:](self, "setPlayerHasFinishedLoading:", 0);
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVPPlayerBookmarkMonitor bookmarkPeriodicSaveTimer](self, "bookmarkPeriodicSaveTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v7 == v16)
  {

    if (v18)
      goto LABEL_22;
    objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataBookmarkSaveInterval"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (v19)
      objc_msgSend(v19, "doubleValue");
    else
      v20 = 300.0;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__bookmarkPeriodicSaveTimerFired_, 0, 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayerBookmarkMonitor setBookmarkPeriodicSaveTimer:](self, "setBookmarkPeriodicSaveTimer:", v21);

  }
  else
  {
    -[TVPPlayerBookmarkMonitor setBookmarkPeriodicSaveTimer:](self, "setBookmarkPeriodicSaveTimer:", 0);
    objc_msgSend(v18, "invalidate");
  }

LABEL_22:
}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      if (objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsBookmarks")))
        -[TVPPlayerBookmarkMonitor _updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:](self, "_updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:", v4, v7, 1);
      if (objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsPlayCounts")))
        -[TVPPlayerBookmarkMonitor _updatePlayCountForMediaItem:player:](self, "_updatePlayCountForMediaItem:player:", v4, v7);
    }
  }
  -[TVPPlayerBookmarkMonitor setPlayerHasFinishedLoading:](self, "setPlayerHasFinishedLoading:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerBookmarkMonitor;
  -[TVPPlayerBookmarkMonitor dealloc](&v4, sel_dealloc);
}

- (void)_playerErrorDidOccur:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsBookmarks")))
      -[TVPPlayerBookmarkMonitor _updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:](self, "_updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:", v5, v6, 1);
    if (objc_msgSend(v5, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsPlayCounts")))
      -[TVPPlayerBookmarkMonitor _updatePlayCountForMediaItem:player:](self, "_updatePlayCountForMediaItem:player:", v5, v6);
  }

}

- (void)_bookmarkPeriodicSaveTimerFired:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[TVPPlayerBookmarkMonitor player](self, "player", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitSupportsBookmarks")))
    -[TVPPlayerBookmarkMonitor _updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:](self, "_updateBookmarkTimeForMediaItem:player:playbackOfMediaItemIsEnding:", v5, v6, 0);

}

- (void)_updateBookmarkTimeForMediaItem:(id)a3 player:(id)a4 playbackOfMediaItemIsEnding:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "duration");
    v10 = v9;
    v11 = v9 == 0.0 || v9 == 3.40282347e38;
    if (!v11 && -[TVPPlayerBookmarkMonitor playerHasFinishedLoading](self, "playerHasFinishedLoading"))
    {
      objc_msgSend(v8, "elapsedTime");
      v13 = v12;
      objc_msgSend(v15, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataWatchedTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVPPlaybackUtilities suggestedBookmarkTimeForElapsedTime:duration:playedThreshold:](TVPPlaybackUtilities, "suggestedBookmarkTimeForElapsedTime:duration:playedThreshold:", v14, v13, v10);
      objc_msgSend(v15, "updateBookmarkWithSuggestedTime:forElapsedTime:duration:playbackOfMediaItemIsEnding:", v5);

    }
  }

}

- (void)_updatePlayCountForMediaItem:(id)a3 player:(id)a4
{
  id v6;
  double v7;
  BOOL v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "duration");
    v8 = v7 == 0.0 || v7 == 3.40282347e38;
    if (!v8 && -[TVPPlayerBookmarkMonitor playerHasFinishedLoading](self, "playerHasFinishedLoading"))
    {
      objc_msgSend(v6, "elapsedTime");
      objc_msgSend(v9, "updatePlayCountForElapsedTime:duration:");
    }
  }

}

- (TVPPlayback)player
{
  return (TVPPlayback *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (BOOL)playerHasFinishedLoading
{
  return self->_playerHasFinishedLoading;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_bookmarkPeriodicSaveTimer, 0);
}

@end
