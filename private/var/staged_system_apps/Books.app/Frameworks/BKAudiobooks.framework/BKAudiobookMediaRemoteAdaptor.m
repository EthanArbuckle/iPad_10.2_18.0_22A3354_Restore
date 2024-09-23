@implementation BKAudiobookMediaRemoteAdaptor

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if ((id)objc_opt_class(BKAudiobookMediaRemoteAdaptor) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = CFSTR("BKRemoteSkipInsteadOfNextTrackDefaultKey");
    v5 = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (id)startAdaptor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18B70;
  block[3] = &unk_390A0;
  block[4] = a1;
  if (qword_44EB8 != -1)
    dispatch_once(&qword_44EB8, block);
  return (id)qword_44EC0;
}

- (BKAudiobookMediaRemoteAdaptor)initWithPlayer:(id)a3
{
  id v5;
  BKAudiobookMediaRemoteAdaptor *v6;
  BKAudiobookMediaRemoteAdaptor *v7;
  void *v8;
  unsigned int v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
  v6 = -[BKAudiobookMediaRemoteAdaptor init](&v49, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v7->_skipBehavior = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("BKRemoteSkipInsteadOfNextTrackDefaultKey"));

    -[BKAudiobookMediaRemoteAdaptor setSkipBehavior:](v7, "setSkipBehavior:", v9 ^ 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playCommand"));
    objc_msgSend(v11, "addTarget:action:", v7, "onPlayCommand:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playCommand"));
    objc_msgSend(v12, "setEnabled:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pauseCommand"));
    objc_msgSend(v13, "addTarget:action:", v7, "onPauseCommand:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pauseCommand"));
    objc_msgSend(v14, "setEnabled:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stopCommand"));
    objc_msgSend(v15, "addTarget:action:", v7, "onPauseCommand:");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stopCommand"));
    objc_msgSend(v16, "setEnabled:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "togglePlayPauseCommand"));
    objc_msgSend(v17, "addTarget:action:", v7, "onTogglePlayPauseCommand:");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "togglePlayPauseCommand"));
    objc_msgSend(v18, "setEnabled:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playItemInQueueCommand"));
    objc_msgSend(v19, "addTarget:action:", v7, "onPlayItemInQueueCommand:");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playItemInQueueCommand"));
    objc_msgSend(v20, "setEnabled:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextTrackCommand"));
    objc_msgSend(v21, "addTarget:action:", v7, "onNextTrackCommand:");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextTrackCommand"));
    objc_msgSend(v22, "setEnabled:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "previousTrackCommand"));
    objc_msgSend(v23, "addTarget:action:", v7, "onPrevTrackCommand:");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "previousTrackCommand"));
    objc_msgSend(v24, "setEnabled:", 1);

    -[BKAudiobookMediaRemoteAdaptor _setSkipForwardCommand](v7, "_setSkipForwardCommand");
    -[BKAudiobookMediaRemoteAdaptor _setSkipBackwardCommand](v7, "_setSkipBackwardCommand");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "seekForwardCommand"));
    objc_msgSend(v25, "addTarget:action:", v7, "onSeekForwardCommand:");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "seekForwardCommand"));
    objc_msgSend(v26, "setEnabled:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "seekBackwardCommand"));
    objc_msgSend(v27, "addTarget:action:", v7, "onSeekBackwardCommand:");

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "seekBackwardCommand"));
    objc_msgSend(v28, "setEnabled:", 1);

    -[BKAudiobookPlayer playbackRate](v7->_player, "playbackRate");
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackRateCommand"));
    LODWORD(v32) = v30;
    objc_msgSend(v31, "setPreferredRate:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer precisionRates](v7->_player, "precisionRates"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackRateCommand"));
    objc_msgSend(v34, "setSupportedPlaybackRates:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackRateCommand"));
    objc_msgSend(v35, "addTarget:action:", v7, "onChangePlaybackRateCommand:");

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackRateCommand"));
    objc_msgSend(v36, "setEnabled:", 1);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackPositionCommand"));
    objc_msgSend(v37, "setCanBeControlledByScrubbing:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackPositionCommand"));
    objc_msgSend(v38, "addTarget:action:", v7, "onChangePlaybackPositionCommand:");

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changePlaybackPositionCommand"));
    objc_msgSend(v39, "setEnabled:", 1);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "specialSeekForwardCommand"));
    objc_msgSend(v40, "addTarget:action:", v7, "onSpecialSeekForwardCommand:");

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "specialSeekForwardCommand"));
    objc_msgSend(v41, "setEnabled:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "specialSeekBackwardCommand"));
    objc_msgSend(v42, "addTarget:action:", v7, "onSpecialSeekBackwardCommand:");

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "specialSeekBackwardCommand"));
    objc_msgSend(v43, "setEnabled:", 1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v44, "addObserver:forKeyPath:options:context:", v7, CFSTR("BKRemoteSkipInsteadOfNextTrackDefaultKey"), 1, off_44B38);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](v7, "player"));
    objc_msgSend(v45, "addObserver:", v7);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](v7, "player"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "skipController"));
    objc_msgSend(v47, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("BKRemoteSkipInsteadOfNextTrackDefaultKey"), off_44B38);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "skipController"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
  -[BKAudiobookMediaRemoteAdaptor dealloc](&v7, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD);
  objc_super v15;
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_44B38 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1935C;
    v18[3] = &unk_390C8;
    v19 = v12;
    objc_copyWeak(&v20, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_193F4;
        block[3] = &unk_386C0;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
    -[BKAudiobookMediaRemoteAdaptor observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (int64_t)onPlayCommand:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v8;
  void *v9;
  MPRemoteCommandEvent *v10;
  uint8_t v12[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "play", v12, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v9, "play");

  v10 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onPlayItemInQueueCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  int64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  MPRemoteCommandEvent *v23;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "play item in queue", buf, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentItemID"));
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentAudiobook"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chapters"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_196C4;
    v25[3] = &unk_390F0;
    v13 = v9;
    v26 = v13;
    v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v25);

    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = BKAudiobooksMediaRemoteLog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_21D88((uint64_t)v13, v16, v17);
      v18 = 200;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
      v22 = objc_msgSend(v21, "currentChapterIndex");

      if (v14 == v22)
      {
        v18 = 0;
LABEL_15:
        v20 = v26;
        goto LABEL_16;
      }
      v16 = objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
      -[NSObject playChapterAtIndex:](v16, "playChapterAtIndex:", v14);
      v18 = 0;
    }

    goto LABEL_15;
  }
  v19 = BKAudiobooksMediaRemoteLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_21D48(v20);
  v18 = 200;
LABEL_16:

  v23 = *p_currentEvent;
  *p_currentEvent = 0;

  return v18;
}

- (int64_t)onPauseCommand:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v8;
  void *v9;
  MPRemoteCommandEvent *v10;
  uint8_t v12[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "pause", v12, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v9, "pause");

  v10 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onTogglePlayPauseCommand:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v8;
  void *v9;
  MPRemoteCommandEvent *v10;
  uint8_t v12[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "toggle playPause", v12, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v9, "togglePlayPause");

  v10 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onNextTrackCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  int64_t v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  void *v13;
  MPRemoteCommandEvent *v14;
  uint8_t v16[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "next track", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v9 = -[BKAudiobookMediaRemoteAdaptor skipBehavior](self, "skipBehavior");
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
      v11 = objc_msgSend(v10, "nextChapterOrRestartAudiobook");

      if (v11)
        v12 = 0;
      else
        v12 = 200;
    }
    else
    {
      v12 = 200;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor _skipForwardCommandEvent](self, "_skipForwardCommandEvent"));
    v12 = -[BKAudiobookMediaRemoteAdaptor onSkipForward:](self, "onSkipForward:", v13);

  }
  v14 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onPrevTrackCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  int64_t v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  void *v13;
  MPRemoteCommandEvent *v14;
  uint8_t v16[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "prev track", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v9 = -[BKAudiobookMediaRemoteAdaptor skipBehavior](self, "skipBehavior");
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
      v11 = objc_msgSend(v10, "previousChapterOrRestartChapter");

      if (v11)
        v12 = 0;
      else
        v12 = 200;
    }
    else
    {
      v12 = 200;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor _skipBackwardCommandEvent](self, "_skipBackwardCommandEvent"));
    v12 = -[BKAudiobookMediaRemoteAdaptor onSkipBackward:](self, "onSkipBackward:", v13);

  }
  v14 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onSkipForward:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v8;
  void *v9;
  void *v10;
  int64_t v11;
  MPRemoteCommandEvent *v12;
  uint8_t v14[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "skip forward", v14, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "skipController"));

  -[MPRemoteCommandEvent interval](v8, "interval");
  if (objc_msgSend(v10, "singleSkip:interval:", 1))
    v11 = 0;
  else
    v11 = 200;
  v12 = self->_currentEvent;
  self->_currentEvent = 0;

  return v11;
}

- (int64_t)onSkipBackward:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v8;
  void *v9;
  void *v10;
  int64_t v11;
  MPRemoteCommandEvent *v12;
  uint8_t v14[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "skip backward", v14, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v8 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "skipController"));

  -[MPRemoteCommandEvent interval](v8, "interval");
  if (objc_msgSend(v10, "singleSkip:interval:", 0))
    v11 = 0;
  else
    v11 = 200;
  v12 = self->_currentEvent;
  self->_currentEvent = 0;

  return v11;
}

- (int64_t)onSeekForwardCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  void *v9;
  void *v10;
  char *v11;
  unsigned int v12;
  int64_t v13;
  MPRemoteCommandEvent *v14;
  uint8_t v16[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "seek forward", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "skipController"));

  v11 = (char *)objc_msgSend(v5, "type");
  if (v11 == (_BYTE *)&dword_0 + 1)
  {
    v12 = objc_msgSend(v10, "endSeek");
  }
  else
  {
    if (v11)
    {
      v13 = 200;
      goto LABEL_11;
    }
    v12 = objc_msgSend(v10, "startSeek:", 1);
  }
  if (v12)
    v13 = 0;
  else
    v13 = 200;
LABEL_11:
  v14 = *p_currentEvent;
  *p_currentEvent = 0;

  return v13;
}

- (int64_t)onSeekBackwardCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  void *v9;
  void *v10;
  char *v11;
  unsigned int v12;
  int64_t v13;
  MPRemoteCommandEvent *v14;
  uint8_t v16[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "seek backward", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "skipController"));

  v11 = (char *)objc_msgSend(v5, "type");
  if (v11 == (_BYTE *)&dword_0 + 1)
  {
    v12 = objc_msgSend(v10, "endSeek");
  }
  else
  {
    if (v11)
    {
      v13 = 200;
      goto LABEL_11;
    }
    v12 = objc_msgSend(v10, "startSeek:", 0);
  }
  if (v12)
    v13 = 0;
  else
    v13 = 200;
LABEL_11:
  v14 = *p_currentEvent;
  *p_currentEvent = 0;

  return v13;
}

- (int64_t)onSpecialSeekForwardCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  int64_t v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  id v13;
  NSObject *v14;
  MPRemoteCommandEvent *v15;
  void *v17;
  uint8_t v18[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "special seek forward", v18, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  if (objc_msgSend(v5, "type") != (char *)&dword_0 + 3)
  {
    v13 = BKAudiobooksMediaRemoteLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21DF4(v5, v14);

LABEL_12:
    v12 = 200;
    goto LABEL_13;
  }
  v9 = -[BKAudiobookMediaRemoteAdaptor skipBehavior](self, "skipBehavior");
  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor _skipForwardCommandEvent](self, "_skipForwardCommandEvent"));
    v12 = -[BKAudiobookMediaRemoteAdaptor onSkipForward:](self, "onSkipForward:", v17);

    goto LABEL_13;
  }
  if (v9 != 1)
    goto LABEL_12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v11 = objc_msgSend(v10, "nextChapterOrRestartAudiobook");

  if (v11)
    v12 = 0;
  else
    v12 = 200;
LABEL_13:
  v15 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onSpecialSeekBackwardCommand:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MPRemoteCommandEvent **p_currentEvent;
  int64_t v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  id v13;
  NSObject *v14;
  MPRemoteCommandEvent *v15;
  void *v17;
  uint8_t v18[16];

  v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "special seek backward", v18, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  if (objc_msgSend(v5, "type") != (char *)&dword_0 + 3)
  {
    v13 = BKAudiobooksMediaRemoteLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21DF4(v5, v14);

LABEL_12:
    v12 = 200;
    goto LABEL_13;
  }
  v9 = -[BKAudiobookMediaRemoteAdaptor skipBehavior](self, "skipBehavior");
  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor _skipBackwardCommandEvent](self, "_skipBackwardCommandEvent"));
    v12 = -[BKAudiobookMediaRemoteAdaptor onSkipBackward:](self, "onSkipBackward:", v17);

    goto LABEL_13;
  }
  if (v9 != 1)
    goto LABEL_12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v11 = objc_msgSend(v10, "previousChapterOrRestartChapter");

  if (v11)
    v12 = 0;
  else
    v12 = 200;
LABEL_13:
  v15 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onChangePlaybackRateCommand:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "change playback rate", v12, 2u);
  }

  objc_msgSend(v4, "playbackRate");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  LODWORD(v10) = v8;
  objc_msgSend(v9, "setPlaybackRate:", v10);

  return 0;
}

- (int64_t)onChangePlaybackPositionCommand:(id)a3
{
  MPRemoteCommandEvent *v4;
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  MPRemoteCommandEvent *currentEvent;
  MPRemoteCommandEvent *v14;
  void *v15;
  MPRemoteCommandEvent *v16;
  uint8_t v18[16];

  v4 = (MPRemoteCommandEvent *)a3;
  v5 = BKAudiobooksMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "playback position", v18, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v7, "durationOfCurrentChapter");
  v9 = v8;

  v10 = v9 + -0.1;
  -[MPRemoteCommandEvent positionTime](v4, "positionTime");
  if (v10 < v11)
    v11 = v10;
  v12 = fmax(v11, 0.0);
  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  v14 = v4;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  objc_msgSend(v15, "movePositionInCurrentChapter:completion:", 0, v12);

  v16 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (id)_skipForwardCommandEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "skipForwardCommand"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredIntervals"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  objc_msgSend(v5, "doubleValue");
  v6 = objc_msgSend(v3, "newCommandEventWithInterval:");

  return v6;
}

- (id)_skipBackwardCommandEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "skipBackwardCommand"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredIntervals"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  objc_msgSend(v5, "doubleValue");
  v6 = objc_msgSend(v3, "newCommandEventWithInterval:");

  return v6;
}

- (void)_setSkipForwardCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipForwardCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "skipController"));
  objc_msgSend(v6, "forwardSkipTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v4, "setPreferredIntervals:", v8);

  objc_msgSend(v4, "addTarget:action:", self, "onSkipForward:");
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_setSkipBackwardCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipBackwardCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMediaRemoteAdaptor player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "skipController"));
  objc_msgSend(v6, "backwardSkipTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v4, "setPreferredIntervals:", v8);

  objc_msgSend(v4, "addTarget:action:", self, "onSkipBackward:");
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)skipControllerSettingsDidChange:(id)a3
{
  -[BKAudiobookMediaRemoteAdaptor _setSkipForwardCommand](self, "_setSkipForwardCommand", a3);
  -[BKAudiobookMediaRemoteAdaptor _setSkipBackwardCommand](self, "_setSkipBackwardCommand");
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  void *v5;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "changePlaybackRateCommand"));
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPreferredRate:", v6);

}

- (MPRemoteCommandEvent)currentEvent
{
  return self->_currentEvent;
}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (int64_t)skipBehavior
{
  return self->_skipBehavior;
}

- (void)setSkipBehavior:(int64_t)a3
{
  self->_skipBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_currentEvent, 0);
}

@end
