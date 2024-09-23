@implementation TVPPlayerReporter

void __31__TVPPlayerReporter_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPPlayerReporter");
  v1 = (void *)sLogObject_4;
  sLogObject_4 = (uint64_t)v0;

}

- (void)setRtcAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (RTCReporting)rtcAgent
{
  return (RTCReporting *)objc_getProperty(self, a2, 16, 1);
}

- (TVPPlayer)player
{
  return (TVPPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (TVPPlayerReporter)initWithPlayer:(id)a3
{
  id v4;
  TVPPlayerReporter *v5;
  TVPPlayerReporter *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlayerReporter;
  v5 = -[TVPPlayerReporter init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerStateWillChange_, CFSTR("TVPPlaybackStateWillChangeNotification"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerCurrentMediaItemWillChange_, CFSTR("TVPPlaybackCurrentMediaItemWillChangeNotification"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__playerCurrentMediaItemDidChange_, CFSTR("TVPPlaybackCurrentMediaItemDidChangeNotification"), v4);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerReporter;
  -[TVPPlayerReporter dealloc](&v4, sel_dealloc);
}

- (void)_tearDownRTCAgent
{
  -[TVPPlayerReporter setRtcAgent:](self, "setRtcAgent:", 0);
}

- (void)_setupRTCAgent
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  _QWORD v33[7];
  _QWORD v34[8];

  v34[7] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = (__CFString *)v5;
    else
      v6 = &stru_24F15E1B8;
    v7 = *MEMORY[0x24BE7CAD8];
    v33[0] = *MEMORY[0x24BE7CAC8];
    v33[1] = v7;
    v34[0] = &unk_24F1735B8;
    v34[1] = &unk_24F1735D0;
    v33[2] = *MEMORY[0x24BE7CB18];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", arc4random());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE7CAA8];
    v34[2] = v8;
    v34[3] = MEMORY[0x24BDBD1C0];
    v10 = *MEMORY[0x24BE7CB00];
    v33[3] = v9;
    v33[4] = v10;
    v11 = *MEMORY[0x24BE7CAE8];
    v34[4] = MEMORY[0x24BDBD1C8];
    v34[5] = MEMORY[0x24BDBD1C8];
    v12 = *MEMORY[0x24BE7CAB8];
    v33[5] = v11;
    v33[6] = v12;
    v34[6] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[TVPPlayerReporter player](self, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentMediaItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataRTCParentHierarchyToken"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = sLogObject_4;
    v19 = os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, "Using existing RTC hierarchy token in reporter", buf, 2u);
      }
    }
    else
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, "Creating RTC hierarchy tokens in reporter", buf, 2u);
      }
      v17 = (id)objc_msgSend(MEMORY[0x24BE7CA78], "newHierarchyTokenFromParentToken:", 0);
      if (v17)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BE7CA78], "newHierarchyTokenFromParentToken:", v17);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __35__TVPPlayerReporter__setupRTCAgent__block_invoke;
        v27[3] = &unk_24F15D1B8;
        v28 = v16;
        v17 = v17;
        v29 = v17;
        v30 = v20;
        v21 = v20;
        objc_msgSend(v28, "performMediaItemMetadataTransactionWithBlock:", v27);

      }
    }
    v22 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v17;
      _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "RTC hierarchy token for session: %@", buf, 0xCu);
    }
    if (v17)
      objc_msgSend(v14, "setObject:forKey:", v17, *MEMORY[0x24BE7CAF8]);
    v23 = objc_alloc(MEMORY[0x24BE7CA78]);
    -[TVPPlayerReporter _rtcAgentUserInfo](self, "_rtcAgentUserInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithSessionInfo:userInfo:frameworksToCheck:", v14, v24, MEMORY[0x24BDBD1A8]);
    -[TVPPlayerReporter setRtcAgent:](self, "setRtcAgent:", v25);

    -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startConfigurationWithCompletionHandler:", &__block_literal_global_21);

  }
}

- (id)_rtcAgentUserInfo
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executablePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("(UNKNOWN)");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[TVPPlayerReporter player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentMediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataServiceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStoreFrontIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDB2138]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      v12 = v15;
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@)"), v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BE7CB20]);
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x24BE7CB30]);
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("StorefrontID"));
  if (v14)
    objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  return v3;
}

- (void)_playerStateWillChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("TVPPlaybackStateOldStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("TVPPlaybackStateNewStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {
    +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v8)
    {
      -[TVPPlayerReporter _setupRTCAgent](self, "_setupRTCAgent");
      goto LABEL_7;
    }
  }
  else
  {

  }
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    -[TVPPlayerReporter _sendPlaybackStartupEventsIfNecessary](self, "_sendPlaybackStartupEventsIfNecessary");
    -[TVPPlayerReporter _tearDownRTCAgent](self, "_tearDownRTCAgent");
  }
LABEL_7:
  if (v4 != v5)
  {
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v9)
      -[TVPPlayerReporter _sendPlaybackStartupEventsIfNecessary](self, "_sendPlaybackStartupEventsIfNecessary");
  }

}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v8 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Not sending playback startup report on media item will change because player is stopped", v9, 2u);
      }
    }
    else
    {
      -[TVPPlayerReporter _sendPlaybackStartupEventsIfNecessary](self, "_sendPlaybackStartupEventsIfNecessary");
    }
  }

}

- (void)_playerCurrentMediaItemDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayerReporter _tearDownRTCAgent](self, "_tearDownRTCAgent");
  if (v4)
    -[TVPPlayerReporter _setupRTCAgent](self, "_setupRTCAgent");

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportingHierarchyToken, 0);
  objc_storeStrong((id *)&self->_rtcAgent, 0);
  objc_destroyWeak((id *)&self->_player);
}

+ (void)initialize
{
  if (initialize_onceToken_6 != -1)
    dispatch_once(&initialize_onceToken_6, &__block_literal_global_14);
}

- (void)sendPlaybackStartupMetricsManually
{
  void *v3;

  -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVPPlayerReporter _sendPlaybackStartupEventsIfNecessary](self, "_sendPlaybackStartupEventsIfNecessary");
  }
  else
  {
    -[TVPPlayerReporter _setupRTCAgent](self, "_setupRTCAgent");
    -[TVPPlayerReporter _sendPlaybackStartupEventsIfNecessary](self, "_sendPlaybackStartupEventsIfNecessary");
    -[TVPPlayerReporter _tearDownRTCAgent](self, "_tearDownRTCAgent");
  }
}

- (id)reportingHierarchyToken
{
  id reportingHierarchyToken;

  reportingHierarchyToken = self->_reportingHierarchyToken;
  if (!reportingHierarchyToken)
  {
    -[TVPPlayerReporter _setupRTCAgent](self, "_setupRTCAgent");
    reportingHierarchyToken = self->_reportingHierarchyToken;
  }
  return reportingHierarchyToken;
}

uint64_t __35__TVPPlayerReporter__setupRTCAgent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 40), CFSTR("TVPMediaItemMetadataRTCParentHierarchyToken"));
  return objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 48), CFSTR("TVPMediaItemMetadataRTCChildHierarchyToken"));
}

void __35__TVPPlayerReporter__setupRTCAgent__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEBUG))
    __35__TVPPlayerReporter__setupRTCAgent__block_invoke_19_cold_1((uint64_t)v2, v3);

}

- (void)_sendRTCEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v7 = a5;
  v8 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
      objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("event"));
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BE7CA88]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x24BE7CAA0]);

    objc_msgSend(v15, "setObject:forKey:", &unk_24F1735E8, *MEMORY[0x24BE7CA90]);
    if (v14)
      objc_msgSend(v15, "setObject:forKey:", v14, *MEMORY[0x24BE7CA98]);
    -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sendMessageWithDictionary:error:", v15, 0);

    v20 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      v21 = CFSTR("unsuccessful");
      if (v19)
        v21 = CFSTR("successful");
      v23 = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "RTC Sending %@ payload was %@", (uint8_t *)&v23, 0x16u);
    }

  }
  else
  {
    v22 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_ERROR))
      -[TVPReportingSession _sendEvent:withCategory:type:values:].cold.1((uint64_t)v10, v22);
  }

}

- (void)_sendPlaybackStartupEventsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int16 v19;
  void *v20;
  double v21;
  double v22;
  const __CFString *v23;
  BOOL v24;
  __int16 v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayerReporter player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_36;
  if ((objc_msgSend(v5, "complete") & 1) != 0)
    goto LABEL_36;
  objc_msgSend(v5, "setComplete:", 1);
  objc_msgSend(v5, "rtcReportingEventDict");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_36;
  v7 = (void *)v6;
  v8 = objc_msgSend(v5, "videoType");
  v9 = v8;
  v10 = CFSTR("UNDETERMINED");
  if (v8 == 2)
    v10 = CFSTR("HLS");
  if (v8 == 1)
    v11 = CFSTR("FILE");
  else
    v11 = v10;
  -[TVPPlayerReporter _rtcAgentUserInfo](self, "_rtcAgentUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("assetType"));
  -[TVPPlayerReporter rtcAgent](self, "rtcAgent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchReportingStatesWithUserInfo:fetchComplete:", v12, &__block_literal_global_38);

  objc_msgSend(v7, "objectForKey:", TVPPlaybackReportingEventPlaybackStartupResult);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", TVPPlaybackReportingEventValueSuccess) & 1) != 0)
  {
    v15 = 200;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", TVPPlaybackReportingEventValueCancelled) & 1) != 0)
  {
    v15 = 300;
  }
  else if (objc_msgSend(v14, "isEqualToString:", TVPPlaybackReportingEventValueError))
  {
    v15 = 500;
  }
  else
  {
    v15 = 200;
  }
  -[TVPPlayerReporter player](self, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentMediaItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataRentalID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v24 = v18 == 0;
    v25 = 1200;
    goto LABEL_25;
  }
  if (v9 == 1)
  {
    v24 = v18 == 0;
    v25 = 1100;
LABEL_25:
    if (v24)
      v19 = v25;
    else
      v19 = v25 + 1;
    goto LABEL_31;
  }
  if (v9 == 2 && v18)
  {
    v19 = 1001;
  }
  else
  {
    -[TVPPlayerReporter player](self, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "duration");
    v22 = v21;

    if (v22 == 3.40282347e38)
    {
      v23 = CFSTR("LIVE");
    }
    else
    {
      if (v22 == 0.0)
      {
        v19 = 1000;
        goto LABEL_31;
      }
      v23 = CFSTR("VOD");
    }
    v26 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v26, "setObject:forKey:", v23, CFSTR("PlayType"));

    v19 = 1000;
    v7 = v26;
  }
LABEL_31:
  v27 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl(&dword_228A4E000, v27, OS_LOG_TYPE_DEFAULT, "Reporting dict: %@", buf, 0xCu);
  }
  -[TVPPlayerReporter _sendRTCEvent:withCategory:type:values:](self, "_sendRTCEvent:withCategory:type:values:", CFSTR("playbackStartup"), v19, v15, v7);
  if (MGGetBoolAnswer())
  {
    -[TVPPlayerReporter player](self, "player");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("app playback startup metrics: %@"), v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPlaybackHUDString:", v29);

  }
LABEL_36:

}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (void)setReportingHierarchyToken:(id)a3
{
  objc_storeStrong(&self->_reportingHierarchyToken, a3);
}

void __35__TVPPlayerReporter__setupRTCAgent__block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_228A4E000, a2, OS_LOG_TYPE_DEBUG, "RTCReporting backends: %@", (uint8_t *)&v2, 0xCu);
}

@end
