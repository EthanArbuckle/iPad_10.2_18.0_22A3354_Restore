@implementation BKAudiobookSleepTimer

+ (id)defaultTimer
{
  if (qword_44EA0 != -1)
    dispatch_once(&qword_44EA0, &stru_39038);
  return (id)qword_44E98;
}

- (BOOL)isActive
{
  double v2;

  -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
  return v2 > 0.0 || v2 == -1000.0;
}

- (BOOL)expiresAtChapterEnd
{
  double v2;

  -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
  return v2 == -1000.0;
}

- (void)setUpdateInterval:(double)a3
{
  NSTimer *sleepTimer;
  NSTimer *v6;
  NSTimer *v7;

  if (self->_updateInterval != a3)
  {
    self->_updateInterval = a3;
    sleepTimer = self->_sleepTimer;
    if (sleepTimer)
    {
      -[NSTimer invalidate](sleepTimer, "invalidate");
      v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_sleepTimer:", 0, 1, a3));
      v7 = self->_sleepTimer;
      self->_sleepTimer = v6;

    }
  }
}

- (void)setFixedTimerWithDuration:(double)a3
{
  void *v5;
  char *v6;

  -[BKAudiobookSleepTimer invalidate](self, "invalidate");
  self->_initialDuration = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer audiobookControls](self, "audiobookControls"));
  v6 = (char *)objc_msgSend(v5, "state");

  if (v6 == (_BYTE *)&dword_0 + 2)
    -[BKAudiobookSleepTimer _setTimer](self, "_setTimer");
  else
    -[BKAudiobookSleepTimer setWaitingForPlayerStatePlaying:](self, "setWaitingForPlayerStatePlaying:", 1);
  -[BKAudiobookSleepTimer _notifyObserversTimerEnabled](self, "_notifyObserversTimerEnabled");
}

- (void)setChapterFinishedTimer
{
  NSDate *v3;
  NSDate *sleepStartDate;

  -[BKAudiobookSleepTimer invalidate](self, "invalidate");
  self->_initialDuration = -1000.0;
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  sleepStartDate = self->_sleepStartDate;
  self->_sleepStartDate = v3;

  self->_lastSentRemainingTime = 2.22507386e-308;
  -[BKAudiobookSleepTimer _notifyObserversTimerEnabled](self, "_notifyObserversTimerEnabled");
}

- (BKAudiobookSleepTimer)init
{
  BKAudiobookSleepTimer *v2;
  BKAudiobookSleepTimer *v3;
  uint64_t v4;
  NSDate *sleepStartDate;
  uint64_t v6;
  NSHashTable *observers;
  BKAudiobookControls *v8;
  BKAudiobookControls *audiobookControls;
  BKAudiobookControls *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKAudiobookSleepTimer;
  v2 = -[BKAudiobookSleepTimer init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastSentRemainingTime = 2.22507386e-308;
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    sleepStartDate = v3->_sleepStartDate;
    v3->_sleepStartDate = (NSDate *)v4;

    *(_OWORD *)&v3->_updateInterval = xmmword_2ACD0;
    v3->_accessLock._os_unfair_lock_opaque = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

    v8 = (BKAudiobookControls *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    audiobookControls = v3->_audiobookControls;
    v3->_audiobookControls = v8;
    v10 = v8;

    -[BKAudiobookControls addObserver:](v10, "addObserver:", v3);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  -[BKAudiobookSleepTimer invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookSleepTimer;
  -[BKAudiobookSleepTimer dealloc](&v4, "dealloc");
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  BKAudiobookSleepTimer *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[BKAudiobookSleepTimer _expiresAtChapterEnd](self, "_expiresAtChapterEnd"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16A28;
    block[3] = &unk_39060;
    v9 = v7;
    v10 = self;
    v11 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    -[BKAudiobookSleepTimer _expired](self, "_expired");

  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[16];

  v7 = a3;
  if (a5 == 4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16C80;
    block[3] = &unk_38710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (a5 == 2)
  {
    if (-[BKAudiobookSleepTimer waitingForPlayerStatePlaying](self, "waitingForPlayerStatePlaying"))
    {
      -[BKAudiobookSleepTimer setWaitingForPlayerStatePlaying:](self, "setWaitingForPlayerStatePlaying:", 0);
      -[BKAudiobookSleepTimer _setTimer](self, "_setTimer");
    }
    else if (-[BKAudiobookSleepTimer waitingForPlayerStatePlayingThenPause](self, "waitingForPlayerStatePlayingThenPause"))
    {
      v8 = BKAudiobooksSleepTimerLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Player state has just returned to Playing; pausing to respect a chapter-end expired timer",
          buf,
          2u);
      }

      -[BKAudiobookSleepTimer setWaitingForPlayerStatePlayingThenPause:](self, "setWaitingForPlayerStatePlayingThenPause:", 0);
      objc_msgSend(v7, "pause");
    }
  }

}

- (void)invalidate
{
  -[BKAudiobookSleepTimer _invalidateAllowingCancelNotification:](self, "_invalidateAllowingCancelNotification:", 1);
}

- (int64_t)sleepTimerOption
{
  int64_t v3;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  if (!-[BKAudiobookSleepTimer isActive](self, "isActive"))
    return 0;
  if (-[BKAudiobookSleepTimer expiresAtChapterEnd](self, "expiresAtChapterEnd"))
    return 1;
  -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
  v6 = v5;
  v3 = 2;
  +[BKAudiobookSleepTimer sleepTimerDurationFrom:](BKAudiobookSleepTimer, "sleepTimerDurationFrom:", 2);
  if (vabdd_f64(v6, v7) >= 0.00999999978)
  {
    v8 = 2;
    v3 = 8;
    do
    {
      +[BKAudiobookSleepTimer sleepTimerDurationFrom:](BKAudiobookSleepTimer, "sleepTimerDurationFrom:", v8);
      v10 = v9;
      -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
      if (vabdd_f64(v11, v10) < 0.00999999978)
        v3 = v8;
      ++v8;
    }
    while (v8 != 8);
  }
  return v3;
}

- (void)setSleepTimerOption:(int64_t)a3
{
  if (a3 != 8)
  {
    if (a3 == 1)
    {
      -[BKAudiobookSleepTimer setChapterFinishedTimer](self, "setChapterFinishedTimer");
    }
    else if (a3)
    {
      +[BKAudiobookSleepTimer sleepTimerDurationFrom:](BKAudiobookSleepTimer, "sleepTimerDurationFrom:");
      -[BKAudiobookSleepTimer setFixedTimerWithDuration:](self, "setFixedTimerWithDuration:");
    }
    else
    {
      -[BKAudiobookSleepTimer invalidate](self, "invalidate");
    }
  }
}

+ (double)sleepTimerDurationFrom:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 2) <= 5)
    return dbl_2ACE0[a3 - 2];
  return result;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer observers](self, "observers"));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer observers](self, "observers"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer observers](self, "observers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (BOOL)_expiresAtChapterEnd
{
  double v2;

  -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
  return v2 == -1000.0;
}

- (void)_sleepTimer:(id)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  double v14;

  if (-[BKAudiobookSleepTimer _expiresAtChapterEnd](self, "_expiresAtChapterEnd", a3))
  {
    v4 = 0.0;
LABEL_5:
    -[BKAudiobookSleepTimer _notifyObserversRemainingTimeUpdated:](self, "_notifyObserversRemainingTimeUpdated:", v4);
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_sleepStartDate);
  v7 = v6;

  -[BKAudiobookSleepTimer initialDuration](self, "initialDuration");
  v9 = v8;
  if (v7 < v8)
  {
    v4 = v8 - v7;
    goto LABEL_5;
  }
  v10 = BKAudiobooksSleepTimerLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Sleep timer expired after %lfs.  Pausing playback", (uint8_t *)&v13, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer audiobookControls](self, "audiobookControls"));
  objc_msgSend(v12, "pause");

  -[BKAudiobookSleepTimer _expired](self, "_expired");
}

- (void)_expired
{
  -[BKAudiobookSleepTimer _invalidateAllowingCancelNotification:](self, "_invalidateAllowingCancelNotification:", 0);
  -[BKAudiobookSleepTimer _notifyObserversTimerExpired](self, "_notifyObserversTimerExpired");
}

- (void)_notifyObserversTimerEnabled
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer allObservers](self, "allObservers", 0));
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
        if ((objc_opt_respondsToSelector(v8, "sleepTimerEnabled:") & 1) != 0)
          objc_msgSend(v8, "sleepTimerEnabled:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversTimerExpired
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer allObservers](self, "allObservers", 0));
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
        if ((objc_opt_respondsToSelector(v8, "sleepTimerDidExpire:") & 1) != 0)
          objc_msgSend(v8, "sleepTimerDidExpire:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversTimerCanceled
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer allObservers](self, "allObservers", 0));
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
        if ((objc_opt_respondsToSelector(v8, "sleepTimerCanceled:") & 1) != 0)
          objc_msgSend(v8, "sleepTimerCanceled:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversRemainingTimeUpdated:(double)a3
{
  double v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[BKAudiobookSleepTimer lastSentRemainingTime](self, "lastSentRemainingTime");
  if (vabdd_f64(a3, v5) >= 0.01)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer allObservers](self, "allObservers", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v11, "sleepTimer:remainingTimeDidUpdate:") & 1) != 0)
            objc_msgSend(v11, "sleepTimer:remainingTimeDidUpdate:", self, a3);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[BKAudiobookSleepTimer setLastSentRemainingTime:](self, "setLastSentRemainingTime:", a3);
  }
}

- (void)_invalidateAllowingCancelNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSTimer *sleepTimer;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSleepTimer sleepTimer](self, "sleepTimer"));

  if (v5)
  {
    -[NSTimer invalidate](self->_sleepTimer, "invalidate");
    sleepTimer = self->_sleepTimer;
    self->_sleepTimer = 0;

  }
  if (self->_initialDuration != -2000.0)
  {
    self->_initialDuration = -2000.0;
    if (!v3)
      return;
LABEL_8:
    -[BKAudiobookSleepTimer _notifyObserversTimerCanceled](self, "_notifyObserversTimerCanceled");
    return;
  }
  if (v5 && v3)
    goto LABEL_8;
}

- (void)_setTimer
{
  NSDate *v3;
  NSDate *sleepStartDate;
  NSTimer *v5;
  NSTimer *sleepTimer;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  sleepStartDate = self->_sleepStartDate;
  self->_sleepStartDate = v3;

  self->_lastSentRemainingTime = 2.22507386e-308;
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_sleepTimer:", 0, 1, self->_updateInterval));
  sleepTimer = self->_sleepTimer;
  self->_sleepTimer = v5;

}

- (BKAudiobookControls)audiobookControls
{
  return self->_audiobookControls;
}

- (void)setAudiobookControls:(id)a3
{
  objc_storeStrong((id *)&self->_audiobookControls, a3);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (double)initialDuration
{
  return self->_initialDuration;
}

- (void)setInitialDuration:(double)a3
{
  self->_initialDuration = a3;
}

- (double)lastSentRemainingTime
{
  return self->_lastSentRemainingTime;
}

- (void)setLastSentRemainingTime:(double)a3
{
  self->_lastSentRemainingTime = a3;
}

- (NSDate)sleepStartDate
{
  return self->_sleepStartDate;
}

- (void)setSleepStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStartDate, a3);
}

- (NSTimer)sleepTimer
{
  return self->_sleepTimer;
}

- (void)setSleepTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sleepTimer, a3);
}

- (BOOL)waitingForPlayerStatePlaying
{
  return self->_waitingForPlayerStatePlaying;
}

- (void)setWaitingForPlayerStatePlaying:(BOOL)a3
{
  self->_waitingForPlayerStatePlaying = a3;
}

- (BOOL)waitingForPlayerStatePlayingThenPause
{
  return self->_waitingForPlayerStatePlayingThenPause;
}

- (void)setWaitingForPlayerStatePlayingThenPause:(BOOL)a3
{
  self->_waitingForPlayerStatePlayingThenPause = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepTimer, 0);
  objc_storeStrong((id *)&self->_sleepStartDate, 0);
  objc_storeStrong((id *)&self->_audiobookControls, 0);
}

@end
