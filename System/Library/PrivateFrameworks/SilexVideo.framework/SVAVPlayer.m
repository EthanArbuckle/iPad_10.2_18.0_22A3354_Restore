@implementation SVAVPlayer

- (SVAVPlayer)initWithURL:(id)a3
{
  return -[SVAVPlayer initWithURL:audioMode:](self, "initWithURL:audioMode:", a3, 1);
}

- (SVAVPlayer)initWithURL:(id)a3 audioMode:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  SVAVPlayer *v8;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:automaticallyLoadedAssetKeys:", v6, &unk_24DBC8960);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SVAVPlayer initWithPlayerItem:audioMode:](self, "initWithPlayerItem:audioMode:", v7, v4);

  return v8;
}

- (SVAVPlayer)initWithPlayerItem:(id)a3 audioMode:(int)a4
{
  uint64_t v4;
  id v6;
  char *v7;
  void *v8;
  _OWORD *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVAVPlayer;
  v7 = -[SVAVPlayer initWithPlayerItem:](&v11, sel_initWithPlayerItem_, v6);
  if (v7)
  {
    objc_msgSend(v6, "setAllowedAudioSpatializationFormats:", 7);
    +[SVAudioSession sharedSessionForMode:](SVAudioSession, "sharedSessionForMode:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInterestForPlayer:withMode:", v7, v4);

    *((_DWORD *)v7 + 4) = v4;
    v9 = (_OWORD *)MEMORY[0x24BDC0D88];
    *((_QWORD *)v7 + 17) = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    *(_OWORD *)(v7 + 120) = *v9;
    objc_msgSend(v7, "setActionAtItemEnd:", 1);
    objc_msgSend(v7, "addObservers");
    objc_msgSend(v7, "loadFrameRate");
  }

  return (SVAVPlayer *)v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SVAVPlayer stopTimeObserver](self, "stopTimeObserver");
  +[SVAudioSession sharedSessionForMode:](SVAudioSession, "sharedSessionForMode:", -[SVAVPlayer audioMode](self, "audioMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInterestForPlayer:", self);

  v4.receiver = self;
  v4.super_class = (Class)SVAVPlayer;
  -[SVAVPlayer dealloc](&v4, sel_dealloc);
}

- (void)seekToStartWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SVAVPlayer_seekToStartWithCompletionBlock___block_invoke;
  v8[3] = &unk_24DBC2698;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = *MEMORY[0x24BDC0D88];
  v7 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  -[SVAVPlayer seekToTime:completionHandler:](self, "seekToTime:completionHandler:", &v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __45__SVAVPlayer_seekToStartWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  CMTime time;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(v5, "setElapsedTime:", CMTimeGetSeconds(&time));
    objc_msgSend(v5, "setPlaybackPosition:", 0);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (double)totalTimePlayed
{
  CMTime time;

  -[SVAVPlayer cumulativeTimePlayed](self, "cumulativeTimePlayed");
  return CMTimeGetSeconds(&time);
}

- (void)loadFrameRate
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[SVAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__SVAVPlayer_loadFrameRate__block_invoke;
  v5[3] = &unk_24DBC2590;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24DBC8978, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __27__SVAVPlayer_loadFrameRate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__SVAVPlayer_loadFrameRate__block_invoke_2;
  v7[3] = &unk_24DBC26C0;
  v8 = v5;
  v9 = WeakRetained;
  v6 = v5;
  objc_msgSend(v6, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24DBC8990, v7);

}

uint64_t __27__SVAVPlayer_loadFrameRate__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  float v4;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("nominalFrameRate"), 0);
  if (result == 2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "nominalFrameRate");
    return objc_msgSend(v3, "setFrameRate:", v4);
  }
  return result;
}

- (void)startTimeObserver
{
  uint64_t *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  CMTime v11;
  id location[2];
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3810000000;
  v18 = "";
  v19 = 0;
  v20 = 0;
  v21 = 0;
  -[SVAVPlayer currentTime](self, "currentTime");
  v3 = v16;
  -[SVAVPlayer currentItem](self, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(v14, 0, sizeof(v14));
  *(_OWORD *)location = *((_OWORD *)v3 + 2);
  v13 = v3[6];
  -[SVAVPlayer updateTime:duration:](self, "updateTime:duration:", location, v14);

  objc_initWeak(location, self);
  CMTimeMake(&v11, 1, 10);
  v6 = MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC9B8];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__SVAVPlayer_startTimeObserver__block_invoke;
  v9[3] = &unk_24DBC26E8;
  objc_copyWeak(&v10, location);
  v9[4] = &v15;
  -[SVAVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](self, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v11, v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVAVPlayer setTimeObserver:](self, "setTimeObserver:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(location);
  _Block_object_dispose(&v15, 8);
}

void __31__SVAVPlayer_startTimeObserver__block_invoke(uint64_t a1, __int128 *a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime rhs;
  CMTime lhs;
  CMTime v20;
  CMTime v21;

  memset(&v21, 0, sizeof(v21));
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&v21, 0, sizeof(v21));

  if ((*((_BYTE *)a2 + 12) & 1) != 0 && (v21.flags & 1) != 0)
  {
    memset(&v20, 0, sizeof(v20));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    lhs = *(CMTime *)a2;
    rhs = *(CMTime *)(v8 + 32);
    CMTimeSubtract(&v20, &lhs, &rhs);
    v9 = objc_loadWeakRetained(v4);
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "cumulativeTimePlayed");
    else
      memset(&v16, 0, sizeof(v16));
    lhs = v20;
    CMTimeAdd(&v17, &v16, &lhs);
    v11 = objc_loadWeakRetained(v4);
    v15 = v17;
    objc_msgSend(v11, "setCumulativeTimePlayed:", &v15);

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *a2;
    *(_QWORD *)(v12 + 48) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(v12 + 32) = v13;
    v14 = objc_loadWeakRetained(v4);
    lhs = *(CMTime *)a2;
    rhs = v21;
    objc_msgSend(v14, "updateTime:duration:", &lhs, &rhs);

  }
}

- (void)updateTime:(id *)a3 duration:(id *)a4
{
  CMTimeEpoch var3;
  double Seconds;
  CMTime v7;
  CMTime v8;

  if ((a3->var2 & 0x11) == 1 && (a4->var2 & 1) != 0)
  {
    if ((a4->var2 & 0x1D) == 1)
    {
      *(_OWORD *)&v8.value = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
    }
    else
    {
      *(_OWORD *)&v8.value = *MEMORY[0x24BDC0D88];
      var3 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    }
    v8.epoch = var3;
    v7 = *(CMTime *)a3;
    Seconds = CMTimeGetSeconds(&v7);
    v7 = v8;
    -[SVAVPlayer setElapsedTime:duration:](self, "setElapsedTime:duration:", Seconds, CMTimeGetSeconds(&v7));
  }
}

- (void)stopTimeObserver
{
  void *v3;

  -[SVAVPlayer timeObserver](self, "timeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVAVPlayer removeTimeObserver:](self, "removeTimeObserver:", v3);

  -[SVAVPlayer setTimeObserver:](self, "setTimeObserver:", 0);
}

- (void)addObservers
{
  SVKeyValueObserver *v3;
  uint64_t v4;
  SVKeyValueObserver *v5;
  SVKeyValueObserver *v6;
  void *v7;
  SVKeyValueObserver *v8;
  SVKeyValueObserver *v9;
  void *v10;
  SVKeyValueObserver *v11;
  SVKeyValueObserver *v12;
  void *v13;
  SVKeyValueObserver *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  v4 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __26__SVAVPlayer_addObservers__block_invoke;
  v23[3] = &unk_24DBC23B8;
  objc_copyWeak(&v24, &location);
  v5 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v3, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("timeControlStatus"), self, 1, v23);
  -[SVAVPlayer setTimeControlStatusObserver:](self, "setTimeControlStatusObserver:", v5);

  v6 = [SVKeyValueObserver alloc];
  -[SVAVPlayer currentItem](self, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __26__SVAVPlayer_addObservers__block_invoke_2;
  v21[3] = &unk_24DBC23B8;
  objc_copyWeak(&v22, &location);
  v8 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v6, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("status"), v7, 1, v21);
  -[SVAVPlayer setStatusObserver:](self, "setStatusObserver:", v8);

  v9 = [SVKeyValueObserver alloc];
  -[SVAVPlayer currentItem](self, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __26__SVAVPlayer_addObservers__block_invoke_3;
  v19[3] = &unk_24DBC23B8;
  objc_copyWeak(&v20, &location);
  v11 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v9, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("duration"), v10, 1, v19);
  -[SVAVPlayer setDurationObserver:](self, "setDurationObserver:", v11);

  v12 = [SVKeyValueObserver alloc];
  -[SVAVPlayer currentItem](self, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __26__SVAVPlayer_addObservers__block_invoke_4;
  v17[3] = &unk_24DBC23B8;
  objc_copyWeak(&v18, &location);
  v14 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v12, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("loadedTimeRanges"), v13, 1, v17);
  -[SVAVPlayer setLoadedTimeRangesObserver:](self, "setLoadedTimeRangesObserver:", v14);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVAVPlayer currentItem](self, "currentItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_playedToEnd_, *MEMORY[0x24BDB1FA8], v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __26__SVAVPlayer_addObservers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "timeControlStatusChanged");
    WeakRetained = v2;
  }

}

void __26__SVAVPlayer_addObservers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "statusChanged");
    WeakRetained = v2;
  }

}

void __26__SVAVPlayer_addObservers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "durationChanged");
    WeakRetained = v2;
  }

}

void __26__SVAVPlayer_addObservers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadedTimeRangesChanged");

}

- (void)playedToEnd:(id)a3
{
  -[SVAVPlayer setPlaybackPosition:](self, "setPlaybackPosition:", 1);
  -[SVAVPlayer setPlaybackStatus:](self, "setPlaybackStatus:", 4);
}

- (void)setElapsedTime:(double)a3 duration:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  void (**v10)(id, SVAVPlayer *, double, double);

  if (self->_elapsedTime != a3 || self->_duration != a4)
  {
    -[SVAVPlayer setElapsedTime:](self, "setElapsedTime:", fmax(a3, 0.0));
    -[SVAVPlayer setDuration:](self, "setDuration:", fmax(a4, 0.0));
    -[SVAVPlayer playbackProgressBlock](self, "playbackProgressBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SVAVPlayer playbackProgressBlock](self, "playbackProgressBlock");
      v10 = (void (**)(id, SVAVPlayer *, double, double))objc_claimAutoreleasedReturnValue();
      -[SVAVPlayer elapsedTime](self, "elapsedTime");
      v8 = v7;
      -[SVAVPlayer duration](self, "duration");
      v10[2](v10, self, v8, v9);

    }
  }
}

- (void)setPlaybackStatus:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (self->_playbackStatus != a3)
  {
    v3 = *(_QWORD *)&a3;
    self->_playbackStatus = a3;
    -[SVAVPlayer currentItem](self, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "currentTime");
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
    -[SVAVPlayer currentItem](self, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "duration");
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
    }
    -[SVAVPlayer updateTime:duration:](self, "updateTime:duration:", &v14, &v11);

    if ((_DWORD)v3 == 2)
    {
      -[SVAVPlayer startTimeObserver](self, "startTimeObserver");
    }
    else if ((v3 - 3) <= 2)
    {
      -[SVAVPlayer stopTimeObserver](self, "stopTimeObserver");
    }
    -[SVAVPlayer playbackStatusBlock](self, "playbackStatusBlock", v11, v12, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SVAVPlayer playbackStatusBlock](self, "playbackStatusBlock");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SVAVPlayer *, uint64_t))v10)[2](v10, self, v3);

    }
  }
}

- (void)statusChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[SVAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 2)
  {
    v5 = 5;
LABEL_7:
    -[SVAVPlayer setPlaybackStatus:](self, "setPlaybackStatus:", v5);
    return;
  }
  if (v4 == 1 && !-[SVAVPlayer playbackStatus](self, "playbackStatus"))
  {
    v5 = 1;
    goto LABEL_7;
  }
}

- (void)timeControlStatusChanged
{
  if (-[SVAVPlayer timeControlStatus](self, "timeControlStatus") == 2)
  {
    if (-[SVAVPlayer playbackStatus](self, "playbackStatus") != 2)
    {
      -[SVAVPlayer setPlaybackStatus:](self, "setPlaybackStatus:", 2);
      -[SVAVPlayer setPlaybackPosition:](self, "setPlaybackPosition:", 2);
    }
  }
  else if (!-[SVAVPlayer timeControlStatus](self, "timeControlStatus"))
  {
    -[SVAVPlayer stopTimeObserver](self, "stopTimeObserver");
    if (-[SVAVPlayer playbackStatus](self, "playbackStatus") == 2
      && -[SVAVPlayer playbackPosition](self, "playbackPosition") == 2)
    {
      -[SVAVPlayer setPlaybackStatus:](self, "setPlaybackStatus:", 3);
    }
  }
}

- (void)loadedTimeRangesChanged
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, SVAVPlayer *, void *);

  -[SVAVPlayer loadingProgressBlock](self, "loadingProgressBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SVAVPlayer loadingProgressBlock](self, "loadingProgressBlock");
    v6 = (void (**)(id, SVAVPlayer *, void *))objc_claimAutoreleasedReturnValue();
    -[SVAVPlayer currentItem](self, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadedTimeRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, self, v5);

  }
}

- (void)durationChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[3];

  -[SVAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(v8, 0, sizeof(v8));
  -[SVAVPlayer currentItem](self, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(v7, 0, sizeof(v7));
  -[SVAVPlayer updateTime:duration:](self, "updateTime:duration:", v8, v7);

}

- (int)audioMode
{
  return self->_audioMode;
}

- (int)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(int)a3
{
  self->_playbackPosition = a3;
}

- (int)playbackStatus
{
  return self->_playbackStatus;
}

- (id)playbackStatusBlock
{
  return self->_playbackStatusBlock;
}

- (void)setPlaybackStatusBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)playbackProgressBlock
{
  return self->_playbackProgressBlock;
}

- (void)setPlaybackProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)loadingProgressBlock
{
  return self->_loadingProgressBlock;
}

- (void)setLoadingProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(double)a3
{
  self->_frameRate = a3;
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- (void)setTimeObserver:(id)a3
{
  objc_storeStrong(&self->_timeObserver, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cumulativeTimePlayed
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setCumulativeTimePlayed:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_cumulativeTimePlayed.value = *(_OWORD *)&a3->var0;
  self->_cumulativeTimePlayed.epoch = var3;
}

- (SVKeyValueObserver)timeControlStatusObserver
{
  return self->_timeControlStatusObserver;
}

- (void)setTimeControlStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_timeControlStatusObserver, a3);
}

- (SVKeyValueObserver)statusObserver
{
  return self->_statusObserver;
}

- (void)setStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_statusObserver, a3);
}

- (SVKeyValueObserver)durationObserver
{
  return self->_durationObserver;
}

- (void)setDurationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_durationObserver, a3);
}

- (SVKeyValueObserver)loadedTimeRangesObserver
{
  return self->_loadedTimeRangesObserver;
}

- (void)setLoadedTimeRangesObserver:(id)a3
{
  objc_storeStrong((id *)&self->_loadedTimeRangesObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedTimeRangesObserver, 0);
  objc_storeStrong((id *)&self->_durationObserver, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_timeControlStatusObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong(&self->_loadingProgressBlock, 0);
  objc_storeStrong(&self->_playbackProgressBlock, 0);
  objc_storeStrong(&self->_playbackStatusBlock, 0);
}

@end
