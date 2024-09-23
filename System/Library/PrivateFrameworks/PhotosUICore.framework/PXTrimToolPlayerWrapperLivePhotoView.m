@implementation PXTrimToolPlayerWrapperLivePhotoView

- (PXTrimToolPlayerWrapperLivePhotoView)initWithLivePhotoView:(id)a3
{
  id v5;
  PXTrimToolPlayerWrapperLivePhotoView *v6;
  PXTrimToolPlayerWrapperLivePhotoView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTrimToolPlayerWrapperLivePhotoView;
  v6 = -[PXTrimToolPlayerWrapperLivePhotoView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_livePhotoView, a3);

  return v7;
}

- (void)_loadWrappedAVPlayerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXTrimToolPlayerWrapperLivePhotoView livePhotoView](self, "livePhotoView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "registerChangeObserver:context:", self, livePhotoPlayerObservationContext);
    objc_msgSend(v6, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTrimToolPlayerWrapperLivePhotoView setWrappedAVPlayer:](self, "setWrappedAVPlayer:", v5);

  }
}

- (void)setWrappedAVPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = (ISWrappedAVPlayer *)a3;
  if (self->_wrappedAVPlayer != v5)
  {
    v9 = 0uLL;
    v10 = 0;
    -[PXTrimToolPlayerWrapperLivePhotoView periodicTimeObservationInterval](self, "periodicTimeObservationInterval");
    -[PXTrimToolPlayerWrapperLivePhotoView stopPeriodicTimeObserver](self, "stopPeriodicTimeObserver");
    -[ISWrappedAVPlayer unregisterChangeObserver:context:](self->_wrappedAVPlayer, "unregisterChangeObserver:context:", self, avPlayerObservationContext_269340);
    objc_storeStrong((id *)&self->_wrappedAVPlayer, a3);
    -[PXTrimToolPlayerWrapperLivePhotoView _videoPlayerViewIfLoaded](self, "_videoPlayerViewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoPlayer:", v5);

    -[ISWrappedAVPlayer registerChangeObserver:context:](v5, "registerChangeObserver:context:", self, avPlayerObservationContext_269340);
    if ((unsigned __int128)0 >> 96)
    {
      v7 = v9;
      v8 = v10;
      -[PXTrimToolPlayerWrapperLivePhotoView setPeriodicTimeObservationInterval:](self, "setPeriodicTimeObservationInterval:", &v7);
      -[PXTrimToolPlayerWrapperLivePhotoView _addPeriodicTimeObserver](self, "_addPeriodicTimeObserver");
    }
  }

}

- (id)_videoPlayerViewIfLoaded
{
  return self->_videoPlayerView;
}

- (id)videoPlayerView
{
  ISVideoPlayerUIView *videoPlayerView;
  ISVideoPlayerUIView *v4;
  ISVideoPlayerUIView *v5;
  void *v6;

  videoPlayerView = self->_videoPlayerView;
  if (!videoPlayerView)
  {
    v4 = (ISVideoPlayerUIView *)objc_alloc_init(MEMORY[0x1E0D78280]);
    v5 = self->_videoPlayerView;
    self->_videoPlayerView = v4;

    -[PXTrimToolPlayerWrapperLivePhotoView _loadWrappedAVPlayerIfNecessary](self, "_loadWrappedAVPlayerIfNecessary");
    -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISVideoPlayerUIView setVideoPlayer:](self->_videoPlayerView, "setVideoPlayer:", v6);

    videoPlayerView = self->_videoPlayerView;
  }
  return videoPlayerView;
}

- (void)_createLoupePlayerView
{
  UIView *v3;
  UIView *loupePlayerView;

  -[PXTrimToolPlayerWrapperLivePhotoView videoPlayerView](self, "videoPlayerView");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  loupePlayerView = self->_loupePlayerView;
  self->_loupePlayerView = v3;

}

- (void)_addPeriodicTimeObserver
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _BYTE v7[24];
  id location;

  objc_initWeak(&location, self);
  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTrimToolPlayerWrapperLivePhotoView periodicTimeObservationInterval](self, "periodicTimeObservationInterval");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PXTrimToolPlayerWrapperLivePhotoView__addPeriodicTimeObserver__block_invoke;
  v5[3] = &unk_1E5143B80;
  objc_copyWeak(&v6, &location);
  v4 = (id)objc_msgSend(v3, "addPeriodicTimeObserverForInterval:queue:usingBlock:", v7, 0, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_timeObserverTimeChanged:(id *)a3
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  if (self->_delegateFlags.respondsToTimeChanged)
  {
    -[PXTrimToolPlayerWrapperLivePhotoView playerObserver](self, "playerObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *a3;
    objc_msgSend(v5, "playerWrapper:timeChanged:", self, &v6);

  }
}

- (void)setPlayerObserver:(id)a3
{
  PXTrimToolPlayerObserver **p_playerObserver;
  id v5;

  p_playerObserver = &self->_playerObserver;
  v5 = a3;
  objc_storeWeak((id *)p_playerObserver, v5);
  self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_playerObserver) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTimeChanged = p_playerObserver & 1;
  -[PXTrimToolPlayerWrapperLivePhotoView stopPeriodicTimeObserver](self, "stopPeriodicTimeObserver");
}

- (UIView)loupePlayerView
{
  UIView *loupePlayerView;

  loupePlayerView = self->_loupePlayerView;
  if (!loupePlayerView)
  {
    -[PXTrimToolPlayerWrapperLivePhotoView _createLoupePlayerView](self, "_createLoupePlayerView");
    loupePlayerView = self->_loupePlayerView;
  }
  return loupePlayerView;
}

- (void)requestAssetWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, void *, void *))a3;
  -[PXTrimToolPlayerWrapperLivePhotoView _loadWrappedAVPlayerIfNecessary](self, "_loadWrappedAVPlayerIfNecessary");
  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, v7);

}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[PXTrimToolPlayerWrapperLivePhotoView seekToTime:untrimmed:exact:](self, "seekToTime:untrimmed:exact:", &v3, 1, 1);
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[PXTrimToolPlayerWrapperLivePhotoView seekToTime:untrimmed:exact:forceSeek:](self, "seekToTime:untrimmed:exact:forceSeek:", &v5, a4, a5, 0);
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6
{
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PXTrimToolPlayerWrapperLivePhotoView livePhotoView](self, "livePhotoView", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v7, "setSeekTime:", &v8);

}

- (void)finishSeeking
{
  __int128 v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0CA2E18];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXTrimToolPlayerWrapperLivePhotoView seekToTime:](self, "seekToTime:", &v2);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)trimRange
{
  void *v4;
  void *v5;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  id v7;

  -[PXTrimToolPlayerWrapperLivePhotoView livePhotoView](self, "livePhotoView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "trimTimeRange");
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (void)applyTrimTimeRange:(id *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  -[PXTrimToolPlayerWrapperLivePhotoView livePhotoView](self, "livePhotoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var0.var3;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v4, "setTrimmedTimeRange:", v6);

}

- (BOOL)isReadyToPlay
{
  void *v2;
  BOOL v3;

  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status") == 1;

  return v3;
}

- (BOOL)isPlaying
{
  void *v2;
  float v3;
  float v4;

  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4 > 0.0;
}

- (void)play
{
  void *v3;
  double v4;
  void *v5;
  _QWORD v6[3];

  -[PXTrimToolPlayerWrapperLivePhotoView _loadWrappedAVPlayerIfNecessary](self, "_loadWrappedAVPlayerIfNecessary");
  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    objc_msgSend(v3, "itemForwardPlaybackEndTime");
  else
    memset(v6, 0, sizeof(v6));
  LODWORD(v4) = 1.0;
  objc_msgSend(v5, "playToTime:withInitialRate:overDuration:progressHandler:", v6, 0, v4, 0.0);

}

- (void)pause
{
  id v2;

  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)stepByCount:(int64_t)a3 playheadTime:(id *)a4
{
  void *v6;
  CMTime v7;
  CMTime rhs;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMTimeMakeWithSeconds(&rhs, (double)a3 * 0.016, 600);
  v7 = *(CMTime *)a4;
  CMTimeAdd(&v9, &v7, &rhs);
  -[PXTrimToolPlayerWrapperLivePhotoView livePhotoView](self, "livePhotoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v6, "setSeekTime:", &v7);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
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

- (void)startPeriodicTimeObserver
{
  void *v3;
  CMTime v4;
  CMTime v5;

  -[PXTrimToolPlayerWrapperLivePhotoView periodicTimeObserver](self, "periodicTimeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXTrimToolPlayerWrapperLivePhotoView stopPeriodicTimeObserver](self, "stopPeriodicTimeObserver");
  CMTimeMake(&v5, 1, 30);
  v4 = v5;
  -[PXTrimToolPlayerWrapperLivePhotoView setPeriodicTimeObservationInterval:](self, "setPeriodicTimeObservationInterval:", &v4);
  -[PXTrimToolPlayerWrapperLivePhotoView _addPeriodicTimeObserver](self, "_addPeriodicTimeObserver");
}

- (void)stopPeriodicTimeObserver
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  -[PXTrimToolPlayerWrapperLivePhotoView periodicTimeObserver](self, "periodicTimeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXTrimToolPlayerWrapperLivePhotoView wrappedAVPlayer](self, "wrappedAVPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTrimToolPlayerWrapperLivePhotoView periodicTimeObserver](self, "periodicTimeObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTimeObserver:", v5);

    -[PXTrimToolPlayerWrapperLivePhotoView setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", 0);
  }
  v6 = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXTrimToolPlayerWrapperLivePhotoView setPeriodicTimeObservationInterval:](self, "setPeriodicTimeObservationInterval:", &v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if ((void *)livePhotoPlayerObservationContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      v12 = v8;
      px_dispatch_on_main_queue();

    }
  }
  else if ((void *)avPlayerObservationContext_269340 == a5)
  {
    if ((v6 & 0x1000) != 0)
    {
      -[PXTrimToolPlayerWrapperLivePhotoView playerObserver](self, "playerObserver");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "compositionDidUpdateForPlayerWrapper:", self);

    }
    if ((v6 & 1) != 0 && self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper)
    {
      -[PXTrimToolPlayerWrapperLivePhotoView playerObserver](self, "playerObserver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playerStatusChangedForPlayerWrapper:", self);

    }
  }

}

- (PXTrimToolPlayerObserver)playerObserver
{
  return (PXTrimToolPlayerObserver *)objc_loadWeakRetained((id *)&self->_playerObserver);
}

- (ISVideoPlayerUIView)_videoPlayerView
{
  return self->_videoPlayerView;
}

- (void)set_videoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerView, a3);
}

- (ISWrappedAVPlayer)wrappedAVPlayer
{
  return self->_wrappedAVPlayer;
}

- (PXLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (BOOL)needsPlayerUpdate
{
  return self->_needsPlayerUpdate;
}

- (void)setNeedsPlayerUpdate:(BOOL)a3
{
  self->_needsPlayerUpdate = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)periodicTimeObservationInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setPeriodicTimeObservationInterval:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_periodicTimeObservationInterval.epoch = a3->var3;
  *(_OWORD *)&self->_periodicTimeObservationInterval.value = v3;
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_wrappedAVPlayer, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_loupePlayerView, 0);
  objc_destroyWeak((id *)&self->_playerObserver);
}

void __69__PXTrimToolPlayerWrapperLivePhotoView_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setWrappedAVPlayer:", v3);
  objc_msgSend(*(id *)(a1 + 40), "playerObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionDidUpdateForPlayerWrapper:", *(_QWORD *)(a1 + 40));

}

void __64__PXTrimToolPlayerWrapperLivePhotoView__addPeriodicTimeObserver__block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_timeObserverTimeChanged:", &v4);

}

@end
