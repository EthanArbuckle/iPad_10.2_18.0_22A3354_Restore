@implementation ISLivePhotoPlaybackBehavior

- (ISLivePhotoPlaybackBehavior)initWithInitialLayoutInfo:(id)a3 keyTime:(id *)a4 playbackTimeRange:(id *)a5 photoTransitionDuration:(double)a6 immediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a7 hasBlurryTransition:(BOOL)a8
{
  ISLivePhotoPlaybackBehavior *result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ISLivePhotoPlaybackBehavior;
  result = -[ISBehavior initWithInitialLayoutInfo:](&v17, sel_initWithInitialLayoutInfo_, a3);
  if (result)
  {
    result->_immediatelyShowsPhotoWhenPlaybackEnds = a7;
    v14 = *(_OWORD *)&a4->var0;
    result->_keyTime.epoch = a4->var3;
    *(_OWORD *)&result->_keyTime.value = v14;
    result->_photoTransitionDuration = a6;
    v15 = *(_OWORD *)&a5->var1.var1;
    v16 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&result->_playbackTimeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&result->_playbackTimeRange.duration.timescale = v15;
    *(_OWORD *)&result->_playbackTimeRange.start.value = v16;
    result->_hasBlurryTransition = a8;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  ISLivePhotoPlaybackBehavior *v3;
  id v4;
  $B2E2EBE68B051B9742268DC7EF34BE7B *p_delegateFlags;
  objc_super v6;

  v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoPlaybackBehavior;
  v4 = a3;
  -[ISBehavior setDelegate:](&v6, sel_setDelegate_, v4);
  p_delegateFlags = &v3->_delegateFlags;
  v3->_delegateFlags.respondsToDidFinish = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_delegateFlags->respondsToDidBeginPlaying = v3 & 1;
}

- (int64_t)behaviorType
{
  return 2;
}

- (void)videoWillPlayToEnd
{
  double v3;
  ISPlayerState *v4;
  ISPlayerOutputTransitionOptions *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[ISLivePhotoPlaybackBehavior immediatelyShowsPhotoWhenPlaybackEnds](self, "immediatelyShowsPhotoWhenPlaybackEnds"))
  {
    LODWORD(v3) = 0;
    -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v3);
    v4 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("END HINT"), 0.0, 0.0, 0.0);
    v5 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    -[ISPlayerOutputTransitionOptions setTransitionDuration:](v5, "setTransitionDuration:", 0.5);
    self->_isTransitioningToPhoto = 1;
    -[ISBehavior delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "livePhotoPlaybackBehaviorWillTransitionToPhoto:", self);

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__ISLivePhotoPlaybackBehavior_videoWillPlayToEnd__block_invoke;
    v7[3] = &unk_1E9453830;
    objc_copyWeak(&v8, &location);
    -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v4, v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (void)_handleDidFinish
{
  id v3;

  self->_isTransitioningToPhoto = 0;
  if (self->_delegateFlags.respondsToDidFinish)
  {
    -[ISBehavior delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "livePhotoPlaybackBehaviorDidFinish:", self);

  }
}

- (void)videoDidPlayToEnd
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoPlaybackBehavior;
  -[ISBehavior videoDidPlayToEnd](&v4, sel_videoDidPlayToEnd);
  LODWORD(v3) = 0;
  -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v3);
}

- (void)activeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlaybackBehavior;
  -[ISBehavior activeDidChange](&v3, sel_activeDidChange);
  if (-[ISBehavior isActive](self, "isActive"))
  {
    -[ISLivePhotoPlaybackBehavior _prepareVideoForPlaybackIfNeeded](self, "_prepareVideoForPlaybackIfNeeded");
  }
  else
  {
    -[ISLivePhotoPlaybackBehavior _setPreparing:](self, "_setPreparing:", 0);
    -[ISLivePhotoPlaybackBehavior _setVideoReadyToPlay:](self, "_setVideoReadyToPlay:", 0);
  }
}

- (void)startPlayback
{
  int64_t v3;

  v3 = -[ISLivePhotoPlaybackBehavior _currentPlaybackID](self, "_currentPlaybackID") + 1;
  -[ISLivePhotoPlaybackBehavior _setCurrentPlaybackID:](self, "_setCurrentPlaybackID:", v3);
  if (-[ISLivePhotoPlaybackBehavior _isVideoReadyToPlay](self, "_isVideoReadyToPlay"))
  {
    -[ISLivePhotoPlaybackBehavior _startPlaybackWithPlaybackID:](self, "_startPlaybackWithPlaybackID:", v3);
  }
  else
  {
    -[ISLivePhotoPlaybackBehavior _setReadyToPlayPlaybackID:](self, "_setReadyToPlayPlaybackID:", v3);
    -[ISLivePhotoPlaybackBehavior _prepareVideoForPlaybackIfNeeded](self, "_prepareVideoForPlaybackIfNeeded");
  }
}

- (void)_prepareVideoForPlaybackIfNeeded
{
  void *v3;
  uint64_t v4;
  $95D729B680665BEAEFA1D6FCA8238556 *p_keyTime;
  __int128 v6;
  CMTimeEpoch epoch;
  _QWORD v8[4];
  id v9;
  id location;
  CMTimeRange range;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (!-[ISLivePhotoPlaybackBehavior _isPreparing](self, "_isPreparing")
    && !-[ISLivePhotoPlaybackBehavior _isVideoReadyToPlay](self, "_isVideoReadyToPlay"))
  {
    -[ISLivePhotoPlaybackBehavior _setPreparing:](self, "_setPreparing:", 1);
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[ISLivePhotoPlaybackBehavior playbackTimeRange](self, "playbackTimeRange");
    v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    range.start = v12;
    -[ISBehavior setVideoForwardPlaybackEndTime:](self, "setVideoForwardPlaybackEndTime:", &range);
    objc_initWeak(&location, self);
    *(_OWORD *)&range.start.value = *MEMORY[0x1E0CA2E68];
    range.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "startBehavior");

    if (v4 == 1)
    {
      p_keyTime = &self->_keyTime;
    }
    else
    {
      if ((BYTE12(v13) & 1) == 0
        || (BYTE4(v15) & 1) == 0
        || *((_QWORD *)&v15 + 1)
        || (*((_QWORD *)&v14 + 1) & 0x8000000000000000) != 0)
      {
        goto LABEL_11;
      }
      p_keyTime = ($95D729B680665BEAEFA1D6FCA8238556 *)&v13;
    }
    *(_OWORD *)&range.start.value = *(_OWORD *)&p_keyTime->value;
    range.start.epoch = p_keyTime->epoch;
LABEL_11:
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke;
    v8[3] = &unk_1E9453830;
    objc_copyWeak(&v9, &location);
    v6 = *(_OWORD *)&range.start.value;
    epoch = range.start.epoch;
    -[ISBehavior seekVideoPlayerToTime:completionHandler:](self, "seekVideoPlayerToTime:completionHandler:", &v6, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_handleDidSeekToBeginning
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke;
  v3[3] = &unk_1E9453BF8;
  objc_copyWeak(&v4, &location);
  -[ISLivePhotoPlaybackBehavior _prerollWithCompletionHandler:](self, "_prerollWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_prerollWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  double v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prerollBeforePlaying");

  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__ISLivePhotoPlaybackBehavior__prerollWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E9453608;
    v9 = v4;
    LODWORD(v7) = 1.0;
    -[ISBehavior prerollVideoAtRate:completionHandler:](self, "prerollVideoAtRate:completionHandler:", v8, v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (void)_didFinishPreparing
{
  -[ISLivePhotoPlaybackBehavior _setPreparing:](self, "_setPreparing:", 0);
  -[ISLivePhotoPlaybackBehavior _setVideoReadyToPlay:](self, "_setVideoReadyToPlay:", 1);
  -[ISLivePhotoPlaybackBehavior _startPlaybackWithPlaybackID:](self, "_startPlaybackWithPlaybackID:", -[ISLivePhotoPlaybackBehavior _readyToPlayPlaybackID](self, "_readyToPlayPlaybackID"));
}

- (void)_startPlaybackWithPlaybackID:(int64_t)a3
{
  if (-[ISLivePhotoPlaybackBehavior _currentPlaybackID](self, "_currentPlaybackID") == a3)
  {
    -[ISLivePhotoPlaybackBehavior _setVideoReadyToPlay:](self, "_setVideoReadyToPlay:", 0);
    -[ISLivePhotoPlaybackBehavior _transitionToVideoWithPlaybackID:](self, "_transitionToVideoWithPlaybackID:", a3);
  }
}

- (void)_transitionToVideoWithPlaybackID:(int64_t)a3
{
  double v5;
  _QWORD v6[6];

  if (-[ISLivePhotoPlaybackBehavior _currentPlaybackID](self, "_currentPlaybackID") == a3)
  {
    LODWORD(v5) = 1.0;
    -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__ISLivePhotoPlaybackBehavior__transitionToVideoWithPlaybackID___block_invoke;
    v6[3] = &unk_1E94541A8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

- (void)_showVideoWithPlaybackID:(int64_t)a3
{
  double v4;
  ISPlayerOutputTransitionOptions *v5;
  id v6;

  if (-[ISLivePhotoPlaybackBehavior _currentPlaybackID](self, "_currentPlaybackID") == a3)
  {
    v4 = 3.5;
    if (!self->_hasBlurryTransition)
      v4 = 0.0;
    +[ISPlayerState outputInfoWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:](ISPlayerState, "outputInfoWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("SHOW VIDEO PLAYBACK"), v4, 1.0, 0.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    -[ISPlayerOutputTransitionOptions setTransitionDuration:](v5, "setTransitionDuration:", 0.3);
    -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v6, v5, 0);

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)playbackTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (double)photoTransitionDuration
{
  return self->_photoTransitionDuration;
}

- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds
{
  return self->_immediatelyShowsPhotoWhenPlaybackEnds;
}

- (BOOL)hasBlurryTransition
{
  return self->_hasBlurryTransition;
}

- (BOOL)isTransitioningToPhoto
{
  return self->_isTransitioningToPhoto;
}

- (int64_t)_currentPlaybackID
{
  return self->__currentPlaybackID;
}

- (void)_setCurrentPlaybackID:(int64_t)a3
{
  self->__currentPlaybackID = a3;
}

- (int64_t)_readyToPlayPlaybackID
{
  return self->__readyToPlayPlaybackID;
}

- (void)_setReadyToPlayPlaybackID:(int64_t)a3
{
  self->__readyToPlayPlaybackID = a3;
}

- (BOOL)_isVideoReadyToPlay
{
  return self->__videoReadyToPlay;
}

- (void)_setVideoReadyToPlay:(BOOL)a3
{
  self->__videoReadyToPlay = a3;
}

- (BOOL)_isPreparing
{
  return self->__preparing;
}

- (void)_setPreparing:(BOOL)a3
{
  self->__preparing = a3;
}

uint64_t __64__ISLivePhotoPlaybackBehavior__transitionToVideoWithPlaybackID___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[33])
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "livePhotoPlaybackBehaviorDidBeginPlaying:", *(_QWORD *)(a1 + 32));

    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "_showVideoWithPlaybackID:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__ISLivePhotoPlaybackBehavior__prerollWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke_2;
  block[3] = &unk_1E9453BF8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishPreroll");

}

void __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke_2;
  block[3] = &unk_1E9453BF8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidSeekToBeginning");

}

void __49__ISLivePhotoPlaybackBehavior_videoWillPlayToEnd__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinish");

}

@end
