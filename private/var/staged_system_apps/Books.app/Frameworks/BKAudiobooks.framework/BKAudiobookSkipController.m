@implementation BKAudiobookSkipController

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6[0] = CFSTR("BKAudioBookSkipForward");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 15.0));
  v6[1] = CFSTR("BKAudioBookSkipBackward");
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 15.0));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  objc_msgSend(v2, "registerDefaults:", v5);

}

- (BKAudiobookSkipController)initWithAudiobookControls:(id)a3
{
  id v4;
  BKAudiobookSkipController *v5;
  BKAudiobookSkipController *v6;
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  AVAudioPlayer *v11;
  AVAudioPlayer *fxPlayer;
  NSMutableDictionary *v13;
  NSMutableDictionary *accelerationMap;
  void *v15;
  void *v16;
  uint64_t v17;
  NSHashTable *observers;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BKAudiobookSkipController;
  v5 = -[BKAudiobookSkipController init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_audiobookControls, v4);
    v7 = objc_alloc((Class)AVAudioPlayer);
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("skipFX"), CFSTR("aiff")));
    v11 = (AVAudioPlayer *)objc_msgSend(v7, "initWithContentsOfURL:error:", v10, 0);
    fxPlayer = v6->_fxPlayer;
    v6->_fxPlayer = v11;

    *(_OWORD *)&v6->_seekDelta = xmmword_2AC60;
    *(_OWORD *)&v6->_forwardSeekSpeedMultiplier = xmmword_2AC70;
    v13 = objc_opt_new(NSMutableDictionary);
    accelerationMap = v6->_accelerationMap;
    v6->_accelerationMap = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_accelerationMap, "setObject:forKeyedSubscript:", v15, &off_3A0F8);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v6, CFSTR("BKAudioBookSkipForward"), 5, off_44948);
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v6, CFSTR("BKAudioBookSkipBackward"), 5, off_44950);
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v17;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("BKAudioBookSkipForward"), off_44948);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("BKAudioBookSkipBackward"), off_44950);

  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookSkipController;
  -[BKAudiobookSkipController dealloc](&v4, "dealloc");
}

- (void)setForwardSkipTime:(double)a3
{
  self->_forwardSkipTime = a3;
  -[BKAudiobookSkipController _sendSkipControllerSettingsDidChange](self, "_sendSkipControllerSettingsDidChange");
}

- (void)setBackwardSkipTime:(double)a3
{
  self->_backwardSkipTime = a3;
  -[BKAudiobookSkipController _sendSkipControllerSettingsDidChange](self, "_sendSkipControllerSettingsDidChange");
}

- (BOOL)isActive
{
  return self->_skipping || self->_seeking;
}

- (BOOL)startSkip:(unint64_t)a3 actionSource:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id WeakRetained;
  id v12;
  id v13;
  NSObject *v14;
  _DWORD v16[2];

  v7 = BKAudiobooksSkipControllerLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "startSkip: %d", (uint8_t *)v16, 8u);
  }

  v9 = -[BKAudiobookSkipController _canStartSkip](self, "_canStartSkip");
  if (v9)
  {
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController audiobookControls](self, "audiobookControls"));
    objc_msgSend(v10, "positionInCurrentAudiobook");
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    -[BKAudiobookSkipController setSkipping:](self, "setSkipping:", 1);
    -[BKAudiobookSkipController setDirection:](self, "setDirection:", a3);
    -[BKAudiobookSkipController setActionSource:](self, "setActionSource:", a4);
    -[BKAudiobookSkipController _sendWillWillBeginSkippingObserverCallbacksWithDirection:](self, "_sendWillWillBeginSkippingObserverCallbacksWithDirection:", a3);
    -[BKAudiobookSkipController _sendWillPauseObserverCallbacks](self, "_sendWillPauseObserverCallbacks");
    WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    LODWORD(v10) = objc_msgSend(WeakRetained, "isPlaying");

    if ((_DWORD)v10)
    {
      -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", 1);
      v12 = objc_loadWeakRetained((id *)&self->_audiobookControls);
      objc_msgSend(v12, "pause");

    }
    self->_skipStepCount = 0;
    -[BKAudiobookSkipController baseEventInterval](self, "baseEventInterval");
    -[BKAudiobookSkipController _scheduleSkipTimerWithInterval:](self, "_scheduleSkipTimerWithInterval:");
  }
  else
  {
    v13 = BKAudiobooksSkipControllerLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_219A0();

  }
  return v9;
}

- (BOOL)endSkip
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = BKAudiobooksSkipControllerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "endSkip", v10, 2u);
  }

  v5 = -[BKAudiobookSkipController _canEndSkip](self, "_canEndSkip");
  if (v5)
  {
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    if (-[BKAudiobookSkipController wasPlaying](self, "wasPlaying"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
      objc_msgSend(WeakRetained, "play");

    }
    if (!self->_skipStepCount)
    {
      -[BKAudiobookSkipController _processSkipEvent](self, "_processSkipEvent");
      -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    }
    -[BKAudiobookSkipController setSkipping:](self, "setSkipping:", 0);
    -[BKAudiobookSkipController _sendDidEndSkippingObserverCallbacks](self, "_sendDidEndSkippingObserverCallbacks");
    -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", 0);
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:", 0.0);
  }
  else
  {
    v7 = BKAudiobooksSkipControllerLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_219CC();

  }
  return v5;
}

- (void)endSkipIfSkipping
{
  if (-[BKAudiobookSkipController isSkipping](self, "isSkipping"))
    -[BKAudiobookSkipController endSkip](self, "endSkip");
}

- (BOOL)singleSkip:(unint64_t)a3 interval:(double)a4
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  _DWORD v16[2];
  __int16 v17;
  double v18;

  v7 = BKAudiobooksSkipControllerLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109376;
    v16[1] = a3;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "singleSkip: %d interval:%lf", (uint8_t *)v16, 0x12u);
  }

  v9 = -[BKAudiobookSkipController _canStartSkip](self, "_canStartSkip");
  if (v9)
  {
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    -[BKAudiobookSkipController setSkipStepCount:](self, "setSkipStepCount:", 0);
    -[BKAudiobookSkipController setDirection:](self, "setDirection:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController audiobookControls](self, "audiobookControls"));
    objc_msgSend(v10, "positionInCurrentAudiobook");
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    -[BKAudiobookSkipController _sendWillWillBeginSkippingObserverCallbacksWithDirection:](self, "_sendWillWillBeginSkippingObserverCallbacksWithDirection:", a3);
    -[BKAudiobookSkipController _pushTemporaryTimeInterval:skipDirection:](self, "_pushTemporaryTimeInterval:skipDirection:", -[BKAudiobookSkipController direction](self, "direction"), a4);
    v12 = v11;
    -[BKAudiobookSkipController _processSkipEvent](self, "_processSkipEvent");
    -[BKAudiobookSkipController _popToStashedTimeInterval:skipDirection:](self, "_popToStashedTimeInterval:skipDirection:", -[BKAudiobookSkipController direction](self, "direction"), v12);
    -[BKAudiobookSkipController _sendDidEndSkippingObserverCallbacks](self, "_sendDidEndSkippingObserverCallbacks");
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
  }
  else
  {
    v13 = BKAudiobooksSkipControllerLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_219F8();

  }
  return v9;
}

- (BOOL)startSeek:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id WeakRetained;
  id v10;
  float v11;
  float playbackRateBeforeSeek;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  float v17;
  id v18;
  double v19;
  _DWORD v21[2];

  v5 = BKAudiobooksSkipControllerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "startSeek: %d", (uint8_t *)v21, 8u);
  }

  v7 = -[BKAudiobookSkipController _canStartSeek](self, "_canStartSeek");
  if (v7)
  {
    -[BKAudiobookSkipController _cancelSeek](self, "_cancelSeek");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController audiobookControls](self, "audiobookControls"));
    objc_msgSend(v8, "positionInCurrentAudiobook");
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    -[BKAudiobookSkipController setSeeking:](self, "setSeeking:", 1);
    -[BKAudiobookSkipController setDirection:](self, "setDirection:", a3);
    -[BKAudiobookSkipController _sendWillWillBeginSeekingObserverCallbacksWithDirection:](self, "_sendWillWillBeginSeekingObserverCallbacksWithDirection:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", objc_msgSend(WeakRetained, "isPlaying"));

    v10 = objc_loadWeakRetained((id *)&self->_audiobookControls);
    objc_msgSend(v10, "playbackRate");
    self->_playbackRateBeforeSeek = v11;

    playbackRateBeforeSeek = self->_playbackRateBeforeSeek;
    if (playbackRateBeforeSeek == 0.0)
      playbackRateBeforeSeek = 1.0;
    v13 = playbackRateBeforeSeek;
    if (a3 == 1)
      -[BKAudiobookSkipController forwardSeekSpeedMultiplier](self, "forwardSeekSpeedMultiplier");
    else
      -[BKAudiobookSkipController backwardSeekSpeedMultiplier](self, "backwardSeekSpeedMultiplier");
    v17 = v14 * v13;
    v18 = objc_loadWeakRetained((id *)&self->_audiobookControls);
    *(float *)&v19 = v17;
    objc_msgSend(v18, "setPlaybackRate:", v19);

    -[BKAudiobookSkipController seekSampleTime](self, "seekSampleTime");
    -[BKAudiobookSkipController _scheduleSeekTimerWithInterval:](self, "_scheduleSeekTimerWithInterval:");
  }
  else
  {
    v15 = BKAudiobooksSkipControllerLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21A24();

  }
  return v7;
}

- (BOOL)endSeek
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  float playbackRateBeforeSeek;
  id WeakRetained;
  double v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = BKAudiobooksSkipControllerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "endSeek", v13, 2u);
  }

  v5 = -[BKAudiobookSkipController _canEndSeek](self, "_canEndSeek");
  if (v5)
  {
    -[BKAudiobookSkipController _cancelSeek](self, "_cancelSeek");
    playbackRateBeforeSeek = self->_playbackRateBeforeSeek;
    WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    *(float *)&v8 = playbackRateBeforeSeek;
    objc_msgSend(WeakRetained, "setPlaybackRate:", v8);

    if (-[BKAudiobookSkipController wasPlaying](self, "wasPlaying"))
    {
      v9 = objc_loadWeakRetained((id *)&self->_audiobookControls);
      objc_msgSend(v9, "play");

    }
    -[BKAudiobookSkipController _sendDidEndSeekingObserverCallbacks](self, "_sendDidEndSeekingObserverCallbacks");
    -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", 0);
    -[BKAudiobookSkipController setSeeking:](self, "setSeeking:", 0);
  }
  else
  {
    v10 = BKAudiobooksSkipControllerLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21A50();

  }
  return v5;
}

- (void)endSeekIfSeeking
{
  if (-[BKAudiobookSkipController isSeeking](self, "isSeeking"))
    -[BKAudiobookSkipController endSeek](self, "endSeek");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_class(NSNumber);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v15 = BUDynamicCast(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (off_44948 == a6)
  {
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      -[BKAudiobookSkipController setForwardSkipTime:](self, "setForwardSkipTime:");
    }
  }
  else if (off_44950 == a6)
  {
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      -[BKAudiobookSkipController setBackwardSkipTime:](self, "setBackwardSkipTime:");
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)BKAudiobookSkipController;
    -[BKAudiobookSkipController observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)updateSkipInterval
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "doubleForKey:", CFSTR("BKAudioBookSkipForward"));
  -[BKAudiobookSkipController setForwardSkipTime:](self, "setForwardSkipTime:");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("BKAudioBookSkipBackward"));
  -[BKAudiobookSkipController setBackwardSkipTime:](self, "setBackwardSkipTime:");

}

- (void)reset
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BKAudiobooksSkipControllerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "reset", v5, 2u);
  }

  if (-[BKAudiobookSkipController isSkipping](self, "isSkipping"))
  {
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    -[BKAudiobookSkipController _sendDidEndSkippingObserverCallbacks](self, "_sendDidEndSkippingObserverCallbacks");
    -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", 0);
    -[BKAudiobookSkipController setSkipping:](self, "setSkipping:", 0);
  }
  else if (-[BKAudiobookSkipController isSeeking](self, "isSeeking"))
  {
    -[BKAudiobookSkipController endSeek](self, "endSeek");
  }
  -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:", 0.0);
}

- (BOOL)wasPlayingBeforeSkipSeek
{
  _BOOL4 v3;

  v3 = -[BKAudiobookSkipController isSkipping](self, "isSkipping");
  if (v3)
    LOBYTE(v3) = -[BKAudiobookSkipController wasPlaying](self, "wasPlaying");
  return v3;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController observers](self, "observers"));
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController observers](self, "observers"));
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  void *v5;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController observers](self, "observers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (double)baseEventInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accelerationMap, "objectForKeyedSubscript:", &off_3A0F8));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setBaseEventInterval:(double)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accelerationMap, "objectForKeyedSubscript:", &off_3A0F8));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accelerationMap, "setObject:forKeyedSubscript:", v8, &off_3A0F8);

  }
}

- (void)clearAccelerationStops
{
  double v3;
  double v4;

  -[BKAudiobookSkipController baseEventInterval](self, "baseEventInterval");
  v4 = v3;
  -[NSMutableDictionary removeAllObjects](self->_accelerationMap, "removeAllObjects");
  -[BKAudiobookSkipController setBaseEventInterval:](self, "setBaseEventInterval:", v4);
}

- (void)accelerateToInterval:(double)a3 afterEventCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  NSMutableDictionary *accelerationMap;
  void *v12;
  id v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_accelerationMap, "allKeys"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
  v9 = (char *)objc_msgSend(v8, "unsignedIntegerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  accelerationMap = self->_accelerationMap;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v9[a4]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](accelerationMap, "setObject:forKeyedSubscript:", v10, v12);

}

- (double)deltaFromStartingPoint:(double)a3
{
  id WeakRetained;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
  objc_msgSend(WeakRetained, "positionInCurrentAudiobook");
  v6 = v5 - a3;

  return v6;
}

- (BOOL)_canStartSkip
{
  return !self->_skipping && !self->_seeking;
}

- (BOOL)_canStartSeek
{
  return !self->_skipping && !self->_seeking;
}

- (void)_cancelSkip
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController skipDispatchSource](self, "skipDispatchSource"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController skipDispatchSource](self, "skipDispatchSource"));
    dispatch_source_cancel(v4);

    -[BKAudiobookSkipController setSkipDispatchSource:](self, "setSkipDispatchSource:", 0);
  }
}

- (void)_cancelSeek
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController seekDispatchSource](self, "seekDispatchSource"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController seekDispatchSource](self, "seekDispatchSource"));
    dispatch_source_cancel(v4);

    -[BKAudiobookSkipController setSeekDispatchSource:](self, "setSeekDispatchSource:", 0);
  }
}

- (void)_scheduleSkipTimerWithInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  -[BKAudiobookSkipController setSkipDispatchSource:](self, "setSkipDispatchSource:", v5);
  objc_initWeak(&location, self);
  dispatch_source_set_timer(v5, 0, (unint64_t)(a3 * 1000000000.0), (unint64_t)(a3 / 10.0 * 1000000000.0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_113CC;
  v6[3] = &unk_38850;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume(v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_processSkipEvent
{
  double v3;
  double v4;
  unint64_t v5;
  BKAudiobookControls **p_audiobookControls;
  double forwardSkipTime;
  id WeakRetained;
  float v9;
  double v10;
  double backwardSkipTime;
  float v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  ++self->_skipStepCount;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController audiobookControls](self, "audiobookControls"));
  objc_msgSend(v23, "positionInCurrentAudiobook");
  v4 = v3;
  v5 = -[BKAudiobookSkipController direction](self, "direction");
  p_audiobookControls = &self->_audiobookControls;
  if (v5 == 1)
  {
    forwardSkipTime = self->_forwardSkipTime;
    WeakRetained = objc_loadWeakRetained((id *)p_audiobookControls);
    objc_msgSend(WeakRetained, "playbackRate");
    v10 = v4 + forwardSkipTime * v9;
  }
  else
  {
    backwardSkipTime = self->_backwardSkipTime;
    WeakRetained = objc_loadWeakRetained((id *)p_audiobookControls);
    objc_msgSend(WeakRetained, "playbackRate");
    v10 = v4 - backwardSkipTime * v12;
  }

  objc_msgSend(v23, "durationOfCurrentAudiobook");
  v14 = v13 + -0.01;
  if (v14 >= v10)
    v14 = v10;
  objc_msgSend(v23, "movePositionInCurrentAudiobook:completion:", 0, fmax(v14, 0.0));
  -[BKAudiobookSkipController skipStartAudiobookTime](self, "skipStartAudiobookTime");
  -[BKAudiobookSkipController deltaFromStartingPoint:](self, "deltaFromStartingPoint:");
  -[BKAudiobookSkipController _sendUpdatedCumulativeDeltaCallbacks:](self, "_sendUpdatedCumulativeDeltaCallbacks:");
  if (-[BKAudiobookSkipController playSkipSoundEffect](self, "playSkipSoundEffect") && self->_skipStepCount >= 2)
  {
    -[AVAudioPlayer setCurrentTime:](self->_fxPlayer, "setCurrentTime:", 0.0);
    -[AVAudioPlayer play](self->_fxPlayer, "play");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController accelerationMap](self, "accelerationMap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_skipStepCount));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));

  if (v17)
  {
    -[BKAudiobookSkipController _cancelSkip](self, "_cancelSkip");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController accelerationMap](self, "accelerationMap"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_skipStepCount));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    -[BKAudiobookSkipController _scheduleSkipTimerWithInterval:](self, "_scheduleSkipTimerWithInterval:", v22);
  }

}

- (double)_pushTemporaryTimeInterval:(double)a3 skipDirection:(unint64_t)a4
{
  double v4;
  uint64_t v5;

  if (a4 == 1)
  {
    v5 = 24;
  }
  else
  {
    v4 = 0.0;
    if (a4)
      return v4;
    v5 = 32;
  }
  v4 = *(double *)((char *)&self->super.isa + v5);
  if (a3 == 0.0)
    a3 = *(double *)((char *)&self->super.isa + v5);
  *(double *)((char *)&self->super.isa + v5) = a3;
  return v4;
}

- (void)_popToStashedTimeInterval:(double)a3 skipDirection:(unint64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
  {
    v4 = 24;
  }
  else
  {
    if (a4)
      return;
    v4 = 32;
  }
  *(double *)((char *)&self->super.isa + v4) = a3;
}

- (void)_scheduleSeekTimerWithInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  -[BKAudiobookSkipController setSeekDispatchSource:](self, "setSeekDispatchSource:", v5);
  objc_initWeak(&location, self);
  dispatch_source_set_timer(v5, 0, (unint64_t)(a3 * 1000000000.0), (unint64_t)(a3 / 10.0 * 1000000000.0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_11720;
  v6[3] = &unk_38850;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume(v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_seekTimerFired
{
  -[BKAudiobookSkipController _processSeekEvent](self, "_processSeekEvent");
}

- (void)_processSeekEvent
{
  double v3;
  double v4;
  unint64_t v5;
  double seekDelta;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController audiobookControls](self, "audiobookControls"));
  objc_msgSend(v10, "positionInCurrentAudiobook");
  v4 = v3;
  v5 = -[BKAudiobookSkipController direction](self, "direction");
  seekDelta = self->_seekDelta;
  if (v5 != 1)
    seekDelta = -seekDelta;
  v7 = v4 + seekDelta;
  objc_msgSend(v10, "durationOfCurrentAudiobook");
  v9 = v8 + -0.01;
  if (v9 >= v7)
    v9 = v7;
  objc_msgSend(v10, "movePositionInCurrentAudiobook:completion:", 0, fmax(v9, 0.0));

}

- (void)_sendWillWillBeginSkippingObserverCallbacksWithDirection:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "skipController:willBeginSkippingInDirection:") & 1) != 0)
          objc_msgSend(v10, "skipController:willBeginSkippingInDirection:", self, a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sendDidEndSkippingObserverCallbacks
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "skipControllerDidEndSkipping:actionSource:") & 1) != 0)
          objc_msgSend(v8, "skipControllerDidEndSkipping:actionSource:", self, -[BKAudiobookSkipController actionSource](self, "actionSource"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendWillPauseObserverCallbacks
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "skipControllerWillPausePlayback:") & 1) != 0)
          objc_msgSend(v8, "skipControllerWillPausePlayback:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendUpdatedCumulativeDeltaCallbacks:(double)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "skipController:updatedCumulativeDelta:") & 1) != 0)
          objc_msgSend(v10, "skipController:updatedCumulativeDelta:", self, a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sendWillWillBeginSeekingObserverCallbacksWithDirection:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "skipController:willBeginSeekingInDirection:") & 1) != 0)
          objc_msgSend(v10, "skipController:willBeginSeekingInDirection:", self, a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sendDidEndSeekingObserverCallbacks
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "skipControllerDidEndSeeking:") & 1) != 0)
          objc_msgSend(v8, "skipControllerDidEndSeeking:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendSkipControllerSettingsDidChange
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSkipController allObservers](self, "allObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "skipControllerSettingsDidChange:") & 1) != 0)
          objc_msgSend(v8, "skipControllerSettingsDidChange:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)isSkipping
{
  return self->_skipping;
}

- (void)setSkipping:(BOOL)a3
{
  self->_skipping = a3;
}

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (double)forwardSkipTime
{
  return self->_forwardSkipTime;
}

- (double)backwardSkipTime
{
  return self->_backwardSkipTime;
}

- (double)seekDelta
{
  return self->_seekDelta;
}

- (void)setSeekDelta:(double)a3
{
  self->_seekDelta = a3;
}

- (double)seekSampleTime
{
  return self->_seekSampleTime;
}

- (void)setSeekSampleTime:(double)a3
{
  self->_seekSampleTime = a3;
}

- (double)forwardSeekSpeedMultiplier
{
  return self->_forwardSeekSpeedMultiplier;
}

- (void)setForwardSeekSpeedMultiplier:(double)a3
{
  self->_forwardSeekSpeedMultiplier = a3;
}

- (double)backwardSeekSpeedMultiplier
{
  return self->_backwardSeekSpeedMultiplier;
}

- (void)setBackwardSeekSpeedMultiplier:(double)a3
{
  self->_backwardSeekSpeedMultiplier = a3;
}

- (BOOL)playSkipSoundEffect
{
  return self->_playSkipSoundEffect;
}

- (void)setPlaySkipSoundEffect:(BOOL)a3
{
  self->_playSkipSoundEffect = a3;
}

- (BKAudiobookControls)audiobookControls
{
  return (BKAudiobookControls *)objc_loadWeakRetained((id *)&self->_audiobookControls);
}

- (void)setAudiobookControls:(id)a3
{
  objc_storeWeak((id *)&self->_audiobookControls, a3);
}

- (AVAudioPlayer)fxPlayer
{
  return self->_fxPlayer;
}

- (void)setFxPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_fxPlayer, a3);
}

- (OS_dispatch_source)skipDispatchSource
{
  return self->_skipDispatchSource;
}

- (void)setSkipDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_skipDispatchSource, a3);
}

- (OS_dispatch_source)seekDispatchSource
{
  return self->_seekDispatchSource;
}

- (void)setSeekDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_seekDispatchSource, a3);
}

- (unint64_t)skipStepCount
{
  return self->_skipStepCount;
}

- (void)setSkipStepCount:(unint64_t)a3
{
  self->_skipStepCount = a3;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)actionSource
{
  return self->_actionSource;
}

- (void)setActionSource:(unint64_t)a3
{
  self->_actionSource = a3;
}

- (double)skipStartAudiobookTime
{
  return self->_skipStartAudiobookTime;
}

- (void)setSkipStartAudiobookTime:(double)a3
{
  self->_skipStartAudiobookTime = a3;
}

- (float)playbackRateBeforeSeek
{
  return self->_playbackRateBeforeSeek;
}

- (void)setPlaybackRateBeforeSeek:(float)a3
{
  self->_playbackRateBeforeSeek = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableDictionary)accelerationMap
{
  return self->_accelerationMap;
}

- (void)setAccelerationMap:(id)a3
{
  objc_storeStrong((id *)&self->_accelerationMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerationMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_seekDispatchSource, 0);
  objc_storeStrong((id *)&self->_skipDispatchSource, 0);
  objc_storeStrong((id *)&self->_fxPlayer, 0);
  objc_destroyWeak((id *)&self->_audiobookControls);
}

@end
