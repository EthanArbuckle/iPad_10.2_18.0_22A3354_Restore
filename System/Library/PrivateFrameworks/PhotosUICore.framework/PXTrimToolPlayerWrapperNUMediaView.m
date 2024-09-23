@implementation PXTrimToolPlayerWrapperNUMediaView

- (PXTrimToolPlayerWrapperNUMediaView)initWithNUMediaView:(id)a3
{
  id v5;
  PXTrimToolPlayerWrapperNUMediaView *v6;
  PXTrimToolPlayerWrapperNUMediaView *v7;
  uint64_t v8;
  NUMediaView *mediaView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXTrimToolPlayerWrapperNUMediaView;
  v6 = -[PXTrimToolPlayerWrapperNUMediaView init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fullVideoPipelineFilters, a3);
    objc_msgSend(v5, "player");
    v8 = objc_claimAutoreleasedReturnValue();
    mediaView = v7->_mediaView;
    v7->_mediaView = (NUMediaView *)v8;

    -[PXTrimToolPlayerWrapperNUMediaView _registerDefaultMediaViewObserver](v7, "_registerDefaultMediaViewObserver");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PXTrimToolPlayerWrapperNUMediaView _removeMediaPlayerObserver](self, "_removeMediaPlayerObserver");
  v3.receiver = self;
  v3.super_class = (Class)PXTrimToolPlayerWrapperNUMediaView;
  -[PXTrimToolPlayerWrapperNUMediaView dealloc](&v3, sel_dealloc);
}

- (AVPlayer)_currentAVPlayer
{
  void *v2;
  void *v3;
  void *v4;

  -[PXTrimToolPlayerWrapperNUMediaView mediaView](self, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_videoPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayer *)v4;
}

- (void)_updateLoupePlayerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXTrimToolPlayerWrapperNUMediaView loupePlayerView](self, "loupePlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PXTrimToolPlayerWrapperNUMediaView _currentAVPlayer](self, "_currentAVPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    objc_msgSend(v6, "setPlayer:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setToneMapToStandardDynamicRange:", 1);

}

- (void)_registerDefaultMediaViewObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __71__PXTrimToolPlayerWrapperNUMediaView__registerDefaultMediaViewObserver__block_invoke;
  v11 = &unk_1E5142738;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "addPlaybackStateObserver:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTrimToolPlayerWrapperNUMediaView setMediaViewObservers:](self, "setMediaViewObservers:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_registerTimeMediaViewObserver
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, __int128 *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __68__PXTrimToolPlayerWrapperNUMediaView__registerTimeMediaViewObserver__block_invoke;
  v9 = &unk_1E5142760;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "addPlaybackTimeObserver:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTrimToolPlayerWrapperNUMediaView setMediaViewTimeObserver:](self, "setMediaViewTimeObserver:", v4, v6, v7, v8, v9);
  -[PXTrimToolPlayerWrapperNUMediaView mediaViewObservers](self, "mediaViewObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_removeMediaPlayerObserver
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXTrimToolPlayerWrapperNUMediaView _removeTimeObserver](self, "_removeTimeObserver");
  -[PXTrimToolPlayerWrapperNUMediaView mediaViewObservers](self, "mediaViewObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTrimToolPlayerWrapperNUMediaView setMediaViewObservers:](self, "setMediaViewObservers:", 0);
  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_removeTimeObserver
{
  void *v3;
  void *v4;
  id v5;

  -[PXTrimToolPlayerWrapperNUMediaView mediaViewTimeObserver](self, "mediaViewTimeObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", v5);

    -[PXTrimToolPlayerWrapperNUMediaView mediaViewObservers](self, "mediaViewObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    -[PXTrimToolPlayerWrapperNUMediaView setMediaViewTimeObserver:](self, "setMediaViewTimeObserver:", 0);
  }

}

- (void)_handleMediaPlayerObserverTimeChanged:(id *)a3
{
  void *v5;
  CMTime rhs;
  CMTime lhs;
  CMTime v8;
  CMTimeValue v9;
  CMTimeScale v10;
  CMTimeFlags v11;
  CMTimeEpoch v12;
  CMTimeValue v13;
  CMTimeScale v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_delegateFlags.respondsToTimeChanged)
  {
    -[PXTrimToolPlayerWrapperNUMediaView trimRange](self, "trimRange");
    v13 = v9;
    v14 = v10;
    if (!-[PXTrimToolPlayerWrapperNUMediaView showsUntrimmed](self, "showsUntrimmed") && (v11 & 0x1D) == 1)
    {
      lhs = (CMTime)*a3;
      rhs.value = v13;
      rhs.timescale = v14;
      rhs.flags = v11;
      rhs.epoch = v12;
      CMTimeAdd(&v8, &lhs, &rhs);
      *(CMTime *)a3 = v8;
    }
    -[PXTrimToolPlayerWrapperNUMediaView playerObserver](self, "playerObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CMTime)*a3;
    objc_msgSend(v5, "playerWrapper:timeChanged:", self, &v8);

  }
}

- (void)_handleMediaPlayerObserverStatusChanged:(int64_t)a3
{
  void *v4;

  if (self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper)
  {
    -[PXTrimToolPlayerWrapperNUMediaView playerObserver](self, "playerObserver", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerStatusChangedForPlayerWrapper:", self);

  }
  -[PXTrimToolPlayerWrapperNUMediaView _updateLoupePlayerView](self, "_updateLoupePlayerView", a3);
}

- (void)setPlayerObserver:(id)a3
{
  BOOL *p_showsUntrimmed;
  id v5;

  p_showsUntrimmed = &self->_showsUntrimmed;
  v5 = a3;
  objc_storeWeak((id *)p_showsUntrimmed, v5);
  self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_showsUntrimmed) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTimeChanged = p_showsUntrimmed & 1;
}

- (_PXTrimToolPlayerWrapperAVPlayerView)loupePlayerView
{
  id mediaViewTimeObserver;
  _PXTrimToolPlayerWrapperAVPlayerView *v4;
  void *v5;
  _PXTrimToolPlayerWrapperAVPlayerView *v6;
  id v7;

  mediaViewTimeObserver = self->_mediaViewTimeObserver;
  if (!mediaViewTimeObserver)
  {
    v4 = [_PXTrimToolPlayerWrapperAVPlayerView alloc];
    -[PXTrimToolPlayerWrapperNUMediaView _currentAVPlayer](self, "_currentAVPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_PXTrimToolPlayerWrapperAVPlayerView initWithPlayer:](v4, "initWithPlayer:", v5);
    v7 = self->_mediaViewTimeObserver;
    self->_mediaViewTimeObserver = v6;

    mediaViewTimeObserver = self->_mediaViewTimeObserver;
  }
  return (_PXTrimToolPlayerWrapperAVPlayerView *)mediaViewTimeObserver;
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[PXTrimToolPlayerWrapperNUMediaView seekToTime:untrimmed:exact:](self, "seekToTime:untrimmed:exact:", &v3, 1, 1);
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[PXTrimToolPlayerWrapperNUMediaView seekToTime:untrimmed:exact:forceSeek:](self, "seekToTime:untrimmed:exact:forceSeek:", &v5, a4, a5, 0);
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6
{
  _BOOL8 v8;
  unsigned int v11;
  char var2;
  void *v13;
  void *v14;
  int v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  int64_t var3;
  BOOL v21;
  BOOL v22;
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  CMTime v26;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27[2];

  v8 = a4;
  v11 = a3->var2 & 0x11;
  memset(&v27[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  -[PXTrimToolPlayerWrapperNUMediaView seekTime](self, "seekTime");
  var2 = v27[1].var2;
  v27[0] = *a3;
  -[PXTrimToolPlayerWrapperNUMediaView setSeekTime:](self, "setSeekTime:", v27);
  -[PXTrimToolPlayerWrapperNUMediaView mediaView](self, "mediaView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 == 1 && (var2 & 1) == 0)
  {
    -[PXTrimToolPlayerWrapperNUMediaView setDidLoopVideoBeforeSeek:](self, "setDidLoopVideoBeforeSeek:", objc_msgSend(v13, "loopsVideoPlayback"));
    if (v8)
      objc_msgSend(v14, "setLoopsVideoPlayback:", 0);
    -[PXTrimToolPlayerWrapperNUMediaView setDidPlayBeforeSeek:](self, "setDidPlayBeforeSeek:", -[PXTrimToolPlayerWrapperNUMediaView isPlaying](self, "isPlaying"));
    -[PXTrimToolPlayerWrapperNUMediaView pause](self, "pause");
  }
  else if (v11 != 1)
  {
    time1 = (CMTime)v27[1];
    time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      -[PXTrimToolPlayerWrapperNUMediaView setShowsUntrimmed:](self, "setShowsUntrimmed:", 0);
      -[PXTrimToolPlayerWrapperNUMediaView setPipelineFiltersBeforeSeek:](self, "setPipelineFiltersBeforeSeek:", 0);
      v16 = objc_msgSend(v14, "loopsVideoPlayback");
      if (v16 != -[PXTrimToolPlayerWrapperNUMediaView didLoopVideoBeforeSeek](self, "didLoopVideoBeforeSeek"))
        objc_msgSend(v14, "setLoopsVideoPlayback:", -[PXTrimToolPlayerWrapperNUMediaView didLoopVideoBeforeSeek](self, "didLoopVideoBeforeSeek"));
      if (-[PXTrimToolPlayerWrapperNUMediaView didPlayBeforeSeek](self, "didPlayBeforeSeek"))
        -[PXTrimToolPlayerWrapperNUMediaView play](self, "play");
      else
        -[PXTrimToolPlayerWrapperNUMediaView pause](self, "pause");
    }
    goto LABEL_18;
  }
  -[PXTrimToolPlayerWrapperNUMediaView trimRange](self, "trimRange");
  if (!v8 && (v26.flags & 0x1D) == 1)
  {
    time2 = (CMTime)*a3;
    rhs = v26;
    CMTimeSubtract(&time1, &time2, &rhs);
    *(CMTime *)a3 = time1;
  }
  objc_initWeak((id *)&time1, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PXTrimToolPlayerWrapperNUMediaView_seekToTime_untrimmed_exact_forceSeek___block_invoke;
  v17[3] = &unk_1E5142788;
  v21 = a6;
  objc_copyWeak(&v18, (id *)&time1);
  v19 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v22 = a5;
  -[PXTrimToolPlayerWrapperNUMediaView setShowsUntrimmed:completion:](self, "setShowsUntrimmed:completion:", v8, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)&time1);
LABEL_18:

}

- (void)setPosterFrame:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *a3;
  objc_msgSend(v4, "seekToTime:exact:", &v5, 1);

}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)trimRange
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self->var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var2;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)((char *)&self->var1.var3 + 4);
  return self;
}

- (void)applyTrimTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)((char *)&self->_trimRange.duration.value + 4) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimRange.start.flags = v4;
  *(_OWORD *)(&self->_delegateFlags + 2) = v3;
}

- (void)requestAssetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXTrimToolPlayerWrapperNUMediaView playerItemSource](self, "playerItemSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTrimToolPlayerWrapperNUMediaView fullVideoPipelineFilters](self, "fullVideoPipelineFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trimToolPlayerWrapper:requestAssetWithFilters:completion:", self, v5, v4);

}

- (void)invalidateComposition
{
  id v3;

  -[PXTrimToolPlayerWrapperNUMediaView playerObserver](self, "playerObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compositionDidUpdateForPlayerWrapper:", self);

}

- (BOOL)isReadyToPlay
{
  void *v2;
  uint64_t v3;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isPlaying
{
  void *v2;
  uint64_t v3;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState");

  return v3 == 3;
}

- (void)play
{
  id v2;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)pause
{
  id v2;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)stepByCount:(int64_t)a3 playheadTime:(id *)a4
{
  id v5;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stepByCount:", a3);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PXTrimToolPlayerWrapperNUMediaView mediaPlayer](self, "mediaPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setShowsUntrimmed:(BOOL)a3
{
  -[PXTrimToolPlayerWrapperNUMediaView setShowsUntrimmed:completion:](self, "setShowsUntrimmed:completion:", a3, 0);
}

- (void)setShowsUntrimmed:(BOOL)a3 completion:(id)a4
{
  int v4;
  id v6;
  void *v7;
  NSArray *fullVideoPipelineFilters;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  char v21;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (BYTE4(self->_trimRange.duration.epoch) != v4)
  {
    fullVideoPipelineFilters = self->_fullVideoPipelineFilters;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __67__PXTrimToolPlayerWrapperNUMediaView_setShowsUntrimmed_completion___block_invoke;
    v19 = &unk_1E51427B0;
    v20 = v6;
    v21 = 1;
    -[NSArray installRenderingCompletionBlock:](fullVideoPipelineFilters, "installRenderingCompletionBlock:", &v16);
    BYTE4(self->_trimRange.duration.epoch) = v4;
    -[PXTrimToolPlayerWrapperNUMediaView mediaView](self, "mediaView", v16, v17, v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
    {
      objc_msgSend(v9, "pipelineFilters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTrimToolPlayerWrapperNUMediaView setPipelineFiltersBeforeSeek:](self, "setPipelineFiltersBeforeSeek:", v11);

      -[PXTrimToolPlayerWrapperNUMediaView fullVideoPipelineFilters](self, "fullVideoPipelineFilters");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PXTrimToolPlayerWrapperNUMediaView pipelineFiltersBeforeSeek](self, "pipelineFiltersBeforeSeek");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pipelineFilters");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v12)
      {

        goto LABEL_10;
      }
      v14 = v13;
      v15 = objc_msgSend(v13, "isEqual:", v12);

      if ((v15 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    objc_msgSend(v10, "setPipelineFilters:", v12);
    goto LABEL_10;
  }
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_11:

}

- (PXTrimToolPlayerObserver)playerObserver
{
  return (PXTrimToolPlayerObserver *)objc_loadWeakRetained((id *)&self->_showsUntrimmed);
}

- (PXTrimToolPlayerWrapperNUMediaViewPlayerItemSource)playerItemSource
{
  return (PXTrimToolPlayerWrapperNUMediaViewPlayerItemSource *)objc_loadWeakRetained((id *)&self->_playerObserver);
}

- (void)setPlayerItemSource:(id)a3
{
  objc_storeWeak((id *)&self->_playerObserver, a3);
}

- (NSArray)fullVideoPipelineFilters
{
  return (NSArray *)self->_playerItemSource;
}

- (void)setFullVideoPipelineFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)showsUntrimmed
{
  return BYTE4(self->_trimRange.duration.epoch);
}

- (NUMediaView)mediaView
{
  return (NUMediaView *)self->_fullVideoPipelineFilters;
}

- (NUMediaPlayer)mediaPlayer
{
  return self->_mediaView;
}

- (void)setMediaPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaView, a3);
}

- (NSMutableArray)mediaViewObservers
{
  return (NSMutableArray *)self->_mediaPlayer;
}

- (void)setMediaViewObservers:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayer, a3);
}

- (id)mediaViewTimeObserver
{
  return self->_mediaViewObservers;
}

- (void)setMediaViewTimeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mediaViewObservers, a3);
}

- (void)setLoupePlayerView:(id)a3
{
  objc_storeStrong(&self->_mediaViewTimeObserver, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 136);
  return self;
}

- (void)setSeekTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_seekTime.timescale = a3->var3;
  *(_OWORD *)&self->_pipelineFiltersBeforeSeek = v3;
}

- (BOOL)didPlayBeforeSeek
{
  return BYTE5(self->_trimRange.duration.epoch);
}

- (void)setDidPlayBeforeSeek:(BOOL)a3
{
  BYTE5(self->_trimRange.duration.epoch) = a3;
}

- (BOOL)didLoopVideoBeforeSeek
{
  return BYTE6(self->_trimRange.duration.epoch);
}

- (void)setDidLoopVideoBeforeSeek:(BOOL)a3
{
  BYTE6(self->_trimRange.duration.epoch) = a3;
}

- (NSArray)pipelineFiltersBeforeSeek
{
  return (NSArray *)self->_loupePlayerView;
}

- (void)setPipelineFiltersBeforeSeek:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loupePlayerView, 0);
  objc_storeStrong(&self->_mediaViewTimeObserver, 0);
  objc_storeStrong((id *)&self->_mediaViewObservers, 0);
  objc_storeStrong((id *)&self->_mediaPlayer, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_fullVideoPipelineFilters, 0);
  objc_storeStrong((id *)&self->_playerItemSource, 0);
  objc_destroyWeak((id *)&self->_playerObserver);
  objc_destroyWeak((id *)&self->_showsUntrimmed);
}

uint64_t __67__PXTrimToolPlayerWrapperNUMediaView_setShowsUntrimmed_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __75__PXTrimToolPlayerWrapperNUMediaView_seekToTime_untrimmed_exact_forceSeek___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (*(_BYTE *)(a1 + 64))
    v3 = 1;
  else
    v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 65);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "seekToTime:exact:forceSeek:", &v7, v6, v3);

}

void __68__PXTrimToolPlayerWrapperNUMediaView__registerTimeMediaViewObserver__block_invoke(uint64_t a1, void *a2, __int128 *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v5 = a2;
  v6 = v5;
  v10 = 0uLL;
  v11 = 0;
  if (v5)
  {
    objc_msgSend(v5, "currentSeekTime");
    if ((BYTE12(v10) & 1) != 0)
    {
      *a3 = v10;
      *((_QWORD *)a3 + 2) = v11;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  objc_msgSend(WeakRetained, "_handleMediaPlayerObserverTimeChanged:", &v8);

}

void __71__PXTrimToolPlayerWrapperNUMediaView__registerDefaultMediaViewObserver__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMediaPlayerObserverStatusChanged:", a3);

}

@end
