@implementation SRUIFStateFeedbackManager

- (SRUIFStateFeedbackManager)initWithStateFeedbackProvider:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SRUIFStateFeedbackManager *v9;
  SRUIFStateFeedbackManager *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *nowPlayingObserverQueue;
  uint64_t v13;
  SOMediaNowPlayingObserver *nowPlayingObserver;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRUIFStateFeedbackManager;
  v9 = -[SRUIFStateFeedbackManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = dispatch_queue_create("com.apple.siri.stateFeedbackManagerQueue", 0);
    nowPlayingObserverQueue = v10->_nowPlayingObserverQueue;
    v10->_nowPlayingObserverQueue = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE9EAB8]), "initWithQueue:", v10->_nowPlayingObserverQueue);
    nowPlayingObserver = v10->_nowPlayingObserver;
    v10->_nowPlayingObserver = (SOMediaNowPlayingObserver *)v13;

    -[SOMediaNowPlayingObserver addListener:](v10->_nowPlayingObserver, "addListener:", v10);
  }

  return v10;
}

- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SRUIFSiriSessionStateGetDescription(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SRUIFSiriSessionStateGetDescription(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SRUIFStateFeedbackManager didTransitionFromState:toState:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Transitioning fromState: %@ toState: %@", (uint8_t *)&v11, 0x20u);

  }
  if (a4 != 2)
  {
    if (a4 == 1)
      self->_stateFeedbackNeeded = 1;
    else
      -[SRUIFStateFeedbackManager _cancelFeedback](self, "_cancelFeedback");
  }
}

- (void)didUpdateSpeechEndEstimate:(unint64_t)a3
{
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  v5 = 2.75 - v4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRUIFStateFeedbackManager didUpdateSpeechEndEstimate:]";
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_219F26000, v6, OS_LOG_TYPE_DEFAULT, "%s #statefeedback waiting %f seconds until delay tone", (uint8_t *)&v7, 0x16u);
  }
  -[SRUIFStateFeedbackManager _scheduleDelayToneFor:](self, "_scheduleDelayToneFor:", v5);
}

- (void)siriSessionDidEnd
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFStateFeedbackManager siriSessionDidEnd]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback for ui session end", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFStateFeedbackManager _cancelFeedback](self, "_cancelFeedback");
}

- (void)cancelFeedbackWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRUIFStateFeedbackManager cancelFeedbackWithCompletion:]";
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback", (uint8_t *)&v6, 0xCu);
  }
  -[SRUIFStateFeedbackManager _cancelFeedback](self, "_cancelFeedback");
  -[SRUIFStateFeedbackProviding releaseAudioSessionWithCompletion:](self->_provider, "releaseAudioSessionWithCompletion:", v4);

}

- (void)updateResponseMode:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *responseMode;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRUIFStateFeedbackManager updateResponseMode:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback updating response mode to: %@", (uint8_t *)&v7, 0x16u);
  }
  responseMode = self->_responseMode;
  self->_responseMode = v4;

}

- (void)audioPlaybackRequestDidStartForRequest:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFStateFeedbackProviding uuidForCurrentStateFeedback](self->_provider, "uuidForCurrentStateFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !self->_stateFeedbackNeeded || v4 == 0;
  if (!v6 && objc_msgSend(v4, "isEqualToString:", v5))
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SRUIFStateFeedbackManager audioPlaybackRequestDidStartForRequest:]";
      _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #statefeedback audio playback request for state feedback started", (uint8_t *)&v9, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stateFeedbackManagerDidStartPlaybackForStateFeedbackType:", 0);

  }
}

- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
  -[SRUIFStateFeedbackProviding playAudioPlaybackRequest:completion:](self->_provider, "playAudioPlaybackRequest:completion:", a3, a4);
}

- (void)_cancelFeedback
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFStateFeedbackManager _cancelFeedback]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback", (uint8_t *)&v4, 0xCu);
  }
  self->_stateFeedbackNeeded = 0;
  -[AFWatchdogTimer cancelIfNotAlreadyCanceled](self->_delayToneTimer, "cancelIfNotAlreadyCanceled");
  -[SRUIFStateFeedbackProviding cancelFeedback](self->_provider, "cancelFeedback");
}

- (void)_playSuccessFeedback
{
  SRUIFStateFeedbackProviding *provider;
  NSString *responseMode;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  provider = self->_provider;
  responseMode = self->_responseMode;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SRUIFStateFeedbackManager__playSuccessFeedback__block_invoke;
  v5[3] = &unk_24DC1B4F8;
  objc_copyWeak(&v6, &location);
  -[SRUIFStateFeedbackProviding playFeedbackForStateFeedbackType:withResponseMode:completion:](provider, "playFeedbackForStateFeedbackType:withResponseMode:completion:", 1, responseMode, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__SRUIFStateFeedbackManager__playSuccessFeedback__block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 24))
    {
      if (a2)
      {
        v5 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315138;
          v9 = "-[SRUIFStateFeedbackManager _playSuccessFeedback]_block_invoke";
          _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback started, should inform delegate", (uint8_t *)&v8, 0xCu);
        }
        v6 = objc_loadWeakRetained(v4 + 2);
        objc_msgSend(v6, "stateFeedbackManagerDidStartPlaybackForStateFeedbackType:", 1);

      }
    }
    else
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[SRUIFStateFeedbackManager _playSuccessFeedback]_block_invoke";
        _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #statefeedback playDelayFeedback completion called, but no state feedback is needed at this time", (uint8_t *)&v8, 0xCu);
      }
    }
  }

}

- (void)_playDelayFeedback
{
  SRUIFStateFeedbackProviding *provider;
  NSString *responseMode;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  provider = self->_provider;
  responseMode = self->_responseMode;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SRUIFStateFeedbackManager__playDelayFeedback__block_invoke;
  v5[3] = &unk_24DC1B4F8;
  objc_copyWeak(&v6, &location);
  -[SRUIFStateFeedbackProviding playFeedbackForStateFeedbackType:withResponseMode:completion:](provider, "playFeedbackForStateFeedbackType:withResponseMode:completion:", 0, responseMode, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__SRUIFStateFeedbackManager__playDelayFeedback__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 24))
    {
      if (a3)
      {
        v7 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315138;
          v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
          v8 = "%s #statefeedback audio playback request for state feedback started";
LABEL_11:
          _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if (a2 == 1)
      {
        v7 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315138;
          v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
          v8 = "%s #statefeedback state feedback provider decided to inform immediately";
          goto LABEL_11;
        }
LABEL_12:
        v10 = objc_loadWeakRetained(v6 + 2);
        objc_msgSend(v10, "stateFeedbackManagerDidStartPlaybackForStateFeedbackType:", 0);

      }
    }
    else
    {
      v9 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
        _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #statefeedback playDelayFeedback completion called, but no state feedback is needed at this time", (uint8_t *)&v11, 0xCu);
      }
    }
  }

}

- (void)_scheduleDelayToneFor:(double)a3
{
  AFWatchdogTimer *delayToneTimer;
  id v6;
  uint64_t v7;
  id v8;
  AFWatchdogTimer *v9;
  AFWatchdogTimer *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  delayToneTimer = self->_delayToneTimer;
  if (delayToneTimer)
    -[AFWatchdogTimer cancelIfNotAlreadyCanceled](delayToneTimer, "cancelIfNotAlreadyCanceled");
  if (a3 <= 0.0)
  {
    if (self->_stateFeedbackNeeded)
      -[SRUIFStateFeedbackManager _playDelayFeedback](self, "_playDelayFeedback");
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BE093A8]);
    v7 = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __51__SRUIFStateFeedbackManager__scheduleDelayToneFor___block_invoke;
    v14 = &unk_24DC1A810;
    objc_copyWeak(&v15, &location);
    v9 = (AFWatchdogTimer *)objc_msgSend(v6, "initWithTimeoutInterval:onQueue:timeoutHandler:", v7, &v11, a3);
    v10 = self->_delayToneTimer;
    self->_delayToneTimer = v9;

    -[AFWatchdogTimer start](self->_delayToneTimer, "start", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __51__SRUIFStateFeedbackManager__scheduleDelayToneFor___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[24];
      v4 = 136315394;
      v5 = "-[SRUIFStateFeedbackManager _scheduleDelayToneFor:]_block_invoke";
      v6 = 1024;
      v7 = v3;
      _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #statefeedback delay tone timer fired, isWaitingForDelayTone: %d", (uint8_t *)&v4, 0x12u);
    }
    if (WeakRetained[24])
      objc_msgSend(WeakRetained, "_playDelayFeedback");
  }

}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  id v10;
  id v11;
  os_log_t *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (self->_nowPlayingState != a5)
  {
    v12 = (os_log_t *)MEMORY[0x24BE08FB0];
    v13 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      AFMediaPlaybackStateGetName();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AFMediaPlaybackStateGetName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SRUIFStateFeedbackManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_219F26000, v14, OS_LOG_TYPE_DEFAULT, "%s #statefeedback: Media playback state changed from: %@ to: %@", buf, 0x20u);

    }
    self->_nowPlayingState = a5;
    v17 = a4 == 4 || a4 == 2;
    if (v17 && a5 == 1)
    {
      v18 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[SRUIFStateFeedbackManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
        _os_log_impl(&dword_219F26000, v18, OS_LOG_TYPE_DEFAULT, "%s #statefeedback: In process of resuming media, cancel feedback", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __94__SRUIFStateFeedbackManager_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke;
      block[3] = &unk_24DC1A810;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __94__SRUIFStateFeedbackManager_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelFeedback");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserverQueue, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_delayToneTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
