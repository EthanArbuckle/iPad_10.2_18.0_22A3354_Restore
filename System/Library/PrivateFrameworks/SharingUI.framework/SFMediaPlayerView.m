@implementation SFMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_212728000, log, OS_LOG_TYPE_FAULT, "SFMediaPlayerView deallocated before calling stop", v1, 2u);
}

- (void)startMovieLoopWithPath:(id)a3
{
  AVQueuePlayer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVPlayerLooper *v9;
  AVPlayerLooper *avLooper;
  id v11;

  v11 = a3;
  v4 = self->_avQueuePlayer;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCategory:withOptions:error:", *MEMORY[0x24BDB1598], 1, 0);

    v4 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
    -[AVQueuePlayer setAllowsExternalPlayback:](v4, "setAllowsExternalPlayback:", 0);
    -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](v4, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVQueuePlayer _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:](v4, "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:", 1);
    objc_storeStrong((id *)&self->_avQueuePlayer, v4);
    -[SFMediaPlayerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayer:", v4);

    -[SFMediaPlayerView setPausesAfterEachItem:](self, "setPausesAfterEachItem:", -[SFMediaPlayerView pausesAfterEachItem](self, "pausesAfterEachItem"));
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2650], "playerLooperWithPlayer:templateItem:", v4, v8);
  v9 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  avLooper = self->_avLooper;
  self->_avLooper = v9;

  -[SFMediaPlayerView play](self, "play");
}

- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4
{
  void *v5;
  id v6;

  SFAdjustmentFiltersForAssetTypeAndURL(a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFMediaPlayerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v6);

}

- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5
{
  uint64_t v6;
  id v8;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[SFMediaPlayerView updateViewForAssetType:adjustmentsURL:](self, "updateViewForAssetType:adjustmentsURL:", v6, a5);
  -[SFMediaPlayerView startMovieLoopWithPath:](self, "startMovieLoopWithPath:", v8);

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVQueuePlayer *avQueuePlayer;
  AVPlayerLooper *avLooper;
  NSMutableArray *mediaItems;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SFMediaPlayerView stop]";
    _os_log_impl(&dword_212728000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[SFMediaPlayerView _pause](self, "_pause");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSMutableArray copy](self->_mediaItems, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[SFMediaPlayerView removeMovieItem:](self, "removeMovieItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (self->_isKVOObserver)
    -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_avQueuePlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), SFMediaPlayerViewObserverContext);
  avQueuePlayer = self->_avQueuePlayer;
  self->_avQueuePlayer = 0;

  avLooper = self->_avLooper;
  self->_avLooper = 0;

  mediaItems = self->_mediaItems;
  self->_mediaItems = 0;

  -[SFMediaPlayerView stopSpeedUpTimer](self, "stopSpeedUpTimer");
}

- (void)play
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SFMediaPlayerView play]";
    _os_log_impl(&dword_212728000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[AVQueuePlayer play](self->_avQueuePlayer, "play");
}

- (void)pause
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SFMediaPlayerView pause]";
    _os_log_impl(&dword_212728000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[SFMediaPlayerView _pause](self, "_pause");
}

- (void)_pause
{
  -[AVQueuePlayer pause](self->_avQueuePlayer, "pause");
}

- (BOOL)isPaused
{
  float v2;

  -[AVQueuePlayer rate](self->_avQueuePlayer, "rate");
  return fabsf(v2) < 0.00000011921;
}

- (void)advanceToNextItem
{
  -[AVQueuePlayer advanceToNextItem](self->_avQueuePlayer, "advanceToNextItem");
}

- (void)setPausesAfterEachItem:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "no";
    if (v3)
      v6 = "yes";
    v7 = 136315394;
    v8 = "-[SFMediaPlayerView setPausesAfterEachItem:]";
    v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "%s %s", (uint8_t *)&v7, 0x16u);
  }

  self->_pausesAfterEachItem = v3;
  -[AVQueuePlayer setActionAtItemEnd:](self->_avQueuePlayer, "setActionAtItemEnd:", v3);
}

- (void)addMovieItem:(id)a3
{
  id v4;
  NSMutableArray *mediaItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  AVQueuePlayer *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  mediaItems = self->_mediaItems;
  if (!mediaItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_mediaItems;
    self->_mediaItems = v6;

    mediaItems = self->_mediaItems;
  }
  -[NSMutableArray addObject:](mediaItems, "addObject:", v4);
  v8 = (void *)MEMORY[0x24BDB2618];
  objc_msgSend(v4, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerItemWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPlayerItem:", v10);
  v11 = self->_avQueuePlayer;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCategory:withOptions:error:", *MEMORY[0x24BDB1598], 1, 0);

    v11 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
    -[AVQueuePlayer setAllowsExternalPlayback:](v11, "setAllowsExternalPlayback:", 0);
    -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](v11, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVQueuePlayer _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:](v11, "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:", 1);
    objc_storeStrong((id *)&self->_avQueuePlayer, v11);
    -[SFMediaPlayerView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlayer:", v11);

    -[SFMediaPlayerView setPausesAfterEachItem:](self, "setPausesAfterEachItem:", -[SFMediaPlayerView pausesAfterEachItem](self, "pausesAfterEachItem"));
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_avQueuePlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 3, SFMediaPlayerViewObserverContext);
    self->_isKVOObserver = 1;
  }
  framework_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[SFMediaPlayerView addMovieItem:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_212728000, v14, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  -[SFMediaPlayerView enqueueItemsFromMediaItem:afterItem:](self, "enqueueItemsFromMediaItem:afterItem:", v4, 0);
}

- (void)removeAllQueuedItems
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_mediaItems, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SFMediaPlayerView removeMovieItem:](self, "removeMovieItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeMovieItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  AVQueuePlayer *avQueuePlayer;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SFMediaPlayerView removeMovieItem:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "observerToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    avQueuePlayer = self->_avQueuePlayer;
    objc_msgSend(v4, "observerToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVQueuePlayer removeTimeObserver:](avQueuePlayer, "removeTimeObserver:", v8);

  }
  objc_msgSend(v4, "invalidate");
  -[NSMutableArray removeObject:](self->_mediaItems, "removeObject:", v4);

}

- (void)breakFirstEnqueuedLoop
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_mediaItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "shouldLoop", (_QWORD)v10))
        {
          objc_msgSend(v8, "setShouldLoop:", 0);
          -[SFMediaPlayerView dequeueNonPlayingItemsFromMediaItem:](self, "dequeueNonPlayingItemsFromMediaItem:", v8);
          framework_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v15 = "-[SFMediaPlayerView breakFirstEnqueuedLoop]";
            v16 = 2112;
            v17 = v8;
            _os_log_impl(&dword_212728000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
          }

          goto LABEL_13;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)speedUpRemainderOfCurrentItem
{
  void *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *speedUpTimer;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[7];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  -[SFMediaPlayerView stopSpeedUpTimer](self, "stopSpeedUpTimer");
  -[AVQueuePlayer currentItem](self->_avQueuePlayer, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    speedUpTimer = self->_speedUpTimer;
    self->_speedUpTimer = v4;

    v6 = self->_speedUpTimer;
    v7 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v6, v7, 0x5F5E100uLL, 0x17D7840uLL);
    v8 = self->_speedUpTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __50__SFMediaPlayerView_speedUpRemainderOfCurrentItem__block_invoke;
    handler[3] = &unk_24CE0F328;
    handler[4] = self;
    handler[5] = v3;
    handler[6] = 200;
    v10 = xmmword_2127A29E0;
    v11 = 100;
    v12 = 0x4000000000000000;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume((dispatch_object_t)self->_speedUpTimer);
  }

}

void __50__SFMediaPlayerView_speedUpRemainderOfCurrentItem__block_invoke(uint64_t a1)
{
  float v2;
  float v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  float v16;
  double v17;
  float v18;
  NSObject *v19;
  uint64_t v20;
  double v21;
  CMTime rhs;
  CMTime lhs;
  CMTime v24;
  CMTime time;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "rate");
  v3 = v2;
  memset(&v24, 0, sizeof(v24));
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(&lhs, 0, sizeof(lhs));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  if (v5)
    objc_msgSend(v5, "currentTime");
  else
    memset(&rhs, 0, sizeof(rhs));
  CMTimeSubtract(&v24, &lhs, &rhs);
  time = v24;
  v6 = (unint64_t)(CMTimeGetSeconds(&time) * 1000.0);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v6 >= v7;
  v9 = v6 - v7;
  if (!v8)
    v9 = 0;
  v10 = v3;
  v11 = *(double *)(a1 + 56);
  v12 = *(double *)(a1 + 64);
  v13 = v3 - v11;
  v14 = (double)*(unint64_t *)(a1 + 72);
  v15 = (unint64_t)(v13 / v12 * v14);
  if (v9 <= v15)
  {
    if (v13 <= v11)
      v13 = *(double *)(a1 + 56);
    v16 = v13 / (double)v9 * v14;
    v17 = (float)(v3 - v16);
    if (v11 < v17)
      v11 = v17;
  }
  else
  {
    v11 = v12 + v10;
    if (v12 + v10 >= *(double *)(a1 + 80))
      v11 = *(double *)(a1 + 80);
  }
  v18 = v11;
  if (vabds_f32(v3, v18) >= 0.00000011921)
  {
    framework_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 48);
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)"-[SFMediaPlayerView speedUpRemainderOfCurrentItem]_block_invoke";
      LOWORD(time.flags) = 2048;
      *(_QWORD *)((char *)&time.flags + 2) = v15;
      HIWORD(time.epoch) = 2048;
      v26 = v6;
      v27 = 2048;
      v28 = v20;
      v29 = 2048;
      v30 = v3;
      v31 = 2048;
      v32 = v18;
      _os_log_impl(&dword_212728000, v19, OS_LOG_TYPE_DEFAULT, "%s timeToReturnMS:%lums, timeRemaining:%lums (buffer: %lums), rate change %f->%f", (uint8_t *)&time, 0x3Eu);
    }

    *(float *)&v21 = v18;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setRate:", v21);
  }
}

- (void)stopSpeedUpTimer
{
  OS_dispatch_source *speedUpTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  double v6;
  NSObject *v7;
  float v8;
  int v9;
  const char *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  speedUpTimer = self->_speedUpTimer;
  if (speedUpTimer)
  {
    v4 = speedUpTimer;
    dispatch_source_cancel(v4);
    v5 = self->_speedUpTimer;
    self->_speedUpTimer = 0;

    LODWORD(v6) = 1.0;
    -[AVQueuePlayer setRate:](self->_avQueuePlayer, "setRate:", v6);
    framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[AVQueuePlayer rate](self->_avQueuePlayer, "rate");
      v9 = 136315394;
      v10 = "-[SFMediaPlayerView stopSpeedUpTimer]";
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_212728000, v7, OS_LOG_TYPE_DEFAULT, "%s Resetting rate to %f", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)enqueueItemsFromMediaItem:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE buf[24];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SFMediaPlayerView enqueueItemsFromMediaItem:afterItem:]";
    _os_log_impl(&dword_212728000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = v7;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v6;
  objc_msgSend(v6, "playerItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v21 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v22 = *MEMORY[0x24BDB1FA8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[AVQueuePlayer items](self->_avQueuePlayer, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v14);

        if ((v16 & 1) == 0)
        {
          *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
          *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
          v26 = *(_OWORD *)buf;
          v27 = *(_QWORD *)&buf[16];
          v24 = *(_OWORD *)buf;
          v25 = *(_QWORD *)&buf[16];
          objc_msgSend(v14, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", buf, &v26, &v24, 0);
          framework_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[SFMediaPlayerView enqueueItemsFromMediaItem:afterItem:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            v33 = v9;
            _os_log_impl(&dword_212728000, v17, OS_LOG_TYPE_DEFAULT, "%s insertItem: %@ afterItem: %@", buf, 0x20u);
          }

          -[AVQueuePlayer insertItem:afterItem:](self->_avQueuePlayer, "insertItem:afterItem:", v14, v9);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_playerItemDidReachEnd_, v22, v14);

          v19 = v14;
          v9 = v19;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
  }

}

- (void)dequeueNonPlayingItemsFromMediaItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[SFMediaPlayerView dequeueNonPlayingItemsFromMediaItem:]";
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[AVQueuePlayer currentItem](self->_avQueuePlayer, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v4;
  objc_msgSend(v4, "playerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = v6;
        v14 = v12;
        if (v13 == v14)
        {

          continue;
        }
        v15 = v14;
        if ((v6 == 0) != (v14 != 0))
        {
          v16 = objc_msgSend(v13, "isEqual:", v14);

          if ((v16 & 1) != 0)
            continue;
        }
        else
        {

        }
        framework_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[SFMediaPlayerView dequeueNonPlayingItemsFromMediaItem:]";
          v25 = 2112;
          v26 = v15;
          _os_log_impl(&dword_212728000, v17, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
        }

        -[AVQueuePlayer removeItem:](self->_avQueuePlayer, "removeItem:", v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v9);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void (**v29)(void);
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[6];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)SFMediaPlayerViewObserverContext == a6)
  {
    v13 = (__CFString *)v10;
    if (v13 == CFSTR("currentItem")
      || (v14 = v13) != 0
      && (v15 = -[__CFString isEqual:](v13, "isEqual:", CFSTR("currentItem")), v14, v15))
    {
      v32 = v11;
      v33 = v10;
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
      v16 = objc_claimAutoreleasedReturnValue();
      v31 = v12;
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      framework_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v43 = "-[SFMediaPlayerView observeValueForKeyPath:ofObject:change:context:]";
        v44 = 2112;
        v45 = v16;
        v46 = 2112;
        v47 = v17;
        _os_log_impl(&dword_212728000, v18, OS_LOG_TYPE_DEFAULT, "%s currentItem: %@ -> %@", buf, 0x20u);
      }
      v30 = (void *)v16;

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = self->_mediaItems;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        v23 = MEMORY[0x24BDAC9B8];
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v25, "playerItems");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v17);

            if (v27)
            {
              objc_msgSend(v25, "startedHandler");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v25, "startedHandler");
                v29 = (void (**)(void))objc_claimAutoreleasedReturnValue();
                v29[2]();

              }
              -[SFMediaPlayerView setUpTimeRangeNotificationsForItem:](self, "setUpTimeRangeNotificationsForItem:", v25);
              if (objc_msgSend(v25, "shouldLoop"))
              {
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __68__SFMediaPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
                block[3] = &unk_24CE0EDD0;
                block[4] = self;
                block[5] = v25;
                v35 = v17;
                dispatch_async(v23, block);

              }
            }
          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v21);
      }

      v11 = v32;
      v10 = v33;
      v12 = v31;
    }
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)SFMediaPlayerView;
    -[SFMediaPlayerView observeValueForKeyPath:ofObject:change:context:](&v40, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __68__SFMediaPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enqueueItemsFromMediaItem:afterItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setUpTimeRangeNotificationsForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AVQueuePlayer *avQueuePlayer;
  void *v18;
  NSObject *v19;
  void *v20;
  AVQueuePlayer *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  CMTimeRange range;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange buf;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "playbackNotificationTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "playbackNotificationTimeRanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          memset(&buf, 0, sizeof(buf));
          if (v12)
            objc_msgSend(v12, "CMTimeRangeValue");
          *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
          range.start.epoch = buf.start.epoch;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &range);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          v14 = (void *)MEMORY[0x24BDD1968];
          range = buf;
          CMTimeRangeGetEnd(&v31, &range);
          objc_msgSend(v14, "valueWithCMTime:", &v31);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "observerToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      avQueuePlayer = self->_avQueuePlayer;
      objc_msgSend(v4, "observerToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVQueuePlayer removeTimeObserver:](avQueuePlayer, "removeTimeObserver:", v18);

    }
    framework_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      SFCompactStringFromCollection();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 136315650;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView setUpTimeRangeNotificationsForItem:]";
      LOWORD(buf.start.flags) = 2112;
      *(_QWORD *)((char *)&buf.start.flags + 2) = v4;
      HIWORD(buf.start.epoch) = 2112;
      buf.duration.value = (CMTimeValue)v20;
      _os_log_impl(&dword_212728000, v19, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, times: %@", (uint8_t *)&buf, 0x20u);

    }
    buf.start.value = 0;
    objc_initWeak((id *)&buf, self);
    range.start.value = 0;
    objc_initWeak((id *)&range, v4);
    v21 = self->_avQueuePlayer;
    v22 = MEMORY[0x24BDAC9B8];
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __56__SFMediaPlayerView_setUpTimeRangeNotificationsForItem___block_invoke;
    v27 = &unk_24CE0F350;
    objc_copyWeak(&v28, (id *)&buf);
    objc_copyWeak(&v29, (id *)&range);
    -[AVQueuePlayer addBoundaryTimeObserverForTimes:queue:usingBlock:](v21, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v7, MEMORY[0x24BDAC9B8], &v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObserverToken:", v23, v24, v25, v26, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)&range);
    objc_destroyWeak((id *)&buf);

  }
}

void __56__SFMediaPlayerView_setUpTimeRangeNotificationsForItem___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleBoundaryTimeObserverForMediaItem:", v2);

}

- (void)handleBoundaryTimeObserverForMediaItem:(id)a3
{
  id v4;
  AVQueuePlayer *avQueuePlayer;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void (**v14)(void);
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime rhs;
  CMTime time1;
  __int128 v21;
  CMTimeEpoch epoch;
  CMTimeRange v23;
  CMTime v24;
  __int128 v25;
  CMTimeEpoch v26;
  CMTimeRange lhs;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0uLL;
  v26 = 0;
  avQueuePlayer = self->_avQueuePlayer;
  if (avQueuePlayer)
    -[AVQueuePlayer currentTime](avQueuePlayer, "currentTime");
  memset(&v24, 0, sizeof(v24));
  CMTimeMake(&v24, 1, 10);
  objc_msgSend(v4, "playbackNotificationTimeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v4, "playbackNotificationTimeRanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v23, 0, sizeof(v23));
      if (v10)
        objc_msgSend(v10, "CMTimeRangeValue");
      v21 = *(_OWORD *)&v23.start.value;
      epoch = v23.start.epoch;
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
      lhs.start.epoch = v23.start.epoch;
      rhs = v24;
      CMTimeSubtract(&time1, &lhs.start, &rhs);
      *(_OWORD *)&lhs.start.value = v25;
      lhs.start.epoch = v26;
      if (CMTimeCompare(&time1, &lhs.start) < 0)
      {
        *(_OWORD *)&lhs.start.value = v21;
        lhs.start.epoch = epoch;
        rhs = v24;
        CMTimeAdd(&v18, &lhs.start, &rhs);
        *(_OWORD *)&lhs.start.value = v25;
        lhs.start.epoch = v26;
        if (CMTimeCompare(&v18, &lhs.start) >= 1)
          break;
      }
      memset(&rhs, 0, sizeof(rhs));
      lhs = v23;
      CMTimeRangeGetEnd(&rhs, &lhs);
      lhs.start = rhs;
      v16 = v24;
      CMTimeSubtract(&v17, &lhs.start, &v16);
      *(_OWORD *)&lhs.start.value = v25;
      lhs.start.epoch = v26;
      if (CMTimeCompare(&v17, &lhs.start) < 0)
      {
        lhs.start = rhs;
        v16 = v24;
        CMTimeAdd(&v15, &lhs.start, &v16);
        *(_OWORD *)&lhs.start.value = v25;
        lhs.start.epoch = v26;
        if (CMTimeCompare(&v15, &lhs.start) >= 1)
        {
          framework_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(lhs.start.value) = 136315650;
            *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView handleBoundaryTimeObserverForMediaItem:]";
            LOWORD(lhs.start.flags) = 2112;
            *(_QWORD *)((char *)&lhs.start.flags + 2) = v4;
            HIWORD(lhs.start.epoch) = 2048;
            lhs.duration.value = v8;
            _os_log_impl(&dword_212728000, v13, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, triggering timeRangeHandler with end of range %ld", (uint8_t *)&lhs, 0x20u);
          }
          goto LABEL_18;
        }
      }

      ++v8;
      objc_msgSend(v4, "playbackNotificationTimeRanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v8 >= v12)
        goto LABEL_19;
    }
    framework_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(lhs.start.value) = 136315650;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView handleBoundaryTimeObserverForMediaItem:]";
      LOWORD(lhs.start.flags) = 2112;
      *(_QWORD *)((char *)&lhs.start.flags + 2) = v4;
      HIWORD(lhs.start.epoch) = 2048;
      lhs.duration.value = v8;
      _os_log_impl(&dword_212728000, v13, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, triggering timeRangeHandler with start of range %ld", (uint8_t *)&lhs, 0x20u);
    }
LABEL_18:

    objc_msgSend(v4, "timeRangeHandler");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();

  }
LABEL_19:

}

- (void)playerItemDidReachEnd:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SFMediaPlayerView stopSpeedUpTimer](self, "stopSpeedUpTimer");
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SFMediaPlayerView playerItemDidReachEnd:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_212728000, v6, OS_LOG_TYPE_DEFAULT, "%s playerItem: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SFMediaPlayerView_playerItemDidReachEnd___block_invoke;
  v8[3] = &unk_24CE0EDA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __43__SFMediaPlayerView_playerItemDidReachEnd___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void (**v12)(void);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 432);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "playerItems", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 40));

        if (v9)
        {
          if ((objc_msgSend(v7, "shouldLoop") & 1) == 0)
          {
            framework_log();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v18 = "-[SFMediaPlayerView playerItemDidReachEnd:]_block_invoke";
              v19 = 2112;
              v20 = v7;
              _os_log_impl(&dword_212728000, v10, OS_LOG_TYPE_DEFAULT, "%s endedItem: %@", buf, 0x16u);
            }

            objc_msgSend(v7, "completedHandler");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v7, "completedHandler");
              v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v12[2]();

            }
            objc_msgSend(*(id *)(a1 + 32), "removeMovieItem:", v7);
          }
          goto LABEL_16;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_16:

}

- (BOOL)pausesAfterEachItem
{
  return self->_pausesAfterEachItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedUpTimer, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_avQueuePlayer, 0);
  objc_storeStrong((id *)&self->_avLooper, 0);
}

@end
