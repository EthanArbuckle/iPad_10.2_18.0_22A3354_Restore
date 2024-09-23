@implementation MapsLoopingVideoPlayerView

- (void)dealloc
{
  objc_super v3;

  -[MapsLoopingVideoPlayerView _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)MapsLoopingVideoPlayerView;
  -[MapsLoopingVideoPlayerView dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsLoopingVideoPlayerView;
  -[MapsLoopingVideoPlayerView layoutSubviews](&v12, "layoutSubviews");
  -[MapsLoopingVideoPlayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerLayer](self, "playerLayer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  MapsLoopingVideoPlayerView *v19;
  __int16 v20;
  id v21;

  v17.receiver = self;
  v17.super_class = (Class)MapsLoopingVideoPlayerView;
  -[MapsLoopingVideoPlayerView didMoveToWindow](&v17, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UISceneWillEnterForegroundNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView window](self, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "sceneWillEnterForegroundNotification:", UISceneWillEnterForegroundNotification, v8);

    v9 = sub_100226C6C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting audio session category to ambient", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v16 = 0;
    v12 = objc_msgSend(v11, "setCategory:error:", AVAudioSessionCategoryAmbient, &v16);
    v13 = v16;

    if ((v12 & 1) == 0)
    {
      v14 = sub_100226C6C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        v19 = self;
        v20 = 2112;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] Error setting audio session category to ambient: %@", buf, 0x16u);
      }

    }
    -[MapsLoopingVideoPlayerView _createVideoPlayer](self, "_createVideoPlayer");

  }
  else
  {
    -[MapsLoopingVideoPlayerView _destroyVideoPlayer](self, "_destroyVideoPlayer");
  }
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int32_t v23;
  id v24;
  _BOOL4 v25;
  CMTime time2;
  CMTime time1;
  CMTime buf;
  id v29;
  __int16 v30;
  __CFString *v31;

  v4 = a4;
  v6 = a3;
  v7 = sub_100226C6C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v11 = v10;
    LODWORD(buf.value) = 134349826;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v9;
    HIWORD(buf.epoch) = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Swapping video; old player item: %@, new player item: %@; preserving timestamp: %@",
      (uint8_t *)&buf,
      0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));

  if (!v12)
  {
    v16 = sub_100226C6C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.value) = 134349056;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] There was no previously playing item; disabling timestamp preservation",
        (uint8_t *)&buf,
        0xCu);
    }

    -[MapsLoopingVideoPlayerView setPlayerItem:](self, "setPlayerItem:", v6);
    -[MapsLoopingVideoPlayerView _stopObserving](self, "_stopObserving");
    goto LABEL_12;
  }
  -[MapsLoopingVideoPlayerView setPlayerItem:](self, "setPlayerItem:", v6);
  -[MapsLoopingVideoPlayerView _stopObserving](self, "_stopObserving");
  if (!v4)
  {
LABEL_12:
    v18 = objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
    -[NSObject replaceCurrentItemWithPlayerItem:](v18, "replaceCurrentItemWithPlayerItem:", v19);

    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v13, "pause");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "currentTime");
  else
    memset(&time1, 0, sizeof(time1));
  buf = time1;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
  objc_msgSend(v21, "replaceCurrentItemWithPlayerItem:", v22);

  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = buf;
  v23 = CMTimeCompare(&time1, &time2);
  v24 = sub_100226C6C();
  v18 = objc_claimAutoreleasedReturnValue(v24);
  v25 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v23 <= 0)
  {
    if (v25)
    {
      LODWORD(time1.value) = 134349056;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Preserving timestamp of last video", (uint8_t *)&time1, 0xCu);
    }

    v18 = objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    time1 = buf;
    -[NSObject seekToTime:](v18, "seekToTime:", &time1);
  }
  else if (v25)
  {
    LODWORD(time1.value) = 134349056;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Could not preserve the timestamp of the last video because the new video is shorter than the timestamp of the last one", (uint8_t *)&time1, 0xCu);
  }
LABEL_13:

  -[MapsLoopingVideoPlayerView _startObserving](self, "_startObserving");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v20, "play");

}

- (void)_createVideoPlayer
{
  id v3;
  NSObject *v4;
  AVPlayer *v5;
  AVPlayer *player;
  AVPlayerLayer *v7;
  AVPlayerLayer *playerLayer;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MapsLoopingVideoPlayerView *v13;

  v3 = sub_100226C6C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating video player", (uint8_t *)&v12, 0xCu);
  }

  -[MapsLoopingVideoPlayerView _stopObserving](self, "_stopObserving");
  v5 = (AVPlayer *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", 0));
  player = self->_player;
  self->_player = v5;

  -[AVPlayer setMuted:](self->_player, "setMuted:", 1);
  -[AVPlayerLayer removeFromSuperlayer](self->_playerLayer, "removeFromSuperlayer");
  v7 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_player));
  playerLayer = self->_playerLayer;
  self->_playerLayer = v7;

  -[MapsLoopingVideoPlayerView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  -[AVPlayerLayer setContentsGravity:](self->_playerLayer, "setContentsGravity:", kCAGravityResizeAspect);
  -[AVPlayerLayer setVideoGravity:](self->_playerLayer, "setVideoGravity:", AVLayerVideoGravityResizeAspect);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView layer](self, "layer"));
  objc_msgSend(v9, "addSublayer:", self->_playerLayer);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
    -[MapsLoopingVideoPlayerView replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v11, 0);

  }
}

- (void)_destroyVideoPlayer
{
  id v3;
  NSObject *v4;
  void *v5;
  AVPlayerItem *playerItem;
  void *v7;
  int v8;
  MapsLoopingVideoPlayerView *v9;

  v3 = sub_100226C6C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Destroying video player", (uint8_t *)&v8, 0xCu);
  }

  -[MapsLoopingVideoPlayerView _stopObserving](self, "_stopObserving");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v5, "replaceCurrentItemWithPlayerItem:", 0);

  playerItem = self->_playerItem;
  self->_playerItem = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v7, "pause");

  -[MapsLoopingVideoPlayerView setPlayer:](self, "setPlayer:", 0);
}

- (void)_startObserving
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  MapsLoopingVideoPlayerView *v16;

  if (!-[MapsLoopingVideoPlayerView isObserving](self, "isObserving"))
  {
    v3 = sub_100226C6C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134349056;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Start observing notifications", (uint8_t *)&v15, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 1, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentItem"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "playerItemDidPlayToEndTimeNotification:", AVPlayerItemDidPlayToEndTimeNotification, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentItem"));
    objc_msgSend(v9, "addObserver:selector:name:object:", self, "playerItemFailedToPlayToEndTimeNotification:", AVPlayerItemFailedToPlayToEndTimeNotification, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = AVPlayerPlaybackWasInterruptedNotification;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    objc_msgSend(v12, "addObserver:selector:name:object:", self, "playerPlaybackWasInterruptedNotification:", v13, v14);

    -[MapsLoopingVideoPlayerView setObserving:](self, "setObserving:", 1);
  }
}

- (void)_stopObserving
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MapsLoopingVideoPlayerView *v10;

  if (-[MapsLoopingVideoPlayerView isObserving](self, "isObserving"))
  {
    v3 = sub_100226C6C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Stop observing notifications", (uint8_t *)&v9, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("rate"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:name:object:", self, AVPlayerItemFailedToPlayToEndTimeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, AVPlayerPlaybackWasInterruptedNotification, 0);

    -[MapsLoopingVideoPlayerView setObserving:](self, "setObserving:", 0);
  }
}

- (void)playerItemDidPlayToEndTimeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __int128 v8;
  CMTimeEpoch epoch;

  v4 = sub_100226C6C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v8) = 134349056;
    *(_QWORD *)((char *)&v8 + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Video finished playing; looping",
      (uint8_t *)&v8,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  v8 = *(_OWORD *)&kCMTimeZero.value;
  epoch = kCMTimeZero.epoch;
  objc_msgSend(v6, "seekToTime:", &v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v7, "play");

}

- (void)playerItemFailedToPlayToEndTimeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  MapsLoopingVideoPlayerView *v11;
  __int16 v12;
  void *v13;

  v4 = sub_100226C6C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{public}p] Player item failed to play to end time notification: %@; re-starting video",
      (uint8_t *)&v10,
      0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
  -[MapsLoopingVideoPlayerView replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v9, 0);

}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MapsLoopingVideoPlayerView *v8;

  v4 = sub_100226C6C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Application will enter foreground; re-starting video",
      (uint8_t *)&v7,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
  -[MapsLoopingVideoPlayerView replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v6, 1);

}

- (void)playerPlaybackWasInterruptedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MapsLoopingVideoPlayerView *v8;

  v4 = sub_100226C6C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Player playback was interrupted; re-starting video",
      (uint8_t *)&v7,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v6, "play");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  float v16;
  float v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  MapsLoopingVideoPlayerView *v26;
  __int16 v27;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  if (v13 != v11)
  {

LABEL_9:
    v24.receiver = self;
    v24.super_class = (Class)MapsLoopingVideoPlayerView;
    -[MapsLoopingVideoPlayerView observeValueForKeyPath:ofObject:change:context:](&v24, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_10;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("rate"));

  if (!v14)
    goto LABEL_9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
  objc_msgSend(v15, "rate");
  v17 = v16;

  if (v17 == 0.0)
  {
    v18 = -[MapsLoopingVideoPlayerView resuming](self, "resuming");
    v19 = sub_100226C6C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView playerItem](self, "playerItem"));
        *(_DWORD *)buf = 134349314;
        v26 = self;
        v27 = 2112;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}p] AVPlayer was paused, resumed, and immediately paused again. Will not try resuming again. playerItem: %@", buf, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] AVPlayer was paused; re-starting video",
          buf,
          0xCu);
      }

      -[MapsLoopingVideoPlayerView setResuming:](self, "setResuming:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView player](self, "player"));
      objc_msgSend(v23, "play");

      -[MapsLoopingVideoPlayerView setResuming:](self, "setResuming:", 0);
    }
  }
LABEL_10:

}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)resuming
{
  return self->_resuming;
}

- (void)setResuming:(BOOL)a3
{
  self->_resuming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
