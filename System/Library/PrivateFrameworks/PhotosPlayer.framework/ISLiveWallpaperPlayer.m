@implementation ISLiveWallpaperPlayer

- (void)setPlayerItem:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISLiveWallpaperPlayer;
  v3 = a3;
  -[ISBasePlayer setPlayerItem:](&v4, sel_setPlayerItem_, v3);
  objc_msgSend(v3, "setReversesMoreVideoFramesInMemory:", 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setAggressivelyCacheVideoFrames:", 1);
  objc_msgSend(v3, "setDecodesAllFramesDuringOrdinaryPlayback:", 1);

}

- (void)setTouching:(BOOL)a3
{
  if (self->_touching != a3)
  {
    self->_touching = a3;
    -[ISObservable signalChange:](self, "signalChange:", 4);
  }
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    -[ISObservable signalChange:](self, "signalChange:", 8);
  }
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLiveWallpaperPlayer;
  -[ISBasePlayer didPerformChanges](&v3, sel_didPerformChanges);
  -[ISLiveWallpaperPlayer _update](self, "_update");
}

- (void)statusDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ISLiveWallpaperPlayer;
  -[ISBasePlayer statusDidChange](&v2, sel_statusDidChange);
}

- (void)_update
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int flags;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  int64_t v14;

  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[ISBasePlayer status](self, "status");

    if (v5 >= 1)
    {
      flags = self->_videoDuration.flags;
      if ((flags & 0x1D) != 1)
      {
        v13 = 0uLL;
        v14 = 0;
        -[ISBasePlayer videoPlayer](self, "videoPlayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "duration");
        }
        else
        {
          v13 = 0uLL;
          v14 = 0;
        }

        *(_OWORD *)&self->_videoDuration.value = v13;
        self->_videoDuration.epoch = v14;
        flags = self->_videoDuration.flags;
      }
      if ((flags & 0x1D) == 1)
      {
        v13 = 0uLL;
        v14 = 0;
        -[ISBasePlayer videoPlayer](self, "videoPlayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "currentTime");
        }
        else
        {
          v13 = 0uLL;
          v14 = 0;
        }

      }
    }
  }
}

- (void)_setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  ISPlayerState *v6;
  ISDisplayLink *v7;
  ISDisplayLink *v8;
  void *v9;
  ISPlayerState *v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (self->__active != a3)
  {
    v3 = a3;
    self->__active = a3;
    -[ISObservable signalChange:](self, "signalChange:", 16);
    -[ISLiveWallpaperPlayer _displayLink](self, "_displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!v5)
      {
        v6 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("WALLPAPER PLAY"), 0.0, 1.0, 0.0);
        -[ISBasePlayer applyOutputInfo:fromBehavior:withTransitionOptions:completion:](self, "applyOutputInfo:fromBehavior:withTransitionOptions:completion:", v6, 0, 0, 0);
        objc_initWeak(&location, self);
        v7 = [ISDisplayLink alloc];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __36__ISLiveWallpaperPlayer__setActive___block_invoke;
        v11[3] = &unk_1E9453CF8;
        objc_copyWeak(&v12, &location);
        v8 = -[ISDisplayLink initWithUpdateHandler:completionHandler:](v7, "initWithUpdateHandler:completionHandler:", v11, 0);
        -[ISLiveWallpaperPlayer _setDisplayLink:](self, "_setDisplayLink:", v8);
        -[ISDisplayLink start](v8, "start");

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);

      }
    }
    else if (v5)
    {
      v10 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("WALLPAPER STOP"), 0.0, 0.0, 0.0);
      -[ISBasePlayer applyOutputInfo:fromBehavior:withTransitionOptions:completion:](self, "applyOutputInfo:fromBehavior:withTransitionOptions:completion:", v10, 0, 0, 0);
      -[ISLiveWallpaperPlayer _displayLink](self, "_displayLink");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stop");

      -[ISLiveWallpaperPlayer _setDisplayLink:](self, "_setDisplayLink:", 0);
      self->_smoothedVelocity = 0.0;

    }
  }
}

- (void)_setPlayRate:(float)a3
{
  if (self->__playRate != a3)
  {
    self->__playRate = a3;
    -[ISLiveWallpaperPlayer _updatePlayer](self, "_updatePlayer");
  }
}

- (void)_updatePlayer
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  int32_t v8;
  BOOL v10;
  BOOL v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  char v16;
  double v17;
  $95D729B680665BEAEFA1D6FCA8238556 v18;
  CMTime time1;
  CMTime v20;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration;

  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLiveWallpaperPlayer _playRate](self, "_playRate");
  v5 = v4;
  videoDuration = self->_videoDuration;
  memset(&v20, 0, sizeof(v20));
  if (v3)
    objc_msgSend(v3, "currentTime");
  objc_msgSend(v3, "rate");
  v7 = v6;
  time1 = v20;
  v18 = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v8 = CMTimeCompare(&time1, (CMTime *)&v18);
  v10 = v5 < 0.0 && v8 < 1;
  time1 = v20;
  v18 = videoDuration;
  v11 = 0;
  if ((CMTimeCompare(&time1, (CMTime *)&v18) & 0x80000000) == 0 && v5 > 0.0)
    v11 = (v20.flags & 0x1D) == 1;
  v12 = vabds_f32(v7, v5);
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceScrubMinRateChange");
  v15 = v14;

  v16 = v15 >= v12 || v10;
  if ((v16 & 1) == 0 && !v11)
  {
    time1 = v20;
    if (CMTimeGetSeconds(&time1) >= 0.0)
    {
      time1 = v20;
      v18 = videoDuration;
      if (CMTimeCompare(&time1, (CMTime *)&v18) < 1)
      {
        *(float *)&v17 = v5;
        objc_msgSend(v3, "setRate:", v17);
      }
      else
      {
        -[ISLiveWallpaperPlayer _seekVideoToEnd](self, "_seekVideoToEnd");
      }
    }
    else
    {
      -[ISLiveWallpaperPlayer _seekVideoToBeginning](self, "_seekVideoToBeginning");
    }
  }

}

- (void)_seekVideoToBeginning
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!-[ISLiveWallpaperPlayer _isSeeking](self, "_isSeeking"))
  {
    -[ISLiveWallpaperPlayer _setSeeking:](self, "_setSeeking:", 1);
    objc_initWeak(&location, self);
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke;
    v10[3] = &unk_1E9453830;
    objc_copyWeak(&v11, &location);
    v8 = *MEMORY[0x1E0CA2E68];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v6 = v8;
    v7 = v9;
    v4 = v8;
    v5 = v9;
    objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_seekVideoToEnd
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  int64_t epoch;
  _QWORD v10[4];
  id v11;
  id location;

  if (!-[ISLiveWallpaperPlayer _isSeeking](self, "_isSeeking"))
  {
    -[ISLiveWallpaperPlayer _setSeeking:](self, "_setSeeking:", 1);
    objc_initWeak(&location, self);
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke;
    v10[3] = &unk_1E9453830;
    objc_copyWeak(&v11, &location);
    v8 = *(_OWORD *)&self->_videoDuration.value;
    epoch = self->_videoDuration.epoch;
    v6 = *MEMORY[0x1E0CA2E68];
    v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v4 = v6;
    v5 = v7;
    objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_handleDidFinishSeeking:(BOOL)a3
{
  -[ISLiveWallpaperPlayer _setSeeking:](self, "_setSeeking:", 0);
  -[ISLiveWallpaperPlayer _updatePlayer](self, "_updatePlayer");
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (double)force
{
  return self->_force;
}

- (BOOL)_active
{
  return self->__active;
}

- (ISDisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)_setDisplayLink:(id)a3
{
  self->__displayLink = (ISDisplayLink *)a3;
}

- (BOOL)_isSeeking
{
  return self->__seeking;
}

- (void)_setSeeking:(BOOL)a3
{
  self->__seeking = a3;
}

- (float)_playRate
{
  return self->__playRate;
}

void __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke_2;
  v3[3] = &unk_1E9453808;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  is_dispatch_on_main_queue(v3);
  objc_destroyWeak(&v4);
}

void __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishSeeking:", *(unsigned __int8 *)(a1 + 40));

}

void __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke_2;
  v3[3] = &unk_1E9453808;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  is_dispatch_on_main_queue(v3);
  objc_destroyWeak(&v4);
}

void __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishSeeking:", *(unsigned __int8 *)(a1 + 40));

}

void __36__ISLiveWallpaperPlayer__setActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

uint64_t __32__ISLiveWallpaperPlayer__update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setActive:", 1);
}

uint64_t __32__ISLiveWallpaperPlayer__update__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setActive:", 0);
}

@end
