@implementation ISLivePhotoVitalityBehavior

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ISBehavior delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior:removeTimeObserver:", self, self->_easeOutObserver);

  -[ISBehavior delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior:removeTimeObserver:", self, self->_transitionToPhotoObserver);

  v5.receiver = self;
  v5.super_class = (Class)ISLivePhotoVitalityBehavior;
  -[ISLivePhotoVitalityBehavior dealloc](&v5, sel_dealloc);
}

- (ISLivePhotoVitalityBehavior)initWithInitialLayoutInfo:(id)a3 playbackEndTime:(id *)a4 playDuration:(id *)a5 playRate:(float)a6 photoTransitionDuration:(double)a7 pauseDuringTransition:(BOOL)a8 assetOptions:(unint64_t)a9
{
  ISLivePhotoVitalityBehavior *result;
  int64_t var3;
  int64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ISLivePhotoVitalityBehavior;
  result = -[ISBehavior initWithInitialLayoutInfo:](&v18, sel_initWithInitialLayoutInfo_, a3);
  if (result)
  {
    var3 = a4->var3;
    *(_OWORD *)&result->_playbackEndTime.value = *(_OWORD *)&a4->var0;
    result->_playbackEndTime.epoch = var3;
    v17 = a5->var3;
    *(_OWORD *)&result->_playDuration.value = *(_OWORD *)&a5->var0;
    result->_playDuration.epoch = v17;
    result->_playRate = a6;
    result->_photoTransitionDuration = a7;
    result->_pauseDuringTransition = a8;
    result->_assetOptions = a9;
  }
  return result;
}

- (void)activeDidChange
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoVitalityBehavior;
  -[ISBehavior activeDidChange](&v4, sel_activeDidChange);
  -[ISLivePhotoVitalityBehavior _setPreparing:](self, "_setPreparing:", 0);
  -[ISLivePhotoVitalityBehavior _setPrepared:](self, "_setPrepared:", 0);
  if (-[ISBehavior isActive](self, "isActive"))
  {
    -[ISLivePhotoVitalityBehavior _startObservingVideo](self, "_startObservingVideo");
    LODWORD(v3) = 0;
    -[ISBehavior setVideoVolume:](self, "setVideoVolume:", v3);
  }
  else
  {
    -[ISLivePhotoVitalityBehavior _stopObservingVideo](self, "_stopObservingVideo");
  }
}

- (void)prepareForVitality
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  Float64 v7;
  CMTime v8;
  CMTime v9;
  _QWORD v10[4];
  id v11;
  id location;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime v16;
  CMTime v17[2];

  if (!-[ISLivePhotoVitalityBehavior _isPreparing](self, "_isPreparing")
    && !-[ISLivePhotoVitalityBehavior isPrepared](self, "isPrepared")
    && -[ISBehavior isActive](self, "isActive"))
  {
    -[ISLivePhotoVitalityBehavior _setPreparing:](self, "_setPreparing:", 1);
    memset(&v17[1], 0, sizeof(CMTime));
    -[ISLivePhotoVitalityBehavior playbackEndTime](self, "playbackEndTime");
    memset(v17, 0, 24);
    -[ISLivePhotoVitalityBehavior playDuration](self, "playDuration");
    memset(&v16, 0, sizeof(v16));
    lhs = v17[1];
    rhs = v17[0];
    CMTimeSubtract(&v16, &lhs, &rhs);
    rhs = v16;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeMaximum(&lhs, &rhs, &time2);
    v16 = lhs;
    objc_initWeak(&location, self);
    +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startSeekTolerance");
    v6 = v5;

    memset(&lhs, 0, sizeof(lhs));
    v7 = v6 * 0.5;
    CMTimeMakeWithSeconds(&lhs, v7, 600);
    memset(&rhs, 0, sizeof(rhs));
    CMTimeMakeWithSeconds(&rhs, v7, 600);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke;
    v10[3] = &unk_1E9453830;
    objc_copyWeak(&v11, &location);
    time2 = v16;
    v9 = lhs;
    v8 = rhs;
    if (!-[ISBehavior seekVideoPlayerToTime:toleranceBefore:toleranceAfter:completionHandler:](self, "seekVideoPlayerToTime:toleranceBefore:toleranceAfter:completionHandler:", &time2, &v9, &v8, v10))-[ISLivePhotoVitalityBehavior _setPreparing:](self, "_setPreparing:", 0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_startObservingVideo
{
  void *v3;
  Float64 v4;
  Float64 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id easeOutObserver;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id transitionToPhotoObserver;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  CMTime time2;
  CMTime time1;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime rhs;
  CMTime lhs;
  CMTime v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  memset(&v30, 0, sizeof(v30));
  -[ISLivePhotoVitalityBehavior playbackEndTime](self, "playbackEndTime");
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vitalityEaseDuration");
  CMTimeMakeWithSeconds(&rhs, v4, 600);
  CMTimeSubtract(&v30, &lhs, &rhs);

  memset(&v27, 0, sizeof(v27));
  -[ISLivePhotoVitalityBehavior playbackEndTime](self, "playbackEndTime");
  -[ISLivePhotoVitalityBehavior photoTransitionDuration](self, "photoTransitionDuration");
  CMTimeMakeWithSeconds(&v25, v5, 600);
  CMTimeSubtract(&v27, &v26, &v25);
  CMTimeMake(&time1, 1, 30);
  time2 = v27;
  CMTimeMaximum(&v24, &time1, &time2);
  v27 = v24;
  objc_initWeak((id *)&time2, self);
  -[ISBehavior delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke;
  v20[3] = &unk_1E9453BF8;
  objc_copyWeak(&v21, (id *)&time2);
  objc_msgSend(v6, "behavior:addBoundaryTimeObserverForTimes:queue:usingBlock:", self, v8, MEMORY[0x1E0C80D38], v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  easeOutObserver = self->_easeOutObserver;
  self->_easeOutObserver = v11;

  -[ISBehavior delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v27;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke_2;
  v18[3] = &unk_1E9453BF8;
  objc_copyWeak(&v19, (id *)&time2);
  objc_msgSend(v13, "behavior:addBoundaryTimeObserverForTimes:queue:usingBlock:", self, v15, MEMORY[0x1E0C80D38], v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  transitionToPhotoObserver = self->_transitionToPhotoObserver;
  self->_transitionToPhotoObserver = v16;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)&time2);
}

- (void)_stopObservingVideo
{
  void *v3;
  id v4;

  -[ISBehavior delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior:removeTimeObserver:", self, self->_easeOutObserver);

  -[ISBehavior delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior:removeTimeObserver:", self, self->_transitionToPhotoObserver);

}

- (void)_handleDidSeekToStartTime
{
  void *v3;
  int v4;
  CMTime v5;
  CMTime rhs;
  CMTime v7;
  CMTime v8;

  memset(&v8, 0, sizeof(v8));
  -[ISLivePhotoVitalityBehavior playbackEndTime](self, "playbackEndTime");
  CMTimeMake(&rhs, 2, 600);
  v5 = v8;
  CMTimeSubtract(&v7, &v5, &rhs);
  v8 = v7;
  -[ISBehavior setVideoForwardPlaybackEndTime:](self, "setVideoForwardPlaybackEndTime:", &v7);
  +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPreroll");

  if (v4)
  {
    -[ISLivePhotoVitalityBehavior playRate](self, "playRate");
    -[ISBehavior prerollVideoAtRate:completionHandler:](self, "prerollVideoAtRate:completionHandler:", &__block_literal_global_1193);
  }
  -[ISLivePhotoVitalityBehavior _handleDidFinishPreroll](self, "_handleDidFinishPreroll");
}

- (void)_handleDidFinishPreroll
{
  -[ISLivePhotoVitalityBehavior _setPreparing:](self, "_setPreparing:", 0);
  -[ISLivePhotoVitalityBehavior _setPrepared:](self, "_setPrepared:", 1);
  if (-[ISLivePhotoVitalityBehavior _shouldPlayAfterPreparation](self, "_shouldPlayAfterPreparation"))
    -[ISLivePhotoVitalityBehavior playVitality](self, "playVitality");
}

- (int64_t)behaviorType
{
  return 3;
}

- (void)playVitality
{
  BOOL v3;

  if (-[ISBehavior isActive](self, "isActive"))
  {
    if (-[ISLivePhotoVitalityBehavior isPrepared](self, "isPrepared"))
    {
      -[ISLivePhotoVitalityBehavior _startVideoPlayback](self, "_startVideoPlayback");
    }
    else
    {
      v3 = -[ISLivePhotoVitalityBehavior _isPreparing](self, "_isPreparing");
      -[ISLivePhotoVitalityBehavior _setShouldPlayAfterPreparation:](self, "_setShouldPlayAfterPreparation:", 1);
      if (!v3)
        -[ISLivePhotoVitalityBehavior prepareForVitality](self, "prepareForVitality");
    }
  }
}

- (void)videoReadyForDisplayDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoVitalityBehavior;
  -[ISBehavior videoReadyForDisplayDidChange](&v3, sel_videoReadyForDisplayDidChange);
  if (-[ISLivePhotoVitalityBehavior _shouldPlayAfterPreparation](self, "_shouldPlayAfterPreparation"))
  {
    if (!-[ISLivePhotoVitalityBehavior isPlaying](self, "isPlaying"))
      -[ISLivePhotoVitalityBehavior _startVideoPlayback](self, "_startVideoPlayback");
  }
}

- (void)_startVideoPlayback
{
  ISPlayerState *v3;
  int v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  ISPlayerOutputTransitionOptions *v9;

  -[ISLivePhotoVitalityBehavior _setPrepared:](self, "_setPrepared:", 0);
  -[ISLivePhotoVitalityBehavior _setShouldPlayAfterPreparation:](self, "_setShouldPlayAfterPreparation:", 0);
  v9 = objc_alloc_init(ISPlayerOutputTransitionOptions);
  -[ISPlayerOutputTransitionOptions setTransitionDuration:](v9, "setTransitionDuration:", 0.15);
  v3 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("Show video for vitality"), 0.0, 1.0, 0.0);
  -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v3, v9, 0);
  -[ISLivePhotoVitalityBehavior playRate](self, "playRate");
  v5 = v4;
  LODWORD(v6) = 0;
  -[ISBehavior setVideoVolume:](self, "setVideoVolume:", v6);
  LODWORD(v7) = v5;
  -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v7);
  self->_playing = 1;
  -[ISBehavior delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vitalityBehaviorDidBeginPlaying:", self);

}

- (void)_didReachTransitionTime
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  _BYTE v8[24];

  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "easingEnabled")
    && (-[ISBehavior delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "vitalityBehaviorShouldEndPlayingAtPhoto:", self),
        v4,
        v5))
  {
    -[ISBehavior delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISLivePhotoVitalityBehavior playbackEndTime](self, "playbackEndTime");
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "behavior:playVideoToTime:initialRate:overDuration:progressHandler:", self, v8, 0, v7, 0.0);

  }
  else
  {
    -[ISLivePhotoVitalityBehavior _setPlayingBeyondPhoto:](self, "_setPlayingBeyondPhoto:", 1);
  }

}

- (void)_didReachTransitionToPhotoTime
{
  void *v3;
  int v4;
  ISPlayerState *v5;
  ISPlayerOutputTransitionOptions *v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  -[ISBehavior delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vitalityBehaviorShouldEndPlayingAtPhoto:", self);

  if (v4)
  {
    v5 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("Vitality End"), 0.0, 0.0, 0.0);
    v6 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    -[ISLivePhotoVitalityBehavior photoTransitionDuration](self, "photoTransitionDuration");
    v8 = v7;
    -[ISBehavior delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoPlayRate");
    v11 = v10;

    if (v11 > 0.0)
      v8 = v8 / v11;
    +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minimumPhotoTransitionDuration");
    if (v13 < v8)
      v13 = v8;
    -[ISPlayerOutputTransitionOptions setTransitionDuration:](v6, "setTransitionDuration:", v13);
    self->_playing = 0;
    -[ISBehavior delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__ISLivePhotoVitalityBehavior__didReachTransitionToPhotoTime__block_invoke;
    v16[3] = &unk_1E94537E0;
    v15 = v14;
    v17 = v15;
    objc_copyWeak(&v18, &location);
    -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v5, v6, v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
}

- (void)cancelSettleToPhoto
{
  double v3;
  ISPlayerState *v4;

  v4 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("Continue Vitality"), 0.0, 1.0, 0.0);
  -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v4, 0, 0);
  LODWORD(v3) = 1.0;
  -[ISBehavior setVideoPlayRate:](self, "setVideoPlayRate:", v3);
  -[ISLivePhotoVitalityBehavior _setPlayingBeyondPhoto:](self, "_setPlayingBeyondPhoto:", 1);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (double)photoTransitionDuration
{
  return self->_photoTransitionDuration;
}

- (BOOL)pauseDuringTransition
{
  return self->_pauseDuringTransition;
}

- (unint64_t)assetOptions
{
  return self->_assetOptions;
}

- (float)playRate
{
  return self->_playRate;
}

- (BOOL)isPrepared
{
  return self->_prepared;
}

- (void)_setPrepared:(BOOL)a3
{
  self->_prepared = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayingBeyondPhoto
{
  return self->_playingBeyondPhoto;
}

- (void)_setPlayingBeyondPhoto:(BOOL)a3
{
  self->_playingBeyondPhoto = a3;
}

- (BOOL)_isPreparing
{
  return self->_preparing;
}

- (void)_setPreparing:(BOOL)a3
{
  self->_preparing = a3;
}

- (BOOL)_shouldPlayAfterPreparation
{
  return self->__shouldPlayAfterPreparation;
}

- (void)_setShouldPlayAfterPreparation:(BOOL)a3
{
  self->__shouldPlayAfterPreparation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionToPhotoObserver, 0);
  objc_storeStrong(&self->_easeOutObserver, 0);
}

void __61__ISLivePhotoVitalityBehavior__didReachTransitionToPhotoTime__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "vitalityBehaviorDidEndPlaying:", WeakRetained);

}

void __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReachTransitionTime");

}

void __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReachTransitionToPhotoTime");

}

void __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke_2;
    v2[3] = &unk_1E9453BF8;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    is_dispatch_on_main_queue(v2);
    objc_destroyWeak(&v3);
  }
}

void __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidSeekToStartTime");

}

@end
