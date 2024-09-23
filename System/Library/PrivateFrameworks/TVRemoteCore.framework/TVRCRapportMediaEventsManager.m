@implementation TVRCRapportMediaEventsManager

- (TVRCRapportMediaEventsManager)initWithCompanionLinkClient:(id)a3 supportsDirectCaptionQueries:(BOOL)a4 eventHandler:(id)a5
{
  id v8;
  id v9;
  TVRCRapportMediaEventsManager *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id eventHandler;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TVRCRapportMediaEventsManager;
  v10 = -[TVRCRapportMediaEventsManager init](&v27, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE7CC28]);
    -[TVRCRapportMediaEventsManager setMediaSession:](v10, "setMediaSession:", v11);

    -[TVRCRapportMediaEventsManager mediaSession](v10, "mediaSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessenger:", v8);

    v13 = objc_msgSend(v9, "copy");
    eventHandler = v10->_eventHandler;
    v10->_eventHandler = (id)v13;

    v10->_supportsDirectCaptionQueries = a4;
    objc_initWeak(&location, v10);
    -[TVRCRapportMediaEventsManager mediaSession](v10, "mediaSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke;
    v23[3] = &unk_24DCD7230;
    objc_copyWeak(&v25, &location);
    v17 = v8;
    v24 = v17;
    objc_msgSend(v15, "setMediaControlFlagsChangedHandler:", v23);

    -[TVRCRapportMediaEventsManager mediaSession](v10, "mediaSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3;
    v20[3] = &unk_24DCD8658;
    v21 = v17;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v18, "activateWithCompletion:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TVRCMediaEventsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "MediaControlFlagsChangedHandler called for companionLinkClient <%{public}@>", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "mediaSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mediaControlFlags");

    _TVRCMediaEventsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v6 & 0x100) != 0)
    {
      if (v8)
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "RPMediaControlFlagsVolume available for <%{public}@>", buf, 0xCu);
      }

      v11 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 10);
      v12 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 11);
      v13 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 29);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setVolumeCommands:", v14);

    }
    else
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "RPMediaControlFlagsVolume not available for companionLinkClient <%{public}@>", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "setVolumeCommands:", 0);
    }
    objc_msgSend(WeakRetained, "_setupMediaCommands:", v6);
    objc_msgSend(WeakRetained, "eventHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(WeakRetained, "eventHandler");
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v16[2]();

    }
  }

}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *WeakRetained;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCMediaEventsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_21A51B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "MediaSession activated for companionLinkClient <%{public}@>", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _refreshCaptionState](WeakRetained, "_refreshCaptionState");
  }

}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[TVRCRapportMediaEventsManager mediaSession](self, "mediaSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[TVRCRapportMediaEventsManager setMediaSession:](self, "setMediaSession:", 0);
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated MediaManager", v5, 2u);
  }

}

- (NSSet)supportedMediaCommands
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[TVRCRapportMediaEventsManager volumeCommands](self, "volumeCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRCRapportMediaEventsManager volumeCommands](self, "volumeCommands");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v5);

  }
  -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v7);

  }
  -[TVRCRapportMediaEventsManager supportedCaptionEvents](self, "supportedCaptionEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v9;
}

- (BOOL)volumeSupported
{
  void *v2;
  BOOL v3;

  -[TVRCRapportMediaEventsManager volumeCommands](self, "volumeCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)sendMediaEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  int v22;
  _QWORD v23[4];
  int v24;
  _QWORD v25[4];
  id v26;
  _BYTE location[12];
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "buttonType");

  if ((unint64_t)(v6 - 16) > 2)
  {
    v9 = -[TVRCRapportMediaEventsManager _commandForMediaButtonEvent:](self, "_commandForMediaButtonEvent:", v4);
    if ((_DWORD)v9 == 7)
    {
      if (v6 == 31)
      {
        v10 = -9999999.0;
      }
      else
      {
        objc_msgSend(v4, "button");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "properties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("TVRCButtonSkipInterval"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = 10.0;
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "doubleValue");
            v10 = v17;
          }
        }

      }
      _TVRCMediaEventsLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "SkipBy";
        v28 = 2048;
        v29 = v10;
        _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Sending %s with skipInterval=%f", location, 0x16u);
      }

      -[TVRCRapportMediaEventsManager mediaSession](self, "mediaSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x24BE7CC80];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7;
      v23[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
      v24 = 7;
      objc_msgSend(v19, "mediaSkipBySeconds:destinationID:completion:", v20, v23, v10);

    }
    else
    {
      v11 = v9;
      -[TVRCRapportMediaEventsManager mediaSession](self, "mediaSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BE7CC80];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_8;
      v21[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
      v22 = v11;
      objc_msgSend(v12, "mediaCommand:destinationID:completion:", v11, v13, v21);

    }
  }
  else
  {
    v7 = -[TVRCRapportMediaEventsManager _captionSettingForButtonEvent:](self, "_captionSettingForButtonEvent:", v4);
    objc_initWeak((id *)location, self);
    -[TVRCRapportMediaEventsManager mediaSession](self, "mediaSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke;
    v25[3] = &unk_24DCD81E8;
    objc_copyWeak(&v26, (id *)location);
    objc_msgSend(v8, "mediaCaptionSettingSet:destinationID:completion:", v7, *MEMORY[0x24BE7CC80], v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }

}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCMediaEventsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Media caption setting set for RPDestinationIdentifierDirectPeer", v13, 2u);
      }

      objc_msgSend(WeakRetained, "_refreshCaptionState");
    }
  }

}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRCMediaEventsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1();

  }
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRCMediaEventsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1();

  }
}

- (void)_setupMediaCommands:(unint64_t)a3
{
  __int16 v3;
  NSObject *v5;
  NSMutableSet *v6;
  NSMutableSet *mediaCommands;
  void *v8;
  TVRCButton *v9;
  void *v10;
  id v11;
  void *v12;
  TVRCButton *v13;
  void *v14;
  id v15;
  void *v16;
  TVRCButton *v17;
  void *v18;
  id v19;
  void *v20;
  TVRCButton *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  _TVRCMediaEventsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[TVRCRapportMediaEventsManager _setupMediaCommands:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  mediaCommands = self->_mediaCommands;
  self->_mediaCommands = v6;

  v34[0] = CFSTR("_TVRCButtonLongPressBeginAction");
  v34[1] = CFSTR("_TVRCButtonLongPressEndAction");
  v35[0] = &unk_24DCF91D0;
  v35[1] = &unk_24DCF91E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 0x200) != 0)
  {
    v9 = [TVRCButton alloc];
    v32 = CFSTR("TVRCButtonSkipInterval");
    v33 = &unk_24DCF93C8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v9, "_initWithButtonType:hasTapAction:properties:", 6, 1, v10);

    -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    if ((v3 & 0x400) == 0)
    {
LABEL_5:
      if ((v3 & 4) == 0)
        goto LABEL_6;
LABEL_10:
      v17 = [TVRCButton alloc];
      if ((v3 & 0x10) != 0)
        v18 = v8;
      else
        v18 = (void *)MEMORY[0x24BDBD1B8];
      v19 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v17, "_initWithButtonType:hasTapAction:properties:", 8, 1, v18);
      -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v19);

      if ((v3 & 8) == 0)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x400) == 0)
  {
    goto LABEL_5;
  }
  v13 = [TVRCButton alloc];
  v30 = CFSTR("TVRCButtonSkipInterval");
  v31 = &unk_24DCF93D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v13, "_initWithButtonType:hasTapAction:properties:", 7, 1, v14);

  -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

  if ((v3 & 4) != 0)
    goto LABEL_10;
LABEL_6:
  if ((v3 & 8) != 0)
  {
LABEL_14:
    v21 = [TVRCButton alloc];
    if ((v3 & 0x20) != 0)
    {
      v23 = 1;
      v22 = v8;
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDBD1B8];
      v23 = 0;
    }
    v24 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v21, "_initWithButtonType:hasTapAction:properties:", 9, v23, v22);
    -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v24);

  }
LABEL_18:
  _TVRCMediaEventsLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRCRapportMediaEventsManager mediaCommands](self, "mediaCommands");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v29;
    _os_log_impl(&dword_21A51B000, v26, OS_LOG_TYPE_DEFAULT, "Supported media commands \n%{public}@", buf, 0xCu);

  }
}

- (int)_commandForMediaButtonEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  __CFString **v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v3, "eventType"))
  {
    case 0:
    case 3:
      objc_msgSend(v3, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "buttonType");
      goto LABEL_7;
    case 1:
      v9 = _TVRCButtonLongPressBeginActionKey;
      goto LABEL_6;
    case 2:
      v9 = _TVRCButtonLongPressEndActionKey;
LABEL_6:
      objc_msgSend(v5, "objectForKey:", *v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");
LABEL_7:
      v10 = v7;

      if (v10 <= 199)
      {
        switch(v10)
        {
          case 6:
          case 7:
            v11 = 7;
            break;
          case 8:
            v11 = 3;
            break;
          case 9:
            v11 = 4;
            break;
          default:
            if (v10 == 31)
              v11 = 7;
            else
              v11 = 0;
            break;
        }
LABEL_24:
        _TVRCMediaEventsLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = off_24DCD8730[v11];
          v15 = 136315650;
          v16 = "-[TVRCRapportMediaEventsManager _commandForMediaButtonEvent:]";
          v17 = 2114;
          v18 = v3;
          v19 = 2080;
          v20 = v13;
          _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "%s event=%{public}@, command=%s", (uint8_t *)&v15, 0x20u);
        }

        v8 = v11;
      }
      else
      {
        switch(v10)
        {
          case 200:
            v11 = 8;
            goto LABEL_24;
          case 201:
            v11 = 9;
            goto LABEL_24;
          case 202:
            v11 = 10;
            goto LABEL_24;
          case 203:
            v11 = 11;
            goto LABEL_24;
          case 204:
            v11 = 1;
            goto LABEL_24;
          case 205:
            v11 = 2;
            goto LABEL_24;
          default:
            v11 = 0;
            v8 = 0;
            if (v10 != 9999)
              goto LABEL_24;
            break;
        }
      }
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (int)_captionSettingForButtonEvent:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");

  if ((unint64_t)(v4 - 16) > 2)
    return 0;
  else
    return dword_21A5D4FE0[v4 - 16];
}

- (void)_refreshCaptionState
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!-[TVRCRapportMediaEventsManager supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"))
  {
    _TVRCMediaEventsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[TVRCRapportMediaEventsManager _refreshCaptionState]";
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[TVRCRapportMediaEventsManager mediaSession](self, "mediaSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke;
    v5[3] = &unk_24DCD86A0;
    objc_copyWeak(&v6, (id *)buf);
    objc_msgSend(v4, "mediaCaptionSettingGetFromDestinationID:completion:", *MEMORY[0x24BE7CC80], v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *WeakRetained;
  void *v16;
  void (**v17)(void);
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _TVRCMediaEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
LABEL_4:

    goto LABEL_5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 4)
      v14 = "?";
    else
      v14 = off_24DCD8790[(int)a2];
    v18 = 136315138;
    v19 = v14;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Current caption setting is %s", (uint8_t *)&v18, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    -[NSObject setCurrentSetting:](WeakRetained, "setCurrentSetting:", a2);
    -[NSObject eventHandler](v7, "eventHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[NSObject eventHandler](v7, "eventHandler");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();

    }
    goto LABEL_4;
  }
LABEL_5:

}

- (id)supportedCaptionEvents
{
  id v3;
  int v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = -[TVRCRapportMediaEventsManager currentSetting](self, "currentSetting");
  if (v4 <= 3)
  {
    v5 = -[TVRCButton _initWithButtonType:hasTapAction:properties:]([TVRCButton alloc], "_initWithButtonType:hasTapAction:properties:", qword_21A5D4FF0[v4], 1, 0);
    objc_msgSend(v3, "addObject:", v5);

  }
  _TVRCMediaEventsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[TVRCRapportMediaEventsManager currentSetting](self, "currentSetting");
    if (v7 > 4)
      v8 = "?";
    else
      v8 = off_24DCD8790[v7];
    objc_msgSend(v3, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Supported Caption Events for current settings=%s, events=\n%{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSSet)volumeCommands
{
  return self->_volumeCommands;
}

- (void)setVolumeCommands:(id)a3
{
  objc_storeStrong((id *)&self->_volumeCommands, a3);
}

- (NSMutableSet)mediaCommands
{
  return self->_mediaCommands;
}

- (void)setMediaCommands:(id)a3
{
  objc_storeStrong((id *)&self->_mediaCommands, a3);
}

- (RPMediaControlSession)mediaSession
{
  return self->_mediaSession;
}

- (void)setMediaSession:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSession, a3);
}

- (BOOL)supportsDirectCaptionQueries
{
  return self->_supportsDirectCaptionQueries;
}

- (void)setSupportsDirectCaptionQueries:(BOOL)a3
{
  self->_supportsDirectCaptionQueries = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)currentSetting
{
  return self->_currentSetting;
}

- (void)setCurrentSetting:(int)a3
{
  self->_currentSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_mediaCommands, 0);
  objc_storeStrong((id *)&self->_volumeCommands, 0);
}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not create mediaSession for companionLinkClient <%{public}@>, error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Could not set media caption setting for companionLinkClient, error - %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not send %s, error=%{public}@");
  OUTLINED_FUNCTION_2();
}

void __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Could not get current caption settings error= %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
