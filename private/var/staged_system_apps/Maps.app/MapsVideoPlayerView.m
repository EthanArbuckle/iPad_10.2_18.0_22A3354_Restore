@implementation MapsVideoPlayerView

- (void)dealloc
{
  objc_super v3;

  -[MapsVideoPlayerView _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)MapsVideoPlayerView;
  -[MapsVideoPlayerView dealloc](&v3, "dealloc");
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
  v12.super_class = (Class)MapsVideoPlayerView;
  -[MapsVideoPlayerView layoutSubviews](&v12, "layoutSubviews");
  -[MapsVideoPlayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerLayer](self, "playerLayer"));
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
  MapsVideoPlayerView *v19;
  __int16 v20;
  id v21;

  v17.receiver = self;
  v17.super_class = (Class)MapsVideoPlayerView;
  -[MapsVideoPlayerView didMoveToWindow](&v17, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UISceneWillEnterForegroundNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView window](self, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "sceneWillEnterForegroundNotification:", UISceneWillEnterForegroundNotification, v8);

    v9 = sub_100537920();
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
      v14 = sub_100537920();
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
    -[MapsVideoPlayerView _createVideoPlayer](self, "_createVideoPlayer");

  }
  else
  {
    -[MapsVideoPlayerView _destroyVideoPlayer](self, "_destroyVideoPlayer");
  }
}

- (void)loadAssetNamed:(id)a3
{
  -[MapsVideoPlayerView loadAssetNamed:preservingTimestamp:](self, "loadAssetNamed:preservingTimestamp:", a3, 0);
}

- (void)loadAssetNamed:(id)a3 preservingTimestamp:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSDataAsset), "initWithName:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
  v12[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v12[1] = AVAssetReferenceRestrictionsKey;
  v13[0] = &__kCFBooleanFalse;
  v13[1] = &off_10126DC48;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithData:contentType:options:](AVAsset, "assetWithData:contentType:options:", v8, AVFileTypeMPEG4, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v10));
  -[MapsVideoPlayerView _replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "_replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v11, v4);

}

- (void)play
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  objc_msgSend(v2, "play");

}

- (void)reset
{
  void *v3;
  void *v4;
  __int128 v5;
  CMTimeEpoch epoch;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  objc_msgSend(v3, "pause");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  v5 = *(_OWORD *)&kCMTimeZero.value;
  epoch = kCMTimeZero.epoch;
  objc_msgSend(v4, "seekToTime:", &v5);

}

- (void)_replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4
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
  int32_t v22;
  id v23;
  _BOOL4 v24;
  CMTime time2;
  CMTime time1;
  CMTime buf;
  id v28;
  __int16 v29;
  __CFString *v30;

  v4 = a4;
  v6 = a3;
  v7 = sub_100537920();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v11 = v10;
    LODWORD(buf.value) = 134349826;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v9;
    HIWORD(buf.epoch) = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Swapping video; old player item: %@, new player item: %@; preserving timestamp: %@",
      (uint8_t *)&buf,
      0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));

  if (!v12)
  {
    v16 = sub_100537920();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.value) = 134349056;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] There was no previously playing item; disabling timestamp preservation",
        (uint8_t *)&buf,
        0xCu);
    }

    -[MapsVideoPlayerView setPlayerItem:](self, "setPlayerItem:", v6);
    -[MapsVideoPlayerView _stopObserving](self, "_stopObserving");
    goto LABEL_12;
  }
  -[MapsVideoPlayerView setPlayerItem:](self, "setPlayerItem:", v6);
  -[MapsVideoPlayerView _stopObserving](self, "_stopObserving");
  if (!v4)
  {
LABEL_12:
    v18 = objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
    -[NSObject replaceCurrentItemWithPlayerItem:](v18, "replaceCurrentItemWithPlayerItem:", v19);

    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  objc_msgSend(v13, "pause");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "currentTime");
  else
    memset(&time1, 0, sizeof(time1));
  buf = time1;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
  objc_msgSend(v20, "replaceCurrentItemWithPlayerItem:", v21);

  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = buf;
  v22 = CMTimeCompare(&time1, &time2);
  v23 = sub_100537920();
  v18 = objc_claimAutoreleasedReturnValue(v23);
  v24 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v22 <= 0)
  {
    if (v24)
    {
      LODWORD(time1.value) = 134349056;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Preserving timestamp of last video", (uint8_t *)&time1, 0xCu);
    }

    v18 = objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
    time1 = buf;
    -[NSObject seekToTime:](v18, "seekToTime:", &time1);
  }
  else if (v24)
  {
    LODWORD(time1.value) = 134349056;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Could not preserve the timestamp of the last video because the new video is shorter than the timestamp of the last one", (uint8_t *)&time1, 0xCu);
  }
LABEL_13:

  -[MapsVideoPlayerView _startObserving](self, "_startObserving");
}

- (void)_createVideoPlayer
{
  id v3;
  NSObject *v4;
  AVPlayer *v5;
  AVPlayer *player;
  AVPlayerLayer *v7;
  AVPlayerLayer *playerLayer;
  unsigned int v9;
  const CALayerContentsGravity *v10;
  unsigned int v11;
  const AVLayerVideoGravity *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  MapsVideoPlayerView *v17;

  v3 = sub_100537920();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v16 = 134349056;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating video player", (uint8_t *)&v16, 0xCu);
  }

  -[MapsVideoPlayerView _stopObserving](self, "_stopObserving");
  v5 = (AVPlayer *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", 0));
  player = self->_player;
  self->_player = v5;

  -[AVPlayer setMuted:](self->_player, "setMuted:", 1);
  -[AVPlayerLayer removeFromSuperlayer](self->_playerLayer, "removeFromSuperlayer");
  v7 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](AVPlayerLayer, "playerLayerWithPlayer:", self->_player));
  playerLayer = self->_playerLayer;
  self->_playerLayer = v7;

  -[MapsVideoPlayerView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  v9 = -[MapsVideoPlayerView aspectFill](self, "aspectFill");
  v10 = &kCAGravityResizeAspectFill;
  if (!v9)
    v10 = &kCAGravityResizeAspect;
  -[AVPlayerLayer setContentsGravity:](self->_playerLayer, "setContentsGravity:", *v10);
  v11 = -[MapsVideoPlayerView aspectFill](self, "aspectFill");
  v12 = &AVLayerVideoGravityResizeAspectFill;
  if (!v11)
    v12 = &AVLayerVideoGravityResizeAspect;
  -[AVPlayerLayer setVideoGravity:](self->_playerLayer, "setVideoGravity:", *v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView layer](self, "layer"));
  objc_msgSend(v13, "addSublayer:", self->_playerLayer);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
    -[MapsVideoPlayerView _replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "_replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v15, 0);

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
  MapsVideoPlayerView *v9;

  v3 = sub_100537920();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Destroying video player", (uint8_t *)&v8, 0xCu);
  }

  -[MapsVideoPlayerView _stopObserving](self, "_stopObserving");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  objc_msgSend(v5, "replaceCurrentItemWithPlayerItem:", 0);

  playerItem = self->_playerItem;
  self->_playerItem = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
  objc_msgSend(v7, "pause");

  -[MapsVideoPlayerView setPlayer:](self, "setPlayer:", 0);
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
  int v11;
  MapsVideoPlayerView *v12;

  if (!-[MapsVideoPlayerView isObserving](self, "isObserving"))
  {
    v3 = sub_100537920();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134349056;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Start observing notifications", (uint8_t *)&v11, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentItem"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "playerItemDidPlayToEndTimeNotification:", AVPlayerItemDidPlayToEndTimeNotification, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentItem"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "playerItemFailedToPlayToEndTimeNotification:", AVPlayerItemFailedToPlayToEndTimeNotification, v10);

    -[MapsVideoPlayerView setObserving:](self, "setObserving:", 1);
  }
}

- (void)_stopObserving
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  MapsVideoPlayerView *v8;

  if (-[MapsVideoPlayerView isObserving](self, "isObserving"))
  {
    v3 = sub_100537920();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134349056;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Stop observing notifications", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, AVPlayerItemFailedToPlayToEndTimeNotification, 0);

    -[MapsVideoPlayerView setObserving:](self, "setObserving:", 0);
  }
}

- (void)playerItemDidPlayToEndTimeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  int v8;
  MapsVideoPlayerView *v9;

  v4 = sub_100537920();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Video finished playing; looping",
      (uint8_t *)&v8,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playbackDidEndBlock](self, "playbackDidEndBlock"));
  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playbackDidEndBlock](self, "playbackDidEndBlock"));
    v7[2]();

  }
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
  MapsVideoPlayerView *v11;
  __int16 v12;
  void *v13;

  v4 = sub_100537920();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView player](self, "player"));
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
  -[MapsVideoPlayerView _replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "_replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v9, 0);

}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MapsVideoPlayerView *v8;

  v4 = sub_100537920();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Application will enter foreground; re-starting video",
      (uint8_t *)&v7,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsVideoPlayerView playerItem](self, "playerItem"));
  -[MapsVideoPlayerView _replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:](self, "_replaceCurrentItemWithPlayerItem:preserveCurrentTimestamp:", v6, 1);

}

- (id)playbackDidEndBlock
{
  return self->_playbackDidEndBlock;
}

- (void)setPlaybackDidEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)aspectFill
{
  return self->_aspectFill;
}

- (void)setAspectFill:(BOOL)a3
{
  self->_aspectFill = a3;
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
  objc_storeStrong(&self->_playbackDidEndBlock, 0);
}

@end
