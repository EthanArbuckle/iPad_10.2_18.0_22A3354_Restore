@implementation ISPlayerView

- (ISPlayerView)initWithFrame:(CGRect)a3
{
  ISPlayerView *v3;
  NSMutableSet *v4;
  NSMutableSet *activeGestures;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISPlayerView;
  v3 = -[ISPlayerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeGestures = v3->__activeGestures;
    v3->__activeGestures = v4;

  }
  return v3;
}

- (ISPlayerView)initWithVideoPlayer:(id)a3
{
  id v4;
  ISPlayerView *v5;
  ISWrappedAVPlayer *v6;
  ISWrappedAVPlayer *videoPlayer;

  v4 = a3;
  v5 = -[ISPlayerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = -[ISWrappedAVPlayer _initWithAVPlayer:]([ISWrappedAVPlayer alloc], "_initWithAVPlayer:", v4);
    videoPlayer = v5->__videoPlayer;
    v5->__videoPlayer = v6;

  }
  return v5;
}

- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  ISAsset *v20;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v20 = -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:]([ISAsset alloc], "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:", v10, a3, v6, a5);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;

  +[ISPlayerItem playerItemWithAsset:targetSize:](ISPlayerItem, "playerItemWithAsset:targetSize:", v20, v13 * v18, v15 * v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISPlayerView prepareWithPlayerItem:](self, "prepareWithPlayerItem:", v19);

}

- (void)setPlaybackStyle:(unint64_t)a3
{
  if (self->_playbackStyle != a3)
  {
    self->_playbackStyle = a3;
    -[ISPlayerView _invalidatePlayerItemLoadingTarget](self, "_invalidatePlayerItemLoadingTarget");
    -[ISPlayerView _invalidatePlayerView](self, "_invalidatePlayerView");
    -[ISPlayerView _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISPlayerView;
  -[ISPlayerView setContentMode:](&v6, sel_setContentMode_);
  -[ISPlayerView _playerView](self, "_playerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (void)setAudioMuted:(BOOL)a3
{
  if (self->_audioMuted != a3)
  {
    self->_audioMuted = a3;
    -[ISPlayerView _invalidatePlayerMuted](self, "_invalidatePlayerMuted");
    -[ISPlayerView _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $E894BC1F5D5E8DC07101BC2274E7C523 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->playbackStateDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->interactingDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->gestureRecognizerDidChange = objc_opt_respondsToSelector() & 1;
  }

}

- (UIGestureRecognizer)gestureRecognizer
{
  void *v2;
  void *v3;

  -[ISPlayerView _playerView](self, "_playerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (void)_setPlayerItem:(id)a3
{
  ISPlayerItem *v5;
  ISPlayerItem **p_playerItem;
  ISPlayerItem *playerItem;
  ISPlayerItem *v8;

  v5 = (ISPlayerItem *)a3;
  p_playerItem = &self->__playerItem;
  playerItem = self->__playerItem;
  if (playerItem != v5)
  {
    v8 = v5;
    -[ISObservable unregisterChangeObserver:context:](playerItem, "unregisterChangeObserver:context:", self, ISPlayerItemObservationContext);
    objc_storeStrong((id *)&self->__playerItem, a3);
    -[ISObservable registerChangeObserver:context:](*p_playerItem, "registerChangeObserver:context:", self, ISPlayerItemObservationContext);
    -[ISPlayerItem setLoadingTarget:](*p_playerItem, "setLoadingTarget:", 2);
    -[ISPlayerView _invalidatePlayerPlayerItem](self, "_invalidatePlayerPlayerItem");
    -[ISPlayerView _invalidatePlayerItemLoadingTarget](self, "_invalidatePlayerItemLoadingTarget");
    -[ISPlayerView _invalidateReadyForDisplay](self, "_invalidateReadyForDisplay");
    -[ISPlayerView _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v8;
  }

}

- (void)_handleGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "state");
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      -[ISPlayerView _activeGestures](self, "_activeGestures");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);
    }
    else
    {
      -[ISPlayerView _activeGestures](self, "_activeGestures");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v8);
    }

  }
  -[ISPlayerView _activeGestures](self, "_activeGestures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  -[ISPlayerView _setInteracting:](self, "_setInteracting:", v7);
}

- (void)_setInteracting:(BOOL)a3
{
  id v4;

  if (self->_isInteracting != a3)
  {
    self->_isInteracting = a3;
    if (self->_delegateRespondsTo.interactingDidChange)
    {
      -[ISPlayerView delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playerViewIsInteractingDidChange:", self);

    }
  }
}

- (void)_setPlaybackState:(int64_t)a3
{
  id WeakRetained;

  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    if (self->_delegateRespondsTo.playbackStateDidChange)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "playerViewPlaybackStateDidChange:", self);

    }
  }
}

- (void)_setPlayerView:(id)a3
{
  ISBasePlayerUIView *v5;
  ISBasePlayerUIView **p_playerView;
  ISBasePlayerUIView *playerView;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  ISBasePlayerUIView *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (ISBasePlayerUIView *)a3;
  p_playerView = &self->__playerView;
  playerView = self->__playerView;
  if (playerView != v5)
  {
    -[ISBasePlayerUIView player](playerView, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterChangeObserver:context:", self, ISPlayerObservationContext);

    -[ISBasePlayerUIView player](*p_playerView, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", 0);

    -[ISBasePlayerUIView removeFromSuperview](*p_playerView, "removeFromSuperview");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[ISBasePlayerUIView gestureRecognizers](*p_playerView, "gestureRecognizers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "removeTarget:action:", self, 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->__playerView, a3);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[ISBasePlayerUIView gestureRecognizers](*p_playerView, "gestureRecognizers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "addTarget:action:", self, sel__handleGesture_);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

    -[ISBasePlayerUIView player](*p_playerView, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[ISBasePlayerUIView player](*p_playerView, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerChangeObserver:context:", self, ISPlayerObservationContext);

    v22 = *p_playerView;
    -[ISPlayerView bounds](self, "bounds");
    -[ISBasePlayerUIView setFrame:](v22, "setFrame:");
    -[ISPlayerView addSubview:](self, "addSubview:", *p_playerView);
    -[ISPlayerView _invalidatePlayerPlayerItem](self, "_invalidatePlayerPlayerItem");
    -[ISBasePlayerUIView playbackGestureRecognizer](*p_playerView, "playbackGestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISPlayerView _setGestureRecognizer:](self, "_setGestureRecognizer:", v23);

  }
}

- (void)_setGestureRecognizer:(id)a3
{
  void *v5;
  UIGestureRecognizer *v6;

  v6 = (UIGestureRecognizer *)a3;
  if (self->__gestureRecognizer != v6)
  {
    objc_storeStrong((id *)&self->__gestureRecognizer, a3);
    if (self->_delegateRespondsTo.gestureRecognizerDidChange)
    {
      -[ISPlayerView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "playerViewGestureRecognizerDidChange:", self);

    }
  }

}

- (void)_invalidatePlayerItemLoadingTarget
{
  self->_isValid.playerItemLoadingTarget = 0;
}

- (void)_invalidatePlayerPlayerItem
{
  self->_isValid.playerPlayerItem = 0;
}

- (void)_invalidatePlayerView
{
  self->_isValid.playerView = 0;
}

- (void)_invalidatePlayerMuted
{
  self->_isValid.playerMuted = 0;
}

- (void)_invalidateStatus
{
  self->_isValid.status = 0;
}

- (void)_invalidatePlaybackState
{
  self->_isValid.playbackState = 0;
}

- (void)_invalidateReadyForDisplay
{
  self->_isValid.readyForDisplay = 0;
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.playerPlayerItem
      || !self->_isValid.playerItemLoadingTarget
      || !self->_isValid.playerView
      || !self->_isValid.playerMuted
      || !self->_isValid.status
      || !self->_isValid.playbackState
      || !self->_isValid.readyForDisplay;
}

- (void)_updateIfNeeded
{
  if (-[ISPlayerView _needsUpdate](self, "_needsUpdate"))
  {
    -[ISPlayerView _updatePlayerViewIfNeeded](self, "_updatePlayerViewIfNeeded");
    -[ISPlayerView _updatePlayerItemLoadingTargetIfNeeded](self, "_updatePlayerItemLoadingTargetIfNeeded");
    -[ISPlayerView _updatePlayerPlayerItemIfNeeded](self, "_updatePlayerPlayerItemIfNeeded");
    -[ISPlayerView _updatePlayerMutedIfNeeded](self, "_updatePlayerMutedIfNeeded");
    -[ISPlayerView _updateStatusIfNeeded](self, "_updateStatusIfNeeded");
    -[ISPlayerView _updatePlaybackStateIfNeeded](self, "_updatePlaybackStateIfNeeded");
    -[ISPlayerView _updateReadyForDisplayIfNeeded](self, "_updateReadyForDisplayIfNeeded");
  }
}

- (void)_updatePlayerViewIfNeeded
{
  id v3;

  if (!self->_isValid.playerView)
  {
    self->_isValid.playerView = 1;
    -[ISPlayerView playbackStyle](self, "playbackStyle");
    v3 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v3, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "setContentMode:", -[ISPlayerView contentMode](self, "contentMode"));
    -[ISPlayerView _setPlayerView:](self, "_setPlayerView:", v3);

  }
}

- (void)_updatePlayerItemLoadingTargetIfNeeded
{
  uint64_t v3;
  id v4;

  if (!self->_isValid.playerItemLoadingTarget)
  {
    self->_isValid.playerItemLoadingTarget = 1;
    -[ISPlayerView _playerItem](self, "_playerItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[ISPlayerView playbackStyle](self, "playbackStyle") == 1)
      v3 = 1;
    else
      v3 = 2;
    objc_msgSend(v4, "setLoadingTarget:", v3);
    objc_msgSend(v4, "discardContentBelowLoadingTarget");

  }
}

- (void)_updatePlayerPlayerItemIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_isValid.playerPlayerItem)
  {
    self->_isValid.playerPlayerItem = 1;
    -[ISPlayerView _playerItem](self, "_playerItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ISPlayerView _playerView](self, "_playerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayerItem:", v5);

  }
}

- (void)_updatePlayerMutedIfNeeded
{
  void *v3;
  id v4;

  if (!self->_isValid.playerMuted)
  {
    self->_isValid.playerMuted = 1;
    -[ISPlayerView _playerView](self, "_playerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAudioEnabled:", -[ISPlayerView audioMuted](self, "audioMuted") ^ 1);

  }
}

- (void)_updateStatusIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (!self->_isValid.status)
  {
    self->_isValid.status = 1;
    -[ISPlayerView _playerView](self, "_playerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "status");
    if (v4 == 3)
      v5 = 3;
    else
      v5 = 0;
    if (v4 == 2)
      v6 = 2;
    else
      v6 = v5;
    -[ISPlayerView _setStatus:](self, "_setStatus:", v6);

  }
}

- (void)_updatePlaybackStateIfNeeded
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  if (!self->_isValid.playbackState)
  {
    self->_isValid.playbackState = 1;
    -[ISPlayerView _playerView](self, "_playerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "currentPlaybackStyle") - 1;
      if (v4 < 4)
      {
        v5 = qword_1D2DF5098[v4];
LABEL_10:
        -[ISPlayerView _setPlaybackState:](self, "_setPlaybackState:", v5);

        return;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v3, "isPlaying"))
          v5 = 4;
        else
          v5 = 0;
        goto LABEL_10;
      }
    }
    v5 = 0;
    goto LABEL_10;
  }
}

- (void)_updateReadyForDisplayIfNeeded
{
  id v3;

  if (!self->_isValid.readyForDisplay)
  {
    self->_isValid.readyForDisplay = 1;
    -[ISPlayerView _playerItem](self, "_playerItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ISPlayerView _setReadyForDisplay:](self, "_setReadyForDisplay:", objc_msgSend(v3, "status") > 1);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  char isKindOfClass;
  id v9;

  v6 = a4;
  v9 = a3;
  if ((void *)ISPlayerObservationContext == a5)
  {
    if ((v6 & 2) != 0)
      -[ISPlayerView _invalidateStatus](self, "_invalidateStatus");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((v6 & 8) == 0)
        goto LABEL_13;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((v6 & 0x10) == 0 || (isKindOfClass & 1) == 0)
        goto LABEL_13;
    }
    -[ISPlayerView _invalidatePlaybackState](self, "_invalidatePlaybackState");
    goto LABEL_13;
  }
  if ((v6 & 1) != 0 && (void *)ISPlayerItemObservationContext == a5)
    -[ISPlayerView _invalidateReadyForDisplay](self, "_invalidateReadyForDisplay");
LABEL_13:
  -[ISPlayerView _updateIfNeeded](self, "_updateIfNeeded");

}

- (id)videoPlayerForPlayer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[ISPlayerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ISPlayerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerForPlayerView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)audioMuted
{
  return self->_audioMuted;
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)isInteracting
{
  return self->_isInteracting;
}

- (int64_t)status
{
  return self->_status;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return self->_error;
}

- (ISPlayerViewDelegate)delegate
{
  return (ISPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ISBasePlayerUIView)_playerView
{
  return self->__playerView;
}

- (ISWrappedAVPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (UIGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (BOOL)readyForDisplay
{
  return self->_readyForDisplay;
}

- (void)_setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (NSMutableSet)_activeGestures
{
  return self->__activeGestures;
}

- (unint64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (CGSize)dimensionsOfReservedVideoMemory
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensionsOfReservedVideoMemory.width;
  height = self->_dimensionsOfReservedVideoMemory.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3
{
  self->_dimensionsOfReservedVideoMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeGestures, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong((id *)&self->__playerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
