@implementation SHSAudioPlayback

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerLooper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableLooping");

  objc_msgSend(WeakRetained, "set_playerLooper:", 0);
  objc_msgSend(WeakRetained, "_queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  objc_msgSend(WeakRetained, "_queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllItems");

  objc_msgSend(WeakRetained, "setRingtoneIdentifier:", 0);
  v5 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2;
  block[3] = &unk_24F1978D0;
  block[4] = WeakRetained;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

- (AVQueuePlayer)_queuePlayer
{
  return self->__queuePlayer;
}

- (void)set_playerLooper:(id)a3
{
  objc_storeStrong((id *)&self->__playerLooper, a3);
}

- (void)setRingtoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ringtoneIdentifier, a3);
}

- (void)stopRingtoneWithFadeOut:(float)a3
{
  NSObject *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  CMTime v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)&v6 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[SHSAudioPlayback stopRingtoneWithFadeOut:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: fadeOutDuration '%{public}@'.", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v13, (uint64_t)(float)(a3 * 100.0), 100);
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setRate:withVolumeRampDuration:", &v13, v9);

  objc_initWeak((id *)buf, self);
  v10 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0) + 10);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke;
  v11[3] = &unk_24F197920;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (SHSAudioPlayback)init
{
  SHSAudioPlayback *v2;
  AVQueuePlayer *v3;
  AVQueuePlayer *queuePlayer;
  uint64_t v5;
  AVAudioSession *audioSession;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id serverConnectionDiedToken;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SHSAudioPlayback;
  v2 = -[SHSAudioPlayback init](&v15, sel_init);
  if (v2)
  {
    v3 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
    queuePlayer = v2->__queuePlayer;
    v2->__queuePlayer = v3;

    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    audioSession = v2->__audioSession;
    v2->__audioSession = (AVAudioSession *)v5;

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE64908];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __24__SHSAudioPlayback_init__block_invoke;
    v12[3] = &unk_24F1978F8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v12);
    v9 = objc_claimAutoreleasedReturnValue();
    serverConnectionDiedToken = v2->__serverConnectionDiedToken;
    v2->__serverConnectionDiedToken = (id)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__SHSAudioPlayback_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerLooper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableLooping");

  objc_msgSend(WeakRetained, "set_playerLooper:", 0);
  objc_msgSend(WeakRetained, "_queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllItems");

  objc_msgSend(WeakRetained, "set_queuePlayer:", 0);
  objc_msgSend(WeakRetained, "set_currentItem:", 0);
  objc_msgSend(WeakRetained, "setRingtoneIdentifier:", 0);
  objc_msgSend(WeakRetained, "set_audioSession:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDB2670]);
  objc_msgSend(WeakRetained, "set_queuePlayer:", v3);

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "set_audioSession:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->__serverConnectionDiedToken);

  -[SHSAudioPlayback _playerLooper](self, "_playerLooper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableLooping");

  -[SHSAudioPlayback set_playerLooper:](self, "set_playerLooper:", 0);
  -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllItems");

  -[SHSAudioPlayback set_queuePlayer:](self, "set_queuePlayer:", 0);
  -[SHSAudioPlayback set_currentItem:](self, "set_currentItem:", 0);
  -[SHSAudioPlayback setRingtoneIdentifier:](self, "setRingtoneIdentifier:", 0);
  -[SHSAudioPlayback set_audioSession:](self, "set_audioSession:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SHSAudioPlayback;
  -[SHSAudioPlayback dealloc](&v6, sel_dealloc);
}

- (void)setAudioSessionCategory
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_228D17000, v2, OS_LOG_TYPE_ERROR, "%s: Failed to set the audio session category to '%{public}@' with error '%{public}@'.", (uint8_t *)v3, 0x20u);
}

- (BOOL)isPlayingRingtone
{
  void *v2;
  float v3;
  BOOL v4;

  -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3 > 0.0;

  return v4;
}

- (void)playRingtoneWithIdentifier:(id)a3 loop:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  SHSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NONE");
    v9 = CFSTR("NO");
    if (v6)
      v8 = v6;
    v39 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
    *(_DWORD *)buf = 136315650;
    v41 = v8;
    v40 = 2114;
    if (v4)
      v9 = CFSTR("YES");
    v42 = 2114;
    v43 = v9;
    _os_log_impl(&dword_228D17000, v7, OS_LOG_TYPE_DEFAULT, "%s: identifier: '%{public}@', loop '%{public}@'.", buf, 0x20u);
  }

  if (v6)
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopPlayback, 0);
  else
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[SHSAudioPlayback _playerLooper](self, "_playerLooper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disableLooping");

  if (v6)
  {
    -[SHSAudioPlayback ringtoneIdentifier](self, "ringtoneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[__CFString isEqualToString:](v6, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllItems");

      objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "filePathForToneIdentifier:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BDB2618];
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "playerItemWithURL:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSAudioPlayback set_currentItem:](self, "set_currentItem:", v18);

      if (v4)
      {
        v19 = (void *)MEMORY[0x24BDB2650];
        -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
        v20 = objc_claimAutoreleasedReturnValue();
        -[SHSAudioPlayback _currentItem](self, "_currentItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "playerLooperWithPlayer:templateItem:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSAudioPlayback set_playerLooper:](self, "set_playerLooper:", v22);

      }
      else
      {
        -[SHSAudioPlayback set_playerLooper:](self, "set_playerLooper:", 0);
        -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSAudioPlayback _currentItem](self, "_currentItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "canInsertItem:afterItem:", v27, 0);

        if (v28)
        {
          -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
          v20 = objc_claimAutoreleasedReturnValue();
          -[SHSAudioPlayback _currentItem](self, "_currentItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject insertItem:afterItem:](v20, "insertItem:afterItem:", v29, 0);

        }
        else
        {
          SHSLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[SHSAudioPlayback playRingtoneWithIdentifier:loop:].cold.2(v20);
        }
      }

      -[SHSAudioPlayback setRingtoneIdentifier:](self, "setRingtoneIdentifier:", v6);
    }
    -[SHSAudioPlayback setAudioSessionCategory](self, "setAudioSessionCategory");
    SHSLogForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
      _os_log_impl(&dword_228D17000, v30, OS_LOG_TYPE_DEFAULT, "%s: Activating audio session prior to playback.", buf, 0xCu);
    }

    -[SHSAudioPlayback _audioSession](self, "_audioSession");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v32 = objc_msgSend(v31, "setActive:error:", 1, &v36);
    v33 = v36;

    if ((v32 & 1) == 0)
    {
      SHSLogForCategory(0);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SHSAudioPlayback playRingtoneWithIdentifier:loop:].cold.1();

    }
    -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "play");

  }
  else
  {
    -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pause");

    -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllItems");

    -[SHSAudioPlayback set_currentItem:](self, "set_currentItem:", 0);
    -[SHSAudioPlayback setRingtoneIdentifier:](self, "setRingtoneIdentifier:", 0);
    v25 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke;
    block[3] = &unk_24F1978D0;
    block[4] = self;
    dispatch_after(v25, MEMORY[0x24BDAC9B8], block);
  }

}

void __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]_block_invoke";
    _os_log_impl(&dword_228D17000, v2, OS_LOG_TYPE_DEFAULT, "%s: Deactivating Audio Session.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(v3, "setActive:withOptions:error:", 0, 1, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    SHSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke_cold_1();

  }
}

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SHSAudioPlayback stopRingtoneWithFadeOut:]_block_invoke_2";
    _os_log_impl(&dword_228D17000, v2, OS_LOG_TYPE_DEFAULT, "%s: Deactivating Audio Session.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(v3, "setActive:withOptions:error:", 0, 1, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    SHSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2_cold_1();

  }
}

- (void)stopPlayback
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSAudioPlayback stopPlayback]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[SHSAudioPlayback _queuePlayer](self, "_queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SHSAudioPlayback playRingtoneWithIdentifier:loop:](self, "playRingtoneWithIdentifier:loop:", 0, 0);
}

- (NSString)ringtoneIdentifier
{
  return self->_ringtoneIdentifier;
}

- (AVAudioSession)_audioSession
{
  return self->__audioSession;
}

- (void)set_audioSession:(id)a3
{
  objc_storeStrong((id *)&self->__audioSession, a3);
}

- (void)set_queuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->__queuePlayer, a3);
}

- (AVPlayerLooper)_playerLooper
{
  return self->__playerLooper;
}

- (AVPlayerItem)_currentItem
{
  return self->__currentItem;
}

- (void)set_currentItem:(id)a3
{
  objc_storeStrong((id *)&self->__currentItem, a3);
}

- (id)_serverConnectionDiedToken
{
  return self->__serverConnectionDiedToken;
}

- (void)set_serverConnectionDiedToken:(id)a3
{
  objc_storeStrong(&self->__serverConnectionDiedToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__serverConnectionDiedToken, 0);
  objc_storeStrong((id *)&self->__currentItem, 0);
  objc_storeStrong((id *)&self->__playerLooper, 0);
  objc_storeStrong((id *)&self->__queuePlayer, 0);
  objc_storeStrong((id *)&self->__audioSession, 0);
  objc_storeStrong((id *)&self->_ringtoneIdentifier, 0);
}

- (void)playRingtoneWithIdentifier:loop:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_228D17000, v0, v1, "%s: Failed to activate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)playRingtoneWithIdentifier:(os_log_t)log loop:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
  _os_log_error_impl(&dword_228D17000, log, OS_LOG_TYPE_ERROR, "%s: Player could not insert item.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_228D17000, v0, v1, "%s: Failed to deactivate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_228D17000, v0, v1, "%s: Failed to deactivate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
