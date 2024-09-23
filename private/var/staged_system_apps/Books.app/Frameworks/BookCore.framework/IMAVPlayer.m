@implementation IMAVPlayer

- (IMAVPlayer)init
{
  IMAVPlayer *v2;
  IMAVPlayer *v3;
  IMVideoView *v4;
  IMVideoView *videoView;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMAVPlayer;
  v2 = -[IMAVPlayer init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_volume = 1065353216;
    v2->_playbackPending = 0;
    v2->_wasPlaying = 0;
    *(_QWORD *)&v2->_state = 0x3F80000000000000;
    v2->_scale = 0;
    v4 = -[IMVideoView initWithFrame:]([IMVideoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    videoView = v3->_videoView;
    v3->_videoView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMVideoView setBackgroundColor:](v3->_videoView, "setBackgroundColor:", v6);

    -[IMVideoView setPlayer:](v3->_videoView, "setPlayer:", v3);
    *(_OWORD *)&v3->_seekStep = xmmword_26A650;
    *(_WORD *)&v3->_usesExternalPlaybackWhileExternalScreenIsActive = 257;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = kBKPlayerPlaybackWasInterruptedNotification[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "playbackWasPaused:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "onInterruption:", AVAudioSessionInterruptionNotification, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "onRouteChange:", AVAudioSessionRouteChangeNotification, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "resetPlayer:", AVAudioSessionMediaServicesWereResetNotification, v12);

    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "playerItemDidReachEnd:", AVPlayerItemDidPlayToEndTimeNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "onScreenConnection:", UIScreenDidConnectNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "onScreenDisconnection:", UIScreenDidDisconnectNotification, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v3, IMAVPlayerDefaults_ClosedCaptioning, 1, off_309C00);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSTimer *hdcpTimer;
  NSTimer *seekTimer;
  objc_super v12;

  -[IMAVPlayer stop](self, "stop");
  -[IMAVPlayer setPlayer:](self, "setPlayer:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = kBKPlayerPlaybackWasInterruptedNotification[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionInterruptionNotification, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionRouteChangeNotification, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionMediaServicesWereResetNotification, v8);

  objc_msgSend(v3, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIScreenDidConnectNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIScreenDidDisconnectNotification, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, IMAVPlayerDefaults_ClosedCaptioning, off_309C00);

  -[IMAVPlayer clearEndTimeObserver](self, "clearEndTimeObserver");
  -[IMAVPlayer removeAllTimeObservers](self, "removeAllTimeObservers");
  -[IMAVPlayer removePeriodicTimeObserver](self, "removePeriodicTimeObserver");
  -[IMAVPlayer setAsset:](self, "setAsset:", 0);
  -[IMVideoView setPlayer:](self->_videoView, "setPlayer:", 0);
  -[IMAVPlayer clearExternalDisplay](self, "clearExternalDisplay");
  -[NSTimer invalidate](self->_hdcpTimer, "invalidate");
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  -[NSTimer invalidate](self->_seekTimer, "invalidate");
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  v12.receiver = self;
  v12.super_class = (Class)IMAVPlayer;
  -[IMAVPlayer dealloc](&v12, "dealloc");
}

- (id)_stringFromState:(int)a3
{
  uint64_t v4;

  if (qword_30DC70 != -1)
    dispatch_once(&qword_30DC70, &stru_2908C0);
  if (a3 >= 4)
    v4 = 0;
  else
    v4 = a3;
  return objc_msgSend((id)qword_30DC68, "objectAtIndexedSubscript:", v4);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[IMAVPlayer currentTime](self, "currentTime");
  v7 = v6;
  -[IMAVPlayer duration](self, "duration");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer _stringFromState:](self, "_stringFromState:", -[IMAVPlayer state](self, "state")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p t=%.1lf/%.1lf state=%@>"), v5, self, v7, v9, v10));

  return v11;
}

- (void)setAsset:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v5 = a3;
  if ((-[AVAsset isEqual:](self->_asset, "isEqual:", v5) & 1) == 0)
  {
    v6 = BCAVPlayerLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138477827;
      v11 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "setAssetURL: asset=%{private}@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)&self->_asset, a3);
    v8 = BCAVPlayerLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "setAsset %@", (uint8_t *)&v10, 0xCu);
    }

    -[IMAVPlayer updatePlayer](self, "updatePlayer");
  }

}

- (void)setAssetURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer assetURL](self, "assetURL"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = BCAVPlayerLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138477827;
      v11 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "setAssetURL: assetURL=%{private}@", (uint8_t *)&v10, 0xCu);
    }

    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v4, 0));
      -[IMAVPlayer setAsset:](self, "setAsset:", v9);

    }
    else
    {
      -[IMAVPlayer setAsset:](self, "setAsset:", 0);
    }
  }

}

- (void)setAssetURL:(id)a3 withStartTime:(double)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  id v12;
  __int16 v13;
  double v14;

  v6 = a3;
  v7 = BCAVPlayerLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138478083;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "setAssetURL:withStateTime: assetURL=%{private}@ time=%.1lf", (uint8_t *)&v11, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer assetURL](self, "assetURL"));
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    self->_preloadingTime = a4;
    -[IMAVPlayer setAssetURL:](self, "setAssetURL:", v6);
  }

}

- (NSURL)assetURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer currentItem](self, "currentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asset"));

  v4 = objc_opt_class(AVURLAsset);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  else
    v5 = 0;

  return (NSURL *)v5;
}

- (AVPlayerItem)currentItem
{
  return -[AVPlayer currentItem](self->_player, "currentItem");
}

- (void)_playWithRate:(float)a3 fadeInTime:(double)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  char *v10;
  double v11;
  BOOL v12;
  AVPlayer *player;
  _QWORD v14[6];
  float v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;

  v7 = BCAVPlayerLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "_playWithRate:fadeInTime: playbackRate=%.1f duration=%.1lf", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  v10 = (char *)objc_msgSend(v9, "status");

  if (v10 == (_BYTE *)&dword_0 + 1)
  {
    -[IMAVPlayer updateTimeObservers](self, "updateTimeObservers");
    v11 = fabs(a4);
    if (v11 >= 0.00999999978)
    {
      player = self->_player;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_C3778;
      v14[3] = &unk_2908E8;
      v14[4] = self;
      v15 = a3;
      *(double *)&v14[5] = a4;
      -[AVPlayer prerollAtRate:completionHandler:](player, "prerollAtRate:completionHandler:", v14, COERCE_DOUBLE((unint64_t)LODWORD(a3)));
    }
    else
    {
      *(float *)&v11 = self->_playbackRate;
      -[AVPlayer setRate:](self->_player, "setRate:", v11);
    }
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  self->_playbackPending = v12;
}

- (void)play
{
  id v3;
  NSObject *v4;
  double v5;
  uint8_t v6[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "play", v6, 2u);
  }

  *(float *)&v5 = self->_playbackRate;
  -[IMAVPlayer _playWithRate:fadeInTime:](self, "_playWithRate:fadeInTime:", v5, 0.0);
}

- (void)playFrom:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  AVPlayer *player;
  __int128 v10;
  CMTimeEpoch v11;
  _QWORD v12[6];
  CMTime v13;
  uint8_t buf[16];
  CMTimeEpoch epoch;

  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "play from %f", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  if (objc_msgSend(v7, "status") == (char *)&dword_0 + 1)
  {

LABEL_6:
    player = self->_player;
    CMTimeMakeWithSeconds(&v13, a3, 1000000000);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_C39C8;
    v12[3] = &unk_28BA28;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    *(_OWORD *)buf = *(_OWORD *)&kCMTimePositiveInfinity.value;
    epoch = kCMTimePositiveInfinity.epoch;
    v10 = *(_OWORD *)buf;
    v11 = epoch;
    -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v13, buf, &v10, v12);
    return;
  }
  v8 = -[AVPlayer isExternalPlaybackActive](self->_player, "isExternalPlaybackActive");

  if ((v8 & 1) != 0)
    goto LABEL_6;
  self->_playbackPending = 1;
  self->_lastSeekingTime = a3;
}

- (void)pause
{
  id v3;
  NSObject *v4;
  double v5;
  uint8_t v6[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "pause", v6, 2u);
  }

  LODWORD(v5) = 0;
  -[AVPlayer setRate:](self->_player, "setRate:", v5);
  self->_playbackPending = 0;
  self->_wasPlaying = 0;
}

- (void)stop
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  double v8;
  AVPlayer *player;
  CMTime v15;
  uint8_t buf[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "stop", buf, 2u);
  }

  if (self->_player)
  {
    if (-[IMAVPlayer state](self, "state") != 1)
    {
      v5 = BCAVPlayerLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "stop", buf, 2u);
      }

      v7 = -[IMAVPlayer state](self, "state");
      -[IMAVPlayer setState:](self, "setState:", 1);
      -[IMAVPlayer setLoadState:](self, "setLoadState:", 0);
      if (v7 == 3)
      {
        -[IMAVPlayer sendItemStoppedNotification](self, "sendItemStoppedNotification");
      }
      else
      {
        LODWORD(v8) = 0;
        -[AVPlayer setRate:](self->_player, "setRate:", v8);
        -[IMAVPlayer sendItemStoppedNotification](self, "sendItemStoppedNotification");
        player = self->_player;
        CMTimeMakeWithSeconds(&v15, 0.0, 1);
        -[AVPlayer seekToTime:](player, "seekToTime:", &v15);
      }
      -[IMAVPlayer setAsset:](self, "setAsset:", 0);
    }
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&self->_lastSeekingTime = _Q0;
    self->_seeking = 0;
  }
}

- (void)togglePlayPause
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "togglePlayPause", v5, 2u);
  }

  if (-[IMAVPlayer isPlaying](self, "isPlaying"))
    -[IMAVPlayer pause](self, "pause");
  else
    -[IMAVPlayer play](self, "play");
}

- (void)fadeOut:(double)a3
{
  AVPlayer *player;
  double v4;
  CMTime v5;

  player = self->_player;
  CMTimeMakeWithSeconds(&v5, a3, 1000000000);
  LODWORD(v4) = 0;
  -[AVPlayer setRate:withVolumeRampDuration:](player, "setRate:withVolumeRampDuration:", &v5, v4);
}

- (void)startSeek:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  NSTimer *v7;
  NSTimer *seekTimer;
  double v9;
  _DWORD v10[2];

  v3 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "startSeek: forward=%d", (uint8_t *)v10, 8u);
  }

  -[IMAVPlayer endSeek](self, "endSeek");
  self->_skipStepCount = 0;
  self->_seekForward = v3;
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "onSeekTimer:", 0, 1, self->_seekDelay));
  seekTimer = self->_seekTimer;
  self->_seekTimer = v7;

  if (self->_playWhileSeeking)
  {
    LODWORD(v9) = -2.0;
    if (v3)
      *(float *)&v9 = 2.0;
    -[AVPlayer setRate:](self->_player, "setRate:", v9);
    -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
}

- (void)endSeek
{
  id v3;
  NSObject *v4;
  NSTimer *seekTimer;
  uint8_t v6[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "endSeek", v6, 2u);
  }

  -[NSTimer invalidate](self->_seekTimer, "invalidate");
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  if (self->_playWhileSeeking)
    -[IMAVPlayer play](self, "play");
  -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)singleSkip:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "singleSkip: forward=%d", (uint8_t *)v7, 8u);
  }

  self->_seekForward = v3;
  -[IMAVPlayer endSeek](self, "endSeek");
  -[IMAVPlayer onSeekTimer:](self, "onSeekTimer:", 0);
}

- (void)onSeekTimer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  ++self->_skipStepCount;
  if (self->_seekForward)
  {
    -[IMAVPlayer duration](self, "duration", a3);
    v5 = v4;
    -[IMAVPlayer currentTime](self, "currentTime");
    if (v5 >= v6 + self->_seekStep)
    {
      -[IMAVPlayer currentTime](self, "currentTime");
      v7 = v11 + self->_seekStep;
    }
    else
    {
      -[IMAVPlayer duration](self, "duration");
    }
  }
  else
  {
    -[IMAVPlayer currentTime](self, "currentTime", a3);
    v9 = v8 - self->_seekStep;
    v7 = 0.0;
    if (v9 >= 0.0)
    {
      -[IMAVPlayer currentTime](self, "currentTime", 0.0);
      v7 = v10 - self->_seekStep;
    }
  }
  -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", v7);
}

- (void)setPlaybackRate:(float)a3
{
  id v5;
  NSObject *v6;
  double v7;
  int v8;
  double v9;

  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setPlaybackRate: rate=%.1f", (uint8_t *)&v8, 0xCu);
  }

  self->_playbackRate = a3;
  if (-[IMAVPlayer state](self, "state") == 2)
  {
    *(float *)&v7 = self->_playbackRate;
    -[AVPlayer setRate:](self->_player, "setRate:", v7);
    -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
}

- (void)setState:(int)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  int v10;
  void *v11;

  if (self->_state != a3)
  {
    v3 = *(_QWORD *)&a3;
    self->_state = a3;
    v5 = BCAVPlayerLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer _stringFromState:](self, "_stringFromState:", v3));
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setState: state=%{public}@", (uint8_t *)&v10, 0xCu);

    }
    if ((*(_WORD *)&self->_delegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "playerStateChanged:", self);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", IMAVPlayerNotification_StateChanged[0], self);

    -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
}

- (void)setLoadState:(int)a3
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  _DWORD v8[2];

  if (self->_loadState != a3)
  {
    self->_loadState = a3;
    v5 = BCAVPlayerLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setLoadState: loadState=%d", (uint8_t *)v8, 8u);
    }

    if ((*(_WORD *)&self->_delegateFlags & 0x20) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "playerLoadStateChanged:", self);

    }
  }
}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)playbackPending
{
  return self->_playbackPending;
}

- (void)setVolume:(float)a3
{
  id v5;
  NSObject *v6;
  int v7;
  double v8;

  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setVolume: volume=%.1f", (uint8_t *)&v7, 0xCu);
  }

  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[IMAVPlayer updateVolume](self, "updateVolume");
  }
}

- (void)setScale:(int)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[IMAVPlayer updateScale](self, "updateScale");
  }
}

- (BOOL)isVideo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer currentItem](self, "currentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracksWithMediaCharacteristic:", AVMediaCharacteristicVisual));

  LOBYTE(v2) = objc_msgSend(v4, "count") != 0;
  return (char)v2;
}

- (void)setUseFullExternalScreen:(BOOL)a3
{
  void *v4;

  self->_useFullExternalScreen = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView window](self->_videoView, "window"));

  if (v4)
    -[IMAVPlayer updateVideoLayer](self, "updateVideoLayer");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_contextDependentTolerance
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  const CMTime *v5;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[IMAVPlayer optimizePerformanceOverAccuracy](self, "optimizePerformanceOverAccuracy");
  if ((_DWORD)result)
    v5 = &kCMTimePositiveInfinity;
  else
    v5 = &kCMTimeZero;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v5->value;
  retstr->var3 = v5->epoch;
  return result;
}

- (void)updatePlayer
{
  void *v8;
  void *v9;
  void *v10;
  double preloadingTime;
  id v12;
  NSObject *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 usesExternalPlaybackWhileExternalScreenIsActive;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  CMTime v27;
  uint8_t buf[16];
  uint64_t v29;

  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastSeekingTime = _Q0;
  self->_seeking = 0;
  -[IMVideoView setVideoLayer:](self->_videoView, "setVideoLayer:", 0);
  -[IMAVPlayer clearExternalDisplay](self, "clearExternalDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));

  if (v8)
  {
    -[IMAVPlayer setState:](self, "setState:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v9));

    preloadingTime = self->_preloadingTime;
    if (preloadingTime > 0.0)
    {
      v12 = BCAVPlayerLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = self->_preloadingTime;
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "preloading asset to time: %f", buf, 0xCu);
      }

      memset(buf, 0, sizeof(buf));
      v29 = 0;
      -[IMAVPlayer _contextDependentTolerance](self, "_contextDependentTolerance");
      CMTimeMakeWithSeconds(&v27, self->_preloadingTime, 1000000000);
      v25 = *(_OWORD *)buf;
      v26 = v29;
      v23 = *(_OWORD *)buf;
      v24 = v29;
      objc_msgSend(v10, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v27, &v25, &v23, &stru_290908);
      self->_preloadingTime = 0.0;
    }
    if (self->_player)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
      objc_msgSend(v15, "replaceCurrentItemWithPlayerItem:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
      objc_msgSend(v16, "replaceCurrentItemWithPlayerItem:", v10);

      -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:", preloadingTime);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", v10));
      -[IMAVPlayer setPlayer:](self, "setPlayer:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
      objc_msgSend(v18, "setActionAtItemEnd:", 1);

      -[IMAVPlayer _updateAllowsExternalPlayback](self, "_updateAllowsExternalPlayback");
      usesExternalPlaybackWhileExternalScreenIsActive = self->_usesExternalPlaybackWhileExternalScreenIsActive;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
      objc_msgSend(v20, "setUsesExternalPlaybackWhileExternalScreenIsActive:", usesExternalPlaybackWhileExternalScreenIsActive);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView window](self->_videoView, "window"));

    if (v21)
      -[IMAVPlayer updateVideoLayer](self, "updateVideoLayer");

  }
  else
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
    objc_msgSend(v22, "replaceCurrentItemWithPlayerItem:", 0);

  }
}

- (void)updateVideoLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 useFullExternalScreen;
  void *v14;
  void *v15;
  id v16;

  if (!self->_player)
    return;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen screens](UIScreen, "screens"));
  if (objc_msgSend(v3, "count") == (char *)&dword_0 + 1)
    goto LABEL_6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));
  if (!v4 || -[IMAVPlayer airplayVideoActive](self, "airplayVideoActive"))
  {

LABEL_6:
    goto LABEL_7;
  }
  useFullExternalScreen = self->_useFullExternalScreen;

  if (useFullExternalScreen)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen screens](UIScreen, "screens"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 1));

    -[IMAVPlayer createExternalDisplayOnScreen:](self, "createExternalDisplayOnScreen:", v15);
    goto LABEL_8;
  }
LABEL_7:
  -[IMAVPlayer clearExternalDisplay](self, "clearExternalDisplay");
LABEL_8:
  -[IMVideoView setExternalDisplay:](self->_videoView, "setExternalDisplay:", self->_externalDisplay);
  -[IMVideoView updateAirplayNoContentView](self->_videoView, "updateAirplayNoContentView");
  if (self->_externalDisplay)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView videoLayer](self->_externalVideoView, "videoLayer"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_player));
      -[IMExternalVideoView setVideoLayer:](self->_externalVideoView, "setVideoLayer:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self->_videoView, "videoLayer"));
    v8 = v7;
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self->_videoView, "videoLayer"));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_player));
      -[IMVideoView setVideoLayer:](self->_videoView, "setVideoLayer:", v11);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self->_videoView, "videoLayer"));
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "setHidden:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", IMAVPlayerDefaults_ClosedCaptioning));

  -[AVPlayer setAppliesMediaSelectionCriteriaAutomatically:](self->_player, "setAppliesMediaSelectionCriteriaAutomatically:", objc_msgSend(v16, "BOOLValue"));
  -[IMAVPlayer updateScale](self, "updateScale");

}

- (void)clearExternalDisplay
{
  id v3;
  NSObject *v4;
  IMExternalVideoView *externalVideoView;
  UIWindow *externalVideoWindow;
  uint8_t v7[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "clearExternalDisplay", v7, 2u);
  }

  -[IMExternalVideoView removeFromSuperview](self->_externalVideoView, "removeFromSuperview");
  externalVideoView = self->_externalVideoView;
  self->_externalVideoView = 0;

  -[UIWindow resignKeyWindow](self->_externalVideoWindow, "resignKeyWindow");
  externalVideoWindow = self->_externalVideoWindow;
  self->_externalVideoWindow = 0;

  self->_externalDisplay = 0;
}

- (void)createExternalDisplayOnScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  UIWindow *v8;
  UIWindow *externalVideoWindow;
  IMExternalVideoView *v10;
  IMExternalVideoView *v11;
  IMExternalVideoView *externalVideoView;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  if (*(_OWORD *)&self->_externalVideoView == 0)
  {
    v5 = BCAVPlayerLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "createExternalDisplayOnScreen %@", (uint8_t *)&v14, 0xCu);
    }

    v7 = objc_alloc((Class)UIWindow);
    objc_msgSend(v4, "bounds");
    v8 = (UIWindow *)objc_msgSend(v7, "initWithFrame:");
    externalVideoWindow = self->_externalVideoWindow;
    self->_externalVideoWindow = v8;

    -[UIWindow setScreen:](self->_externalVideoWindow, "setScreen:", v4);
    v10 = [IMExternalVideoView alloc];
    objc_msgSend(v4, "bounds");
    v11 = -[IMExternalVideoView initWithFrame:](v10, "initWithFrame:");
    externalVideoView = self->_externalVideoView;
    self->_externalVideoView = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMExternalVideoView setBackgroundColor:](self->_externalVideoView, "setBackgroundColor:", v13);

    -[UIWindow addSubview:](self->_externalVideoWindow, "addSubview:", self->_externalVideoView);
    -[UIWindow makeKeyAndVisible](self->_externalVideoWindow, "makeKeyAndVisible");
  }
  self->_externalDisplay = 1;

}

- (void)updateScale
{
  unsigned int v3;
  const AVLayerVideoGravity *v4;
  AVLayerVideoGravity v5;
  void *v6;
  id v7;

  v3 = -[IMAVPlayer scale](self, "scale");
  if (v3 == 2)
  {
    v4 = &AVLayerVideoGravityResize;
  }
  else if (v3 == 1)
  {
    v4 = &AVLayerVideoGravityResizeAspectFill;
  }
  else
  {
    if (v3)
      return;
    v4 = &AVLayerVideoGravityResizeAspect;
  }
  v5 = *v4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self->_videoView, "videoLayer"));
  objc_msgSend(v7, "setVideoGravity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView videoLayer](self->_externalVideoView, "videoLayer"));
  objc_msgSend(v6, "setVideoGravity:", v5);

}

- (void)_updateAllowsExternalPlayback
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer delegate](self, "delegate"));
  v8 = v3;
  if ((*(_WORD *)&self->_delegateFlags & 0x400) != 0)
  {
    v7 = objc_msgSend(v3, "playerAllowsExternalPlayback:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
    v5 = v4;
    v6 = (uint64_t)v7;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
    v5 = v4;
    v6 = 1;
  }
  objc_msgSend(v4, "setAllowsExternalPlayback:", v6);

}

- (void)setPlayer:(id)a3
{
  AVPlayer *v5;
  AVPlayer *player;
  AVPlayer *v7;

  v5 = (AVPlayer *)a3;
  player = self->_player;
  if (player != v5)
  {
    v7 = v5;
    -[AVPlayer removeObserver:forKeyPath:](player, "removeObserver:forKeyPath:", self, CFSTR("currentItem"));
    -[AVPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, CFSTR("rate"));
    -[AVPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, CFSTR("airPlayVideoActive"));
    -[AVPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, CFSTR("timeControlStatus"));
    -[IMAVPlayer removePeriodicTimeObserver](self, "removePeriodicTimeObserver");
    -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
    -[IMAVPlayer clearEndTimeObserver](self, "clearEndTimeObserver");
    objc_storeStrong((id *)&self->_player, a3);
    if (self->_player)
    {
      -[IMAVPlayer addPeriodicTimeObserver](self, "addPeriodicTimeObserver");
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("airPlayVideoActive"), 4, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 6, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 0, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 1, 0);
    }
    -[IMAVPlayer _updateAllowsExternalPlayback](self, "_updateAllowsExternalPlayback");
    v5 = v7;
  }

}

- (void)updateVolume
{
  double v2;

  *(float *)&v2 = self->_volume;
  -[AVPlayer setVolume:](self->_player, "setVolume:", v2);
}

- (void)_updateAudioParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracksWithMediaType:", AVMediaTypeAudio));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:](AVMutableAudioMixInputParameters, "audioMixInputParametersWithTrack:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), (_QWORD)v15));
        objc_msgSend(v12, "setAudioTimePitchAlgorithm:", AVAudioTimePitchAlgorithmTimeDomain);
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableAudioMix audioMix](AVMutableAudioMix, "audioMix"));
  objc_msgSend(v13, "setInputParameters:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  objc_msgSend(v14, "setAudioMix:", v13);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void (**v27)(_QWORD);
  id v28;
  NSObject *v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  double lastSeekingTime;
  objc_super v60;
  _QWORD v61[5];
  id v62;
  _QWORD block[4];
  void (**v64)(_QWORD);
  _QWORD v65[4];
  id v66;
  id v67;
  uint8_t buf[4];
  double v69[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_309C00 == a6)
  {
    objc_initWeak((id *)buf, self);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_C5950;
    v65[3] = &unk_290930;
    v66 = v12;
    objc_copyWeak(&v67, (id *)buf);
    v26 = objc_retainBlock(v65);
    v27 = objc_retainBlock(v26);
    if (v27)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v27[2](v27);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_C59F8;
        block[3] = &unk_28BF90;
        v64 = v27;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer delegate](self, "delegate"));
    v14 = BCAVPlayerLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      *(_DWORD *)buf = 138477827;
      v69[0] = *(double *)&v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "currentItem changed: %{private}@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeOldKey));
    if (v17)
    {
      v18 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
      {
        objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("status"));
        objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("playbackLikelyToKeepUp"));
        objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("playbackBufferEmpty"));
      }
    }
    if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0)
      objc_msgSend(v13, "playerCurrentItemChanged:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));

    if (v19)
    {
      -[IMAVPlayer updateTimeObservers](self, "updateTimeObservers");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 4, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      objc_msgSend(v21, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackLikelyToKeepUp"), 4, 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      objc_msgSend(v22, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackBufferEmpty"), 4, 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "asset"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("tracks"), CFSTR("duration"), 0));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_C5A04;
      v61[3] = &unk_28B808;
      v61[4] = self;
      v62 = v13;
      objc_msgSend(v24, "loadValuesAsynchronouslyForKeys:completionHandler:", v25, v61);

    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("rate")))
  {
    v28 = BCAVPlayerLog();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      -[AVPlayer rate](self->_player, "rate");
      *(_DWORD *)buf = 134217984;
      v69[0] = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "rate changed: %f", buf, 0xCu);
    }

    -[AVPlayer rate](self->_player, "rate");
    if (v31 == 0.0)
    {
      if (-[IMAVPlayer state](self, "state") != 1 && -[IMAVPlayer state](self, "state"))
        -[IMAVPlayer setState:](self, "setState:", 3);
    }
    else
    {
      -[IMAVPlayer setState:](self, "setState:", 2);
      -[IMAVPlayer setLoadState:](self, "setLoadState:", 1);
      self->_wasPlaying = 1;
    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer delegate](self, "delegate"));
      v34 = BCAVPlayerLog();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
        *(_DWORD *)buf = 134217984;
        v69[0] = COERCE_DOUBLE(objc_msgSend(v36, "status"));
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "item status changed: %ld", buf, 0xCu);

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      v38 = (char *)objc_msgSend(v37, "status");

      if (v38 == (_BYTE *)&dword_0 + 2)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "error"));

        -[IMAVPlayer playbackFailedWithError:](self, "playbackFailedWithError:", v55);
        v56 = BCAVPlayerLog();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          sub_1B6DC0((uint64_t)v55, v57, v58);

        -[IMAVPlayer stop](self, "stop");
        -[IMAVPlayer setPlayer:](self, "setPlayer:", 0);
        if ((*(_WORD *)&self->_delegateFlags & 2) != 0)
          objc_msgSend(v33, "playerErrorDidOccur:error:", self, v55);

      }
      else if (v38 == (_BYTE *)&dword_0 + 1)
      {
        -[IMAVPlayer setLoadState:](self, "setLoadState:", 1);
        lastSeekingTime = self->_lastSeekingTime;
        if (self->_playbackPending)
        {
          if (lastSeekingTime >= 0.0)
            -[IMAVPlayer playFrom:](self, "playFrom:");
          else
            -[IMAVPlayer play](self, "play");
        }
        else if (lastSeekingTime != self->_lastSeekedTime)
        {
          -[IMAVPlayer updateSeekTime:](self, "updateSeekTime:");
        }
      }
      else if (!v38)
      {
        -[IMAVPlayer setLoadState:](self, "setLoadState:", 0);
      }

    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("airPlayVideoActive")))
  {
    v39 = BCAVPlayerLog();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v69[0]) = -[IMAVPlayer airplayVideoActive](self, "airplayVideoActive");
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "airPlayVideoActive new value = %d", buf, 8u);
    }

    -[IMAVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("airplayVideoActive"));
    -[IMVideoView setAirplayActive:](self->_videoView, "setAirplayActive:", -[IMAVPlayer airplayVideoActive](self, "airplayVideoActive"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView window](self->_videoView, "window"));

    if (v41)
      -[IMAVPlayer updateVideoLayer](self, "updateVideoLayer");
    -[IMAVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("airplayVideoActive"));
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("playbackBufferEmpty")))
  {
    v42 = BCAVPlayerLog();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      *(_DWORD *)buf = 67109120;
      LODWORD(v69[0]) = objc_msgSend(v44, "isPlaybackBufferEmpty");
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "playbackBufferEmpty new value = %d", buf, 8u);

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
    v46 = objc_msgSend(v45, "isPlaybackBufferEmpty");

    if (v46)
    {
      v47 = BCAVPlayerLog();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "playbackBufferEmpty", buf, 2u);
      }

      if (!-[IMAVPlayer isPlaying](self, "isPlaying"))
        -[IMAVPlayer setLoadState:](self, "setLoadState:", 2);
    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("playbackLikelyToKeepUp")))
  {
    v49 = BCAVPlayerLog();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      *(_DWORD *)buf = 67109120;
      LODWORD(v69[0]) = objc_msgSend(v51, "isPlaybackLikelyToKeepUp");
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "playbackLikelyToKeepUp new value = %d", buf, 8u);

    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
    v53 = objc_msgSend(v52, "isPlaybackLikelyToKeepUp");

    if (v53)
    {
      if (-[IMAVPlayer loadState](self, "loadState") == 2
        && self->_wasPlaying
        && !-[IMAVPlayer isPlaying](self, "isPlaying"))
      {
        -[IMAVPlayer play](self, "play");
      }
      -[IMAVPlayer setLoadState:](self, "setLoadState:", 1);
    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("timeControlStatus")))
  {
    if ((char *)-[AVPlayer timeControlStatus](self->_player, "timeControlStatus") == (char *)&dword_0 + 2)
      -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
  else
  {
    v60.receiver = self;
    v60.super_class = (Class)IMAVPlayer;
    -[IMAVPlayer observeValueForKeyPath:ofObject:change:context:](&v60, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)playerItemDidReachEnd:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int loops;
  BOOL v10;
  int v11;
  double v12;
  double v13;
  double v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 138477827;
    v16 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "playerItemDidReachEnd: notification=%{private}@", (uint8_t *)&v15, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  if (v7 == v8)
  {
    if (self->_loops)
    {
      -[IMAVPlayer playFrom:](self, "playFrom:", 0.0);
      loops = self->_loops;
      v10 = __OFSUB__(loops, 1);
      v11 = loops - 1;
      if (v11 < 0 == v10)
        self->_loops = v11;
    }
    else
    {
      -[IMAVPlayer currentTime](self, "currentTime");
      v13 = v12;
      -[IMAVPlayer duration](self, "duration");
      if (vabdd_f64(v13, v14) < 2.0)
      {
        -[IMAVPlayer stop](self, "stop");
        -[IMAVPlayer sendItemEndedNotification](self, "sendItemEndedNotification");
      }
    }
  }

}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];

  v3 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setScrubbing: scrubbing=%d", (uint8_t *)v9, 8u);
  }

  if (self->_scrubbing != v3)
  {
    self->_scrubbing = v3;
    if (v3)
      v7 = 2;
    else
      v7 = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer player](self, "player"));
    objc_msgSend(v8, "setActionAtItemEnd:", v7);

  }
}

- (void)sendItemStoppedNotification
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  uint8_t v7[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "sendItemStoppedNotification", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", IMAVPlayerNotification_PlaybackStopped[0], self);

  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playerCurrentItemStopped:", self);

  }
}

- (void)sendItemEndedNotification
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint8_t v9[16];

  v3 = BCAVPlayerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "sendItemEndedNotification", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer delegate](self, "delegate"));
  if (v5 && (*(_WORD *)&self->_delegateFlags & 0x40) != 0)
  {
    -[IMAVPlayer duration](self, "duration");
    v7 = v6;
    -[IMAVPlayer duration](self, "duration");
    objc_msgSend(v5, "playerPeriodicUpdate:elapsed:duration:isFinished:", self, 1, v7, v8);
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
    objc_msgSend(v5, "playerCurrentItemEnded:", self);

}

- (void)setCurrentTime:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  char *v8;
  int v9;
  double v10;

  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setCurrentTime %.1lf", (uint8_t *)&v9, 0xCu);
  }

  if (a3 >= 0.0)
  {
    self->_lastSeekingTime = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
    v8 = (char *)objc_msgSend(v7, "status");

    if (v8 == (_BYTE *)&dword_0 + 1 && !self->_seeking)
    {
      self->_seeking = 1;
      -[IMAVPlayer updateSeekTime:](self, "updateSeekTime:", a3);
    }
  }
}

- (void)seekFinished:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  self->_lastSeekedTime = a3;
  if (self->_lastSeekingTime == a3)
  {
    self->_seeking = 0;
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
    -[IMAVPlayer updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
  else
  {
    v4 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_C6020;
    block[3] = &unk_28B960;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateSeekTime:(double)a3
{
  id v5;
  NSObject *v6;
  AVPlayer *player;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[6];
  CMTime v13;
  uint8_t buf[16];
  uint64_t v15;

  if (a3 >= 0.0)
  {
    v5 = BCAVPlayerLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "updateSeekTime %.1lf", buf, 0xCu);
    }

    memset(buf, 0, sizeof(buf));
    v15 = 0;
    -[IMAVPlayer _contextDependentTolerance](self, "_contextDependentTolerance");
    player = self->_player;
    CMTimeMakeWithSeconds(&v13, a3, 1000000000);
    v12[1] = 3221225472;
    v12[2] = sub_C616C;
    v12[3] = &unk_28BA28;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v10 = *(_OWORD *)buf;
    v11 = v15;
    v12[0] = _NSConcreteStackBlock;
    v8 = *(_OWORD *)buf;
    v9 = v15;
    -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v13, &v10, &v8, v12);
  }
}

- (double)currentTime
{
  void *v3;
  char *v4;
  void *v5;
  AVPlayer *player;
  CMTime time;

  if (self->_seeking)
    return self->_lastSeekingTime;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  v4 = (char *)objc_msgSend(v3, "status");

  if (v4 != (_BYTE *)&dword_0 + 1)
    return self->_lastSeekingTime;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));

  if (!v5)
    return 0.0;
  player = self->_player;
  if (player)
    -[AVPlayer currentTime](player, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (double)duration
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  double result;
  CMTime time;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));
  v4 = (char *)objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("duration"), 0);

  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "duration");
    else
      memset(&time, 0, sizeof(time));
    -[IMAVPlayer setCachedDuration:](self, "setCachedDuration:", CMTimeGetSeconds(&time));

    -[IMAVPlayer cachedDuration](self, "cachedDuration");
  }
  else
  {
    -[IMAVPlayer cachedDuration](self, "cachedDuration");
  }
  return result;
}

- (double)loadedDuration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  double Seconds;
  CMTimeRange v14;
  CMTime time;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));

  if (!v3)
    return 0.0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadedTimeRanges"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (v11)
          objc_msgSend(v11, "CMTimeRangeValue");
        else
          memset(&v14, 0, sizeof(v14));
        CMTimeRangeGetEnd(&time, &v14);
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v9)
          v9 = Seconds;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)setEndTime:(double)a3
{
  if (self->_endTime != a3)
  {
    if (a3 == 0.0)
      -[IMAVPlayer clearEndTimeObserver](self, "clearEndTimeObserver");
    self->_endTime = a3;
    self->_timeObserverNeedsUpdate = 1;
  }
}

- (void)clearEndTimeObserver
{
  id endTimeObserver;

  if (self->_endTimeObserver)
  {
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
    endTimeObserver = self->_endTimeObserver;
    self->_endTimeObserver = 0;

  }
}

- (void)addTimeObserver:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v9;
  NSMutableArray *observingTimes;
  void *v11;
  CMTime v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 >= 0.0)
  {
    v13 = v6;
    v14 = v5;
    v15 = v3;
    v16 = v4;
    if (!self->_observingTimes)
    {
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      observingTimes = self->_observingTimes;
      self->_observingTimes = v9;

    }
    CMTimeMakeWithSeconds(&v12, a3, 1000000000);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v12));
    -[NSMutableArray addObject:](self->_observingTimes, "addObject:", v11);
    self->_timeObserverNeedsUpdate = 1;

  }
}

- (void)removeTimeObserver:(double)a3
{
  NSMutableArray *observingTimes;
  void *v4;
  CMTime v5;

  observingTimes = self->_observingTimes;
  CMTimeMakeWithSeconds(&v5, a3, 1000000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v5));
  -[NSMutableArray removeObject:](observingTimes, "removeObject:", v4);

}

- (void)removeAllTimeObservers
{
  NSMutableArray *observingTimes;

  -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
  -[NSMutableArray removeAllObjects](self->_observingTimes, "removeAllObjects");
  observingTimes = self->_observingTimes;
  self->_observingTimes = 0;

}

- (void)clearTimeObservers
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *timeObservers;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_timeObservers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_timeObservers, "removeAllObjects");
  timeObservers = self->_timeObservers;
  self->_timeObservers = 0;

}

- (void)addPeriodicTimeObserver
{
  void *v3;
  AVPlayer *player;
  void *v5;
  _QWORD v6[4];
  id v7;
  CMTime v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    player = self->_player;
    CMTimeMakeWithSeconds(&v8, 1.0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_C68C0;
    v6[3] = &unk_290958;
    objc_copyWeak(&v7, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v8, 0, v6));
    -[IMAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)removePeriodicTimeObserver
{
  void *v3;
  AVPlayer *player;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));

  if (v3)
  {
    player = self->_player;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));
    -[AVPlayer removeTimeObserver:](player, "removeTimeObserver:", v5);

    -[IMAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", 0);
  }
}

- (void)updateTimeObservers
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->_timeObserverNeedsUpdate)
  {
    -[IMAVPlayer clearEndTimeObserver](self, "clearEndTimeObserver");
    -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
    -[IMAVPlayer setupEndTimeObserver](self, "setupEndTimeObserver");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_observingTimes;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[IMAVPlayer setupTimeObserver:](self, "setupTimeObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), (_QWORD)v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    self->_timeObserverNeedsUpdate = 0;
    -[IMAVPlayer currentTime](self, "currentTime");
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
  }
}

- (void)setupTimeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AVPlayer *player;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *timeObservers;
  NSMutableArray *v12;
  NSMutableArray **p_timeObservers;
  NSMutableArray *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "add BoundaryTimeObserver timeValue %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  player = self->_player;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_C6CC4;
  v18 = &unk_28BD80;
  objc_copyWeak(&v20, (id *)buf);
  v9 = v4;
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer addBoundaryTimeObserverForTimes:queue:usingBlock:](player, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v8, 0, &v15));

  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v14 = self->_timeObservers;
    p_timeObservers = &self->_timeObservers;
    *p_timeObservers = v12;

    timeObservers = *p_timeObservers;
  }
  -[NSMutableArray addObject:](timeObservers, "addObject:", v10, v15, v16, v17, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)setupEndTimeObserver
{
  double v3;
  Float64 v4;
  void *v5;
  id v6;
  NSObject *v7;
  AVPlayer *player;
  void *v9;
  id v10;
  void *v11;
  id endTimeObserver;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  CMTime v17;
  uint8_t buf[4];
  void *v19;

  -[IMAVPlayer endTime](self, "endTime");
  if (v3 > 0.0)
  {
    -[IMAVPlayer endTime](self, "endTime");
    CMTimeMakeWithSeconds(&v17, v4, 1000000000);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v17));
    objc_initWeak(&location, self);
    v6 = BCAVPlayerLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "End TimeObserver timeValue %@", buf, 0xCu);
    }

    player = self->_player;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_C6ED8;
    v13[3] = &unk_28BD80;
    objc_copyWeak(&v15, &location);
    v10 = v5;
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer addBoundaryTimeObserverForTimes:queue:usingBlock:](player, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v9, 0, v13));
    endTimeObserver = self->_endTimeObserver;
    self->_endTimeObserver = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)triggerTimeObserverAt:(id)a3
{
  id v4;
  void *v5;
  double Seconds;
  id v7;
  NSObject *v8;
  id WeakRetained;
  CMTime time;
  uint8_t buf[4];
  double v12;

  v4 = a3;
  v5 = v4;
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    if (v4)
      objc_msgSend(v4, "CMTimeValue");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v7 = BCAVPlayerLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v12 = Seconds;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "triggerTimeObserver %f", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "player:callbackForTime:", self, Seconds);

  }
}

- (void)forceTriggerTimeObserverAt:(double)a3
{
  NSMutableArray *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  double Seconds;
  CMTime time;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_observingTimes;
  v6 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = &v7[(_QWORD)v8];
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), "CMTimeValue");
        else
          memset(&time, 0, sizeof(time));
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds > a3)
        {
          v11 = &v10[(_QWORD)v8];
          goto LABEL_16;
        }
        if (Seconds == a3)
          goto LABEL_18;
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_observingTimes, "objectAtIndex:", v11 - 1));
    v5 = (NSMutableArray *)v12;
LABEL_18:
    -[IMAVPlayer triggerTimeObserverAt:](self, "triggerTimeObserverAt:", v12);

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  id obj;

  obj = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[IMAVPlayer delegate](self, "delegate"));
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector(obj, "playerStateChanged:") & 1;
    if ((objc_opt_respondsToSelector(obj, "playerErrorDidOccur:error:") & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector(obj, "playerMediaTypeAvailable:") & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector(obj, "playerDurationAvailable:") & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector(obj, "player:callbackForTime:") & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector(obj, "playerLoadStateChanged:") & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector(obj, "playerPeriodicUpdate:elapsed:duration:isFinished:") & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector(obj, "playerCurrentItemChanged:") & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector(obj, "playerCurrentItemStopped:") & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v12;
    if ((objc_opt_respondsToSelector(obj, "playerCurrentItemEnded:") & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v13;
    if ((objc_opt_respondsToSelector(obj, "playerAllowsExternalPlayback:") & 1) != 0)
      v14 = 1024;
    else
      v14 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v14;
  }

}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  double v29;
  float v30;
  void *v31;
  id v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](MPNowPlayingInfoCenter, "defaultCenter"));
  if (-[IMAVPlayer state](self, "state") == 1)
  {
    objc_msgSend(v3, "setNowPlayingInfo:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 7));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer metaData](self, "metaData"));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", IMAVPlayerMetaData_Title[0]));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Title[0]));
        objc_msgSend(v4, "setObject:forKey:", v8, MPMediaItemPropertyTitle);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Artist[0]));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Artist[0]));
        objc_msgSend(v4, "setObject:forKey:", v10, MPMediaItemPropertyArtist);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Album[0]));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Album[0]));
        objc_msgSend(v4, "setObject:forKey:", v12, MPMediaItemPropertyAlbumTitle);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", IMAVPlayerMetaData_PersistentID[0]));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", IMAVPlayerMetaData_PersistentID[0]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, MPMediaItemPropertyPersistentID);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_StoreIdentifier[0]));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", IMAVPlayerMetaData_StoreIdentifier[0]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, _MPNowPlayingInfoPropertyiTunesStoreIdentifier);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v13));
      objc_msgSend(v4, "setObject:forKey:", v18, _MPNowPlayingCollectionInfoKeyIdentifiers);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", IMAVPlayerMetaData_Artwork[0]));
      if (v19)
      {
        v20 = objc_alloc((Class)MPMediaItemArtwork);
        objc_msgSend(v19, "size");
        v22 = v21;
        v24 = v23;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_C78D8;
        v34[3] = &unk_290980;
        v35 = v19;
        v25 = objc_msgSend(v20, "initWithBoundsSize:requestHandler:", v34, v22, v24);
        objc_msgSend(v4, "setObject:forKey:", v25, MPMediaItemPropertyArtwork);

      }
    }
    -[IMAVPlayer currentTime](self, "currentTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKey:", v26, MPNowPlayingInfoPropertyElapsedPlaybackTime);

    -[IMAVPlayer duration](self, "duration");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKey:", v27, MPMediaItemPropertyPlaybackDuration);

    v28 = -[IMAVPlayer isPlaying](self, "isPlaying");
    v29 = 0.0;
    if (v28)
    {
      -[AVPlayer rate](self->_player, "rate", 0.0);
      v29 = v30;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29));
    objc_msgSend(v4, "setObject:forKey:", v31, MPNowPlayingInfoPropertyPlaybackRate);

    v32 = BCAVPlayerLog();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v37 = v4;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Setting nowPlayingInfo=%{private}@", buf, 0xCu);
    }

    objc_msgSend(v3, "setNowPlayingInfo:", v4);
  }

}

- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CMTimeEpoch v13;
  CGImage *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  id v21;
  CMTime v22;
  __int128 v23;
  CMTimeEpoch v24;
  __int128 v25;
  CMTimeEpoch epoch;

  height = a4.height;
  width = a4.width;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMAVPlayer asset](self, "asset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAssetImageGenerator assetImageGeneratorWithAsset:](AVAssetImageGenerator, "assetImageGeneratorWithAsset:", v9));

  if (a5 < 1.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "scale");
    a5 = v12;

  }
  objc_msgSend(v10, "setMaximumSize:", width * a5, height * a5);
  v25 = *(_OWORD *)&kCMTimePositiveInfinity.value;
  v20 = v25;
  epoch = kCMTimePositiveInfinity.epoch;
  v13 = epoch;
  objc_msgSend(v10, "setRequestedTimeToleranceBefore:", &v25);
  v23 = v20;
  v24 = v13;
  objc_msgSend(v10, "setRequestedTimeToleranceAfter:", &v23);
  CMTimeMakeWithSeconds(&v22, a3, 1000000000);
  v21 = 0;
  v14 = (CGImage *)objc_msgSend(v10, "copyCGImageAtTime:actualTime:error:", &v22, 0, &v21);
  v15 = v21;
  if (v15)
  {
    v16 = BCAVPlayerLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1B6E2C(v15, v17);
    v18 = 0;
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    -[NSObject scale](v17, "scale");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v14, 0));
  }

  CGImageRelease(v14);
  return v18;
}

- (BOOL)airplayVideoActive
{
  return -[AVPlayer isExternalPlaybackActive](self->_player, "isExternalPlaybackActive");
}

- (void)onScreenConnection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "onScreenConnection %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView window](self->_videoView, "window"));

  if (v8)
    -[IMAVPlayer updateVideoLayer](self, "updateVideoLayer");

}

- (void)onScreenDisconnection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "onScreenDisconnection %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView window](self->_videoView, "window"));

  if (v8)
    -[IMAVPlayer updateVideoLayer](self, "updateVideoLayer");

}

- (void)playbackWasPaused:(id)a3
{
  BOOL *p_wasPlaying;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  self->_wasPlaying = -[IMAVPlayer isPlaying](self, "isPlaying", a3);
  p_wasPlaying = &self->_wasPlaying;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1B6EB8((uint64_t)p_wasPlaying, v5, v6, v7, v8, v9, v10, v11);
}

- (void)onInterruption:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  _BOOL4 wasPlaying;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  int v27;
  _BYTE v28[10];
  _BOOL4 v29;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    *(_QWORD *)v28 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "onInterruption: notification=%@", (uint8_t *)&v27, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", AVAudioSessionInterruptionTypeKey));
  v9 = (char *)objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
  {
    if (v9 == (_BYTE *)&dword_0 + 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_1B6F2C((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
      v17 = BCAVPlayerLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        wasPlaying = self->_wasPlaying;
        v27 = 67109120;
        *(_DWORD *)v28 = wasPlaying;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "begin interruption, wasPlaying: %d", (uint8_t *)&v27, 8u);
      }

    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", AVAudioSessionInterruptionOptionKey));
    v21 = objc_msgSend(v20, "unsignedIntegerValue");

    v22 = BCAVPlayerLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = self->_wasPlaying;
      v27 = 134218240;
      *(_QWORD *)v28 = v21;
      *(_WORD *)&v28[8] = 1024;
      v29 = v24;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "end interruption AVAudioSessionInterruptionOptionKey: %lu wasPlaying: %d", (uint8_t *)&v27, 0x12u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v25 = self->_wasPlaying;
      v27 = 67109376;
      *(_DWORD *)v28 = v21 & 1;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v25;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AVAudioSession: Interruption has ended. Should resume: %d. Was playing: %d.", (uint8_t *)&v27, 0xEu);
    }
    if ((v21 & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      objc_msgSend(v26, "setActive:error:", 1, 0);

      if (self->_wasPlaying)
      {
        -[IMAVPlayer rewindFollowingInterruption](self, "rewindFollowingInterruption");
        -[IMAVPlayer play](self, "play");
      }
    }
  }

}

- (void)onRouteChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  IMAVPlayer *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;

  v4 = a3;
  v5 = BCAVPlayerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "onRouteChange: notification=%@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", AVAudioSessionRouteChangePreviousRouteKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", AVAudioSessionRouteChangeReasonKey));

  if (objc_msgSend(v10, "integerValue") == (char *)&dword_0 + 2)
  {
    v25 = self;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputs"));
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      v23 = v8;
      v24 = v4;
      v22 = v10;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "portType"));
          if ((objc_msgSend(v16, "isEqualToString:", AVAudioSessionPortHeadphones) & 1) != 0)
            goto LABEL_16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "portType"));
          if (objc_msgSend(v17, "isEqualToString:", AVAudioSessionPortLineOut))
          {

LABEL_16:
LABEL_17:
            v20 = BCAVPlayerLog();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "route change interruption.  Setting _wasPlaying=NO", buf, 2u);
            }

            v4 = v24;
            v25->_wasPlaying = 0;
            v10 = v22;
            v8 = v23;
            goto LABEL_20;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "portType"));
          v19 = objc_msgSend(v18, "isEqualToString:", AVAudioSessionPortBluetoothA2DP);

          if ((v19 & 1) != 0)
            goto LABEL_17;
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v8 = v23;
        v4 = v24;
        v10 = v22;
        if (v12)
          continue;
        break;
      }
    }
LABEL_20:

  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (int)state
{
  return self->_state;
}

- (int)loadState
{
  return self->_loadState;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (IMVideoView)videoView
{
  return self->_videoView;
}

- (IMAVPlayerDelegate)delegate
{
  return (IMAVPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)scale
{
  return self->_scale;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (float)volume
{
  return self->_volume;
}

- (int)loops
{
  return self->_loops;
}

- (void)setLoops:(int)a3
{
  self->_loops = a3;
}

- (double)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(double)a3
{
  self->_cachedDuration = a3;
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserver, a3);
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (BOOL)useFullExternalScreen
{
  return self->_useFullExternalScreen;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  return self->_usesExternalPlaybackWhileExternalScreenIsActive;
}

- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)a3
{
  self->_usesExternalPlaybackWhileExternalScreenIsActive = a3;
}

- (double)seekStep
{
  return self->_seekStep;
}

- (void)setSeekStep:(double)a3
{
  self->_seekStep = a3;
}

- (double)seekDelay
{
  return self->_seekDelay;
}

- (void)setSeekDelay:(double)a3
{
  self->_seekDelay = a3;
}

- (BOOL)playWhileSeeking
{
  return self->_playWhileSeeking;
}

- (void)setPlayWhileSeeking:(BOOL)a3
{
  self->_playWhileSeeking = a3;
}

- (unint64_t)skipStepCount
{
  return self->_skipStepCount;
}

- (BOOL)optimizePerformanceOverAccuracy
{
  return self->_optimizePerformanceOverAccuracy;
}

- (void)setOptimizePerformanceOverAccuracy:(BOOL)a3
{
  self->_optimizePerformanceOverAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_seekTimer, 0);
  objc_storeStrong((id *)&self->_hdcpTimer, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_observingTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong(&self->_endTimeObserver, 0);
  objc_storeStrong((id *)&self->_externalVideoWindow, 0);
  objc_storeStrong((id *)&self->_externalVideoView, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
