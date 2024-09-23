@implementation SVPlaybackCoordinator

- (SVPlaybackCoordinator)initWithVideo:(id)a3 playerFactory:(id)a4
{
  id v7;
  id v8;
  SVPlaybackCoordinator *v9;
  SVPlaybackCoordinator *v10;
  uint64_t v11;
  NSHashTable *observers;
  SVTimeline *v13;
  SVTimeline *timeline;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVPlaybackCoordinator;
  v9 = -[SVPlaybackCoordinator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_video, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_playerFactory, a4);
    v13 = objc_alloc_init(SVTimeline);
    timeline = v10->_timeline;
    v10->_timeline = v13;

  }
  return v10;
}

- (void)playWithButtonTapped:(BOOL)a3
{
  id v4;

  -[SVPlaybackCoordinator playbackInitiatedWithButtonTapped:](self, "playbackInitiatedWithButtonTapped:", a3);
  -[SVPlaybackCoordinator loadVideoIfNeeded](self, "loadVideoIfNeeded");
  -[SVPlaybackCoordinator player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "play");

}

- (void)pause
{
  id v2;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)addPlaybackObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SVPlaybackCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePlaybackObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SVPlaybackCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)setHost:(id)a3
{
  SVVideoPlaybackHost **p_host;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_host = &self->_host;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_host, v9);
  -[SVPlaybackCoordinator player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlayer:", v6);

  -[SVPlaybackCoordinator player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredForwardBufferDuration:", 0.0);

}

- (void)seekToTime:(double)a3 withCompletionBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CMTime v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke;
  v17[3] = &unk_24DBC2478;
  v8 = v6;
  v18 = v8;
  v9 = (void *)MEMORY[0x2207327F0](v17);
  -[SVPlaybackCoordinator pause](self, "pause");
  -[SVPlaybackCoordinator duration](self, "duration");
  -[SVPlaybackCoordinator timeElapsed:duration:](self, "timeElapsed:duration:", a3, v10);
  if (a3 >= 0.0)
    v11 = a3;
  else
    v11 = -a3;
  -[SVPlaybackCoordinator player](self, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 >= 0.00000011920929)
  {
    CMTimeMake(&v16, (uint64_t)a3, 1);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke_2;
    v14[3] = &unk_24DBC24A0;
    v15 = v9;
    objc_msgSend(v13, "seekToTime:completionHandler:", &v16, v14);

    v13 = v15;
  }
  else
  {
    objc_msgSend(v12, "seekToStartWithCompletionBlock:", v9);
  }

}

uint64_t __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (double)framerate
{
  void *v2;
  double v3;
  double v4;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRate");
  v4 = v3;

  return v4;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)time
{
  void *v2;
  double v3;
  double v4;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (double)timePlayed
{
  void *v2;
  double v3;
  double v4;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalTimePlayed");
  v4 = v3;

  return v4;
}

- (NSArray)loadedTimeRanges
{
  void *v2;
  void *v3;
  void *v4;

  -[SVPlaybackCoordinator player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadedTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (double)volume
{
  void *v2;
  float v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVolume");
  v4 = v3;

  return v4;
}

- (double)loadingProgress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double Seconds;
  double v9;
  CMTimeRange v11;
  CMTime time;
  CMTimeRange v13;

  -[SVPlaybackCoordinator loadedTimeRanges](self, "loadedTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "CMTimeRangeValue");
    else
      memset(&v13, 0, sizeof(v13));

    v11 = v13;
    CMTimeRangeGetEnd(&time, &v11);
    Seconds = CMTimeGetSeconds(&time);
    -[SVPlaybackCoordinator duration](self, "duration");
    v7 = Seconds / v9;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGSize result;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SVPlaybackCoordinator player](self, "player", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "assetTrack");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "statusOfValueForKey:error:", CFSTR("naturalSize"), 0) == 2)
        {
          objc_msgSend(v11, "naturalSize");
          if (v13 != v2 || v12 != v3)
          {
            objc_msgSend(v11, "naturalSize");
            v2 = v15;
            v3 = v16;

            goto LABEL_14;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
LABEL_14:

  v17 = v2;
  v18 = v3;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)loadVideoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  -[SVPlaybackCoordinator player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SVPlaybackCoordinator cancelHandler](self, "cancelHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SVPlaybackCoordinator startedLoadingVideo](self, "startedLoadingVideo");
      objc_initWeak(&location, self);
      -[SVPlaybackCoordinator video](self, "video");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      v8 = 3221225472;
      v9 = __42__SVPlaybackCoordinator_loadVideoIfNeeded__block_invoke;
      v10 = &unk_24DBC24C8;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v5, "loadWithCompletionBlock:", &v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVPlaybackCoordinator setCancelHandler:](self, "setCancelHandler:", v6, v7, v8, v9, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

id __42__SVPlaybackCoordinator_loadVideoIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "setupPlayerWithURL:", v3);
    objc_msgSend(v5, "setCancelHandler:", 0);
    objc_msgSend(v5, "finishedLoadingVideoURL:", v3);
    objc_msgSend(v5, "setVideoURL:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "videoErrorWithErrorCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackFailedWithError:", v6);

  }
  return v5;
}

- (void)setupPlayerWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  v4 = a3;
  -[SVPlaybackCoordinator playerFactory](self, "playerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPlayerWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVPlaybackCoordinator setPlayer:](self, "setPlayer:", v6);

  -[SVPlaybackCoordinator player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMuted:", -[SVPlaybackCoordinator muted](self, "muted"));

  -[SVPlaybackCoordinator addPlayerItemPresentationSizeObserver](self, "addPlayerItemPresentationSizeObserver");
  -[SVPlaybackCoordinator addMuteStateObserver](self, "addMuteStateObserver");
  -[SVPlaybackCoordinator addPlaybackBufferObserver](self, "addPlaybackBufferObserver");
  -[SVPlaybackCoordinator addPlaybackLikelyToKeepUpObserver](self, "addPlaybackLikelyToKeepUpObserver");
  -[SVPlaybackCoordinator video](self, "video");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "conformsToProtocol:", &unk_2550CA060);

  v9 = MEMORY[0x24BDAC760];
  if ((_DWORD)v6)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x24BDBCF40];
    objc_msgSend(v10, "prerollReadyToPlayTimeout");
    v13 = v12;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke;
    v26[3] = &unk_24DBC24F0;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, v26, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVPlaybackCoordinator setReadyToPlayTimer:](self, "setReadyToPlayTimer:", v14);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  objc_initWeak(&location, self);
  -[SVPlaybackCoordinator player](self, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_2;
  v24[3] = &unk_24DBC2518;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v15, "setPlaybackStatusBlock:", v24);

  -[SVPlaybackCoordinator player](self, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_3;
  v22[3] = &unk_24DBC2540;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v16, "setPlaybackProgressBlock:", v22);

  -[SVPlaybackCoordinator player](self, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_4;
  v20[3] = &unk_24DBC2568;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v17, "setLoadingProgressBlock:", v20);

  -[SVPlaybackCoordinator host](self, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVPlaybackCoordinator player](self, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlayer:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "videoErrorWithErrorCode:", 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "playbackFailedWithError:", v1);

}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  switch(a3)
  {
    case 1:
      objc_msgSend(WeakRetained, "readyToPlayTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isValid");

      if (v8)
      {
        objc_msgSend(v6, "readyToPlayTimer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

      }
      objc_msgSend(v6, "playbackReadyToStart");
      break;
    case 2:
      if (objc_msgSend(v14, "playbackPosition"))
        objc_msgSend(v6, "playbackResumed");
      else
        objc_msgSend(v6, "playbackStarted");
      break;
    case 3:
      objc_msgSend(WeakRetained, "playbackPaused");
      break;
    case 4:
      objc_msgSend(WeakRetained, "playbackFinished");
      break;
    case 5:
      v10 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v14, "currentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoErrorWithUnderlyingError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "playbackFailedWithError:", v13);
      break;
    default:
      break;
  }

}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_3(uint64_t a1, double a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeElapsed:duration:", a2, a3);

}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadedTimeRangesChanged");

}

- (void)startedLoadingVideo
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator setState:](self, "setState:", 1);
  -[SVPlaybackCoordinator video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startedLoadingVideo");

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "playbackCoordinatorStartedLoadingVideo:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)finishedLoadingVideoURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SVPlaybackCoordinator video](self, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishedLoadingVideoWithURL:", v4);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "playbackCoordinatorFinishedLoadingVideoURL:", self);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  if (!-[SVPlaybackCoordinator initiatedPlayback](self, "initiatedPlayback"))
  {
    -[SVPlaybackCoordinator video](self, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SVPlaybackCoordinator video](self, "video");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackInitiatedWithButtonTapped:", v3);

    }
  }
  -[SVPlaybackCoordinator setPlaybackRequested:](self, "setPlaybackRequested:", 1);
  -[SVPlaybackCoordinator setInitiatedPlayback:](self, "setInitiatedPlayback:", 1);
}

- (void)playbackReadyToStart
{
  void *v3;
  char v4;
  id v5;

  -[SVPlaybackCoordinator setState:](self, "setState:", 2);
  -[SVPlaybackCoordinator video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackReadyToStart");

  }
}

- (void)playbackStarted
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator configureTimeline](self, "configureTimeline");
  -[SVPlaybackCoordinator setState:](self, "setState:", 3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorStartedPlayback:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[SVPlaybackCoordinator video](self, "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackStarted");

  }
}

- (void)playbackPaused
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator time](self, "time");
  -[SVPlaybackCoordinator playbackPausedAtTime:](self, "playbackPausedAtTime:");
  -[SVPlaybackCoordinator setState:](self, "setState:", 4);
  -[SVPlaybackCoordinator video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackPaused");

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "playbackCoordinatorPausedPlayback:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)playbackResumed
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator time](self, "time");
  -[SVPlaybackCoordinator playbackResumedAtTime:](self, "playbackResumedAtTime:");
  -[SVPlaybackCoordinator setState:](self, "setState:", 3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorResumedPlayback:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[SVPlaybackCoordinator video](self, "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackResumed");

  }
}

- (void)playbackFinished
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator setState:](self, "setState:", 4);
  -[SVPlaybackCoordinator video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackFinished");

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "playbackCoordinatorFinishedPlayback:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)playbackFailedWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SVPlaybackCoordinator setState:](self, "setState:", 5);
  -[SVPlaybackCoordinator setError:](self, "setError:", v4);
  -[SVPlaybackCoordinator video](self, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackFailedWithError:", v4);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "playbackCoordinator:playbackFailedWithError:", self, v4);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)timeElapsed:(double)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator timeline](self, "timeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVTimeline setTime:]((uint64_t)v7, a3);

  -[SVPlaybackCoordinator video](self, "video");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SVPlaybackCoordinator video](self, "video");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeElapsed:duration:", a3, a4);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "playbackCoordinator:timeElapsed:duration:", self, a3, a4);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)loadedTimeRangesChanged
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SVPlaybackCoordinator loadingProgress](self, "loadingProgress");
  if (v3 != 0.0)
  {
    v4 = v3;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SVPlaybackCoordinator observers](self, "observers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "playbackCoordinator:loadingProgressed:", self, v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)stateChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorStateChanged:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addPlaybackBufferObserver
{
  SVKeyValueObserver *v3;
  void *v4;
  void *v5;
  SVKeyValueObserver *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  -[SVPlaybackCoordinator player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __50__SVPlaybackCoordinator_addPlaybackBufferObserver__block_invoke;
  v10 = &unk_24DBC23B8;
  objc_copyWeak(&v11, &location);
  v6 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v3, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("playbackBufferFull"), v5, 1, &v7);
  -[SVPlaybackCoordinator setPlaybackBufferFullObserver:](self, "setPlaybackBufferFullObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SVPlaybackCoordinator_addPlaybackBufferObserver__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained[9] = objc_msgSend(v2, "isPlaybackBufferFull");

  objc_msgSend(WeakRetained, "playbackBufferFullStateChanged");
}

- (void)playbackBufferFullStateChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorPlaybackBufferFullStateChanged:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addPlaybackLikelyToKeepUpObserver
{
  SVKeyValueObserver *v3;
  void *v4;
  void *v5;
  SVKeyValueObserver *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  -[SVPlaybackCoordinator player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __58__SVPlaybackCoordinator_addPlaybackLikelyToKeepUpObserver__block_invoke;
  v10 = &unk_24DBC23B8;
  objc_copyWeak(&v11, &location);
  v6 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v3, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("playbackLikelyToKeepUp"), v5, 1, &v7);
  -[SVPlaybackCoordinator setPlaybackLikelyToKeepUpObserver:](self, "setPlaybackLikelyToKeepUpObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __58__SVPlaybackCoordinator_addPlaybackLikelyToKeepUpObserver__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained[8] = objc_msgSend(v2, "isPlaybackLikelyToKeepUp");

  objc_msgSend(WeakRetained, "playbackLikelyToKeepUpStateChanged");
}

- (void)playbackLikelyToKeepUpStateChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorPlaybackLikelyToKeepUpStateChanged:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addMuteStateObserver
{
  SVKeyValueObserver *v3;
  void *v4;
  SVKeyValueObserver *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  -[SVPlaybackCoordinator player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __45__SVPlaybackCoordinator_addMuteStateObserver__block_invoke;
  v9 = &unk_24DBC23B8;
  objc_copyWeak(&v10, &location);
  v5 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v3, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("muted"), v4, 1, &v6);
  -[SVPlaybackCoordinator setMuteStateObserver:](self, "setMuteStateObserver:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__SVPlaybackCoordinator_addMuteStateObserver__block_invoke(uint64_t a1)
{
  void *v1;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained[10] = objc_msgSend(v1, "isMuted");

  objc_msgSend(WeakRetained, "muteStateChanged");
}

- (void)muteStateChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SVPlaybackCoordinator observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "playbackCoordinatorMuteStateChanged:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addPlayerItemPresentationSizeObserver
{
  SVKeyValueObserver *v3;
  void *v4;
  void *v5;
  SVKeyValueObserver *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  -[SVPlaybackCoordinator player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __62__SVPlaybackCoordinator_addPlayerItemPresentationSizeObserver__block_invoke;
  v10 = &unk_24DBC23B8;
  objc_copyWeak(&v11, &location);
  v6 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v3, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("presentationSize"), v5, 1, &v7);
  -[SVPlaybackCoordinator setPlayerItemPresentationSizeObserver:](self, "setPlayerItemPresentationSizeObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__SVPlaybackCoordinator_addPlayerItemPresentationSizeObserver__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationSize");
  objc_msgSend(v3, "setDimensions:");

}

- (void)removePlayerItemPresentationSizeObserver
{
  -[SVPlaybackCoordinator setPlayerItemPresentationSizeObserver:](self, "setPlayerItemPresentationSizeObserver:", 0);
}

- (void)configureTimeline
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id *v7;
  void *v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  id *v19;
  id v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  -[SVPlaybackCoordinator timeline](self, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVTimeline cancelScheduledBlocks]((uint64_t)v3);

  -[SVPlaybackCoordinator timeline](self, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVTimeline resetTime]((uint64_t)v4);

  -[SVPlaybackCoordinator timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVPlaybackCoordinator duration](self, "duration");
  -[SVTimeline setDuration:]((uint64_t)v5, v6);

  if (-[SVPlaybackCoordinator supportImpressionTracking](self, "supportImpressionTracking"))
  {
    objc_initWeak(&location, self);
    -[SVPlaybackCoordinator timeline](self, "timeline");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke;
    v36[3] = &unk_24DBC2590;
    objc_copyWeak(&v37, &location);
    -[SVPlaybackCoordinator video](self, "video");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "impressionThreshold");
    v10 = -[SVTimeline performBlock:at:](v7, v36, v9);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  if (-[SVPlaybackCoordinator supportsQuartileTracking](self, "supportsQuartileTracking"))
  {
    -[SVPlaybackCoordinator duration](self, "duration");
    v12 = v11;
    -[SVPlaybackCoordinator duration](self, "duration");
    v14 = v13;
    -[SVPlaybackCoordinator duration](self, "duration");
    v16 = v15;
    objc_initWeak(&location, self);
    v17 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_2;
    v34[3] = &unk_24DBC25B8;
    objc_copyWeak(&v35, &location);
    v18 = (void *)MEMORY[0x2207327F0](v34);
    -[SVPlaybackCoordinator timeline](self, "timeline");
    v19 = (id *)objc_claimAutoreleasedReturnValue();
    v32[0] = v17;
    v32[1] = 3221225472;
    v32[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_3;
    v32[3] = &unk_24DBC2478;
    v20 = v18;
    v33 = v20;
    v21 = -[SVTimeline performBlock:at:](v19, v32, v12 * 0.25);

    -[SVPlaybackCoordinator timeline](self, "timeline");
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_4;
    v30[3] = &unk_24DBC2478;
    v23 = v20;
    v31 = v23;
    v24 = -[SVTimeline performBlock:at:](v22, v30, v14 * 0.5);

    -[SVPlaybackCoordinator timeline](self, "timeline");
    v25 = (id *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_5;
    v28[3] = &unk_24DBC2478;
    v26 = v23;
    v29 = v26;
    v27 = -[SVTimeline performBlock:at:](v25, v28, v16 * 0.75);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

void __42__SVPlaybackCoordinator_configureTimeline__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "video");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "video");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playbackPassedImpressionThreshold");

  }
}

void __42__SVPlaybackCoordinator_configureTimeline__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackPassedQuartile:", a2);

  }
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)playbackResumedAtTime:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[SVPlaybackCoordinator pausedAtTime](self, "pausedAtTime", a3);
  v5 = v4;
  -[SVPlaybackCoordinator time](self, "time");
  v7 = v5 - v6;
  if (v7 < 0.0)
    v7 = -v7;
  if (v7 > 0.5)
  {
    -[SVPlaybackCoordinator timeline](self, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVTimeline cancelScheduledBlocks]((uint64_t)v8);

  }
  -[SVPlaybackCoordinator setPausedAtTime:](self, "setPausedAtTime:", 0.0);
}

- (BOOL)supportImpressionTracking
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  BOOL v7;

  -[SVPlaybackCoordinator video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SVPlaybackCoordinator video](self, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "impressionThreshold");
  v7 = v6 > 0.0;

  return v7;
}

- (BOOL)supportsQuartileTracking
{
  double v3;

  -[SVPlaybackCoordinator duration](self, "duration");
  -[SVPlaybackCoordinator duration](self, "duration");
  return v3 > 0.0;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[SVPlaybackCoordinator stateChanged](self, "stateChanged");
  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_muted != a3)
  {
    v3 = a3;
    self->_muted = a3;
    -[SVPlaybackCoordinator player](self, "player");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMuted:", v3);

  }
}

- (BOOL)playbackLikelyToKeepUp
{
  return self->_playbackLikelyToKeepUp;
}

- (BOOL)playbackBufferFull
{
  return self->_playbackBufferFull;
}

- (SVVideoProviding)video
{
  return self->_video;
}

- (unint64_t)state
{
  return self->_state;
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (SVVideoPlaybackHost)host
{
  return (SVVideoPlaybackHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (BOOL)muted
{
  return self->_muted;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)playbackRequested
{
  return self->_playbackRequested;
}

- (void)setPlaybackRequested:(BOOL)a3
{
  self->_playbackRequested = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)initiatedPlayback
{
  return self->_initiatedPlayback;
}

- (void)setInitiatedPlayback:(BOOL)a3
{
  self->_initiatedPlayback = a3;
}

- (SVKeyValueObserver)playerItemPresentationSizeObserver
{
  return self->_playerItemPresentationSizeObserver;
}

- (void)setPlayerItemPresentationSizeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_playerItemPresentationSizeObserver, a3);
}

- (SVKeyValueObserver)readyForDisplayObserver
{
  return self->_readyForDisplayObserver;
}

- (void)setReadyForDisplayObserver:(id)a3
{
  objc_storeStrong((id *)&self->_readyForDisplayObserver, a3);
}

- (SVAVPlayerFactory)playerFactory
{
  return self->_playerFactory;
}

- (SVKeyValueObserver)muteStateObserver
{
  return self->_muteStateObserver;
}

- (void)setMuteStateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_muteStateObserver, a3);
}

- (SVKeyValueObserver)playbackLikelyToKeepUpObserver
{
  return self->_playbackLikelyToKeepUpObserver;
}

- (void)setPlaybackLikelyToKeepUpObserver:(id)a3
{
  objc_storeStrong((id *)&self->_playbackLikelyToKeepUpObserver, a3);
}

- (SVKeyValueObserver)playbackBufferFullObserver
{
  return self->_playbackBufferFullObserver;
}

- (void)setPlaybackBufferFullObserver:(id)a3
{
  objc_storeStrong((id *)&self->_playbackBufferFullObserver, a3);
}

- (SVTimeline)timeline
{
  return self->_timeline;
}

- (double)pausedAtTime
{
  return self->_pausedAtTime;
}

- (void)setPausedAtTime:(double)a3
{
  self->_pausedAtTime = a3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSTimer)readyToPlayTimer
{
  return self->_readyToPlayTimer;
}

- (void)setReadyToPlayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_readyToPlayTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readyToPlayTimer, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_playbackBufferFullObserver, 0);
  objc_storeStrong((id *)&self->_playbackLikelyToKeepUpObserver, 0);
  objc_storeStrong((id *)&self->_muteStateObserver, 0);
  objc_storeStrong((id *)&self->_playerFactory, 0);
  objc_storeStrong((id *)&self->_readyForDisplayObserver, 0);
  objc_storeStrong((id *)&self->_playerItemPresentationSizeObserver, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
