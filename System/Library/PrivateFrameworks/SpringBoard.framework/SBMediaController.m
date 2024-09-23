@implementation SBMediaController

+ (id)sharedInstance
{
  id v2;
  void *v3;
  SBMediaController *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)__controllerInstance_1;
    if (!__controllerInstance_1)
    {
      kdebug_trace();
      v4 = objc_alloc_init(SBMediaController);
      v5 = (void *)__controllerInstance_1;
      __controllerInstance_1 = (uint64_t)v4;

      kdebug_trace();
      v3 = (void *)__controllerInstance_1;
    }
    v2 = v3;
  }
  return v2;
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_1;
}

- (SBMediaController)init
{
  SBMediaController *v2;
  SBMediaController *v3;
  uint64_t v4;
  MPAVRoutingController *routingController;
  uint64_t v6;
  SBVolumeControl *volumeControl;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMediaController;
  v2 = -[SBMediaController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBMediaController _registerForNotifications](v2, "_registerForNotifications");
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithName:", CFSTR("SBMediaController"));
    routingController = v3->_routingController;
    v3->_routingController = (MPAVRoutingController *)v4;

    -[MPAVRoutingController setDelegate:](v3->_routingController, "setDelegate:", v3);
    objc_msgSend((id)SBApp, "volumeControl");
    v6 = objc_claimAutoreleasedReturnValue();
    volumeControl = v3->_volumeControl;
    v3->_volumeControl = (SBVolumeControl *)v6;

  }
  return v3;
}

- (void)dealloc
{
  NSDictionary *nowPlayingInfo;
  objc_super v4;

  -[SBMediaController _unregisterForNotifications](self, "_unregisterForNotifications");
  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", 0);
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBMediaController;
  -[SBMediaController dealloc](&v4, sel_dealloc);
}

+ (BOOL)applicationCanBeConsideredNowPlaying:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRunning"))
    v5 = objc_msgSend(v4, "isForeground");
  else
    v5 = 0;
  if (objc_msgSend(v4, "isRunning") && (objc_msgSend(v4, "isForeground") & 1) == 0)
  {
    objc_msgSend(v3, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "supportsAudioBackgroundMode");

  }
  else
  {
    v6 = 0;
  }

  return v5 | v6;
}

+ (void)sendResetPlaybackTimeoutCommand
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  __int16 v13;
  __int16 v14;

  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", CFSTR("com.apple.Music"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pid");

  if (v5 >= 1)
  {
    v6 = MRMediaRemoteSendCommand();
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v9 = "Successfully sent reset playback timeout command to Music app";
        v10 = (uint8_t *)&v14;
        v11 = v8;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1D0540000, v11, v12, v9, v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v9 = "Unable to send reset playback timeout command to Music app.";
      v10 = (uint8_t *)&v13;
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }

  }
}

- (id)_nowPlayingInfo
{
  int v3;
  NSDictionary *v4;

  v3 = objc_msgSend((id)SBApp, "nowPlayingProcessPID");
  if (v3 == -[SBMediaController nowPlayingProcessPID](self, "nowPlayingProcessPID"))
    v4 = self->_nowPlayingInfo;
  else
    v4 = 0;
  return v4;
}

- (void)setNowPlayingInfo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSDictionary isEqual:](self->_nowPlayingInfo, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBMediaNowPlayingChangedNotification"), self);

  }
}

- (BOOL)hasTrack
{
  void *v2;
  BOOL v3;

  -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFirstTrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isFirstTrack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("isFirstTrack"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isLastTrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isLastTrack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("isLastTrack"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)playingMediaType
{
  void *v2;
  void *v3;

  -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mediaType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPlaying
{
  return self->_lastNowPlayingAppIsPlaying;
}

- (BOOL)isPaused
{
  BOOL v2;
  void *v3;

  if (self->_lastNowPlayingAppIsPlaying)
    return 0;
  -[SBMediaController _nowPlayingInfo](self, "_nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (BOOL)isApplicationActivityActive
{
  return (self->_lastMediaRemoteAppActivityStatus - 1) < 2;
}

- (NSDate)lastActivityDate
{
  return self->_lastActivityDate;
}

- (BOOL)banTrackForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 22, v5);

  return v6;
}

- (BOOL)likeTrackForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 21, v5);

  return v6;
}

- (BOOL)addTrackToWishListForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 23, v5);

  return v6;
}

- (SBApplication)nowPlayingApplication
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_lastNowPlayingApplication)
  {
    if (+[SBMediaController applicationCanBeConsideredNowPlaying:](SBMediaController, "applicationCanBeConsideredNowPlaying:"))
    {
      return self->_lastNowPlayingApplication;
    }
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "nowplayingapp pid returned by mediaserverd was not actually a running app - probably background suspended - so returning nil", v5, 2u);
    }

  }
  return (SBApplication *)0;
}

- (BOOL)suppressHUD
{
  return self->_suppressHUD;
}

- (void)setSuppressHUD:(BOOL)a3
{
  SBVolumeControl *volumeControl;

  if (self->_suppressHUD != a3)
  {
    self->_suppressHUD = a3;
    volumeControl = self->_volumeControl;
    if (a3)
      -[SBVolumeControl addAlwaysHiddenCategory:](volumeControl, "addAlwaysHiddenCategory:", CFSTR("Audio/Video"));
    else
      -[SBVolumeControl removeAlwaysHiddenCategory:](volumeControl, "removeAlwaysHiddenCategory:", CFSTR("Audio/Video"));
  }
}

- (BOOL)_sendMediaCommand:(unsigned int)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  unsigned int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "policyAggregator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsCapability:", 6);

  if ((v8 & 1) == 0)
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109378;
      v15 = a3;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "_sendMediaCommand disallowed by policy; ignoring command:%d options:%{public}@",
        (uint8_t *)&v14,
        0x12u);
    }
    goto LABEL_10;
  }
  v9 = MRMediaRemoteSendCommand();
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBMediaController _sendMediaCommand:options:].cold.1((uint64_t)v5, a3, v11);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109378;
    v15 = a3;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "MRMediaRemoteSendCommand succeeded for command:%d options:%{public}@", (uint8_t *)&v14, 0x12u);
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)changeTrack:(int)a3 eventSource:(int64_t)a4
{
  const __CFString *v5;
  BOOL v6;
  void *v7;
  SBMediaController *v8;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v5 = CFSTR("unknown");
    else
      v5 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 109;
LABEL_8:
    v6 = -[SBMediaController _sendMediaCommand:options:](v8, "_sendMediaCommand:options:", v9, v7);

    return v6;
  }
  if (a3 < 0)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 110;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)beginSeek:(int)a3 eventSource:(int64_t)a4
{
  const __CFString *v5;
  BOOL v6;
  void *v7;
  SBMediaController *v8;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v5 = CFSTR("unknown");
    else
      v5 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 8;
LABEL_8:
    v6 = -[SBMediaController _sendMediaCommand:options:](v8, "_sendMediaCommand:options:", v9, v7);

    return v6;
  }
  if (a3 < 0)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 10;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)endSeek:(int)a3 eventSource:(int64_t)a4
{
  const __CFString *v5;
  BOOL v6;
  void *v7;
  SBMediaController *v8;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v5 = CFSTR("unknown");
    else
      v5 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 9;
LABEL_8:
    v6 = -[SBMediaController _sendMediaCommand:options:](v8, "_sendMediaCommand:options:", v9, v7);

    return v6;
  }
  if (a3 < 0)
  {
    v12 = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E8EA7AB8[a4 - 1];
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 11;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)playForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 0, v5);

  return v6;
}

- (BOOL)pauseForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 1, v5);

  return v6;
}

- (BOOL)togglePlayPauseForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 2, v5);

  return v6;
}

- (BOOL)stopForEventSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CCC0];
  if ((unint64_t)(a3 - 1) > 6)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E8EA7AB8[a3 - 1];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 3, v5);

  return v6;
}

- (BOOL)toggleRepeatForEventSource:(int64_t)a3
{
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D4CCC0];
  v9[0] = *MEMORY[0x1E0D4C810];
  v9[1] = v4;
  v10[0] = MEMORY[0x1E0C9AAB0];
  if ((unint64_t)(a3 - 1) > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E8EA7AB8[a3 - 1];
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 7, v6);

  return v7;
}

- (BOOL)toggleShuffleForEventSource:(int64_t)a3
{
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D4CCC0];
  v9[0] = *MEMORY[0x1E0D4C818];
  v9[1] = v4;
  v10[0] = MEMORY[0x1E0C9AAB0];
  if ((unint64_t)(a3 - 1) > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E8EA7AB8[a3 - 1];
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 6, v6);

  return v7;
}

- (BOOL)setPlaybackSpeed:(int)a3 eventSource:(int64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v5 = *(_QWORD *)&a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "policyAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsCapability:", 6);

  if (v9)
  {
    v14[0] = *MEMORY[0x1E0D4CC88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v14[1] = *MEMORY[0x1E0D4CCC0];
    if ((unint64_t)(a4 - 1) > 6)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E8EA7AB8[a4 - 1];
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMediaController _sendMediaCommand:options:](self, "_sendMediaCommand:options:", 19, v12);
  }
  return v9;
}

- (void)cancelVolumeEvent
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBAudioRoutesChangedNotification"), 0);

}

- (BOOL)handsetRouteIsSelected
{
  return -[MPAVRoutingController handsetRouteIsPicked](self->_routingController, "handsetRouteIsPicked");
}

- (BOOL)volumeControlIsAvailable
{
  return -[MPAVRoutingController volumeControlIsAvailable](self->_routingController, "volumeControlIsAvailable");
}

- (BOOL)routeOtherThanHandsetIsAvailable
{
  return -[MPAVRoutingController routeOtherThanHandsetAvailable](self->_routingController, "routeOtherThanHandsetAvailable");
}

- (BOOL)wirelessDisplayRouteIsPicked
{
  return -[MPAVRoutingController wirelessDisplayRouteIsPicked](self->_routingController, "wirelessDisplayRouteIsPicked");
}

- (id)nameOfPickedRoute
{
  void *v2;
  void *v3;

  -[MPAVRoutingController pickedRoute](self->_routingController, "pickedRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_registerForNotifications
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;

  -[SBMediaController _unregisterForNotifications](self, "_unregisterForNotifications");
  MRMediaRemoteRegisterForNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)__mediaRemoteNowPlayingInfoDidChangeNotification, (CFStringRef)*MEMORY[0x1E0D4CA08], 0, CFNotificationSuspensionBehaviorDrop);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)__mediaRemoteNowPlayingApplicationDidChangeNotification, (CFStringRef)*MEMORY[0x1E0D4C918], 0, CFNotificationSuspensionBehaviorDrop);
  v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)__mediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification, (CFStringRef)*MEMORY[0x1E0D4C920], 0, CFNotificationSuspensionBehaviorDrop);
  v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)__applicationActivityStatusDidChangeNotification, (CFStringRef)*MEMORY[0x1E0D4C6A0], 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_unregisterForNotifications
{
  __CFNotificationCenter *LocalCenter;

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
}

- (void)_mediaRemoteNowPlayingInfoDidChange:(id)a3
{
  MRPlaybackQueueRequestCreateDefault();
  MRMediaRemoteRequestNowPlayingPlaybackQueueSync();
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;

  if (a3)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_cold_1(a3, v5, v6, v7, v8, v9, v10, v11);

  }
  MRPlaybackQueueGetContentItemAtOffset();
  MRContentItemCopyNowPlayingInfo();
  MRMediaRemoteGetLocalOrigin();
  MRMediaRemoteGetNowPlayingClientForOrigin();
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_51(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ProcessIdentifier;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  BOOL v28;
  _BOOL8 v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  const void *v33;

  if (a3)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_51_cold_1(a3, v5, v6, v7, v8, v9, v10, v11);

  }
  ProcessIdentifier = MRNowPlayingClientGetProcessIdentifier();
  if (BSPIDExists())
  {
    v13 = *(id *)(a1 + 40);
    v14 = v13;
    if (v13)
    {
      v15 = *MEMORY[0x1E0D4CAF8];
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D4CAF8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (_QWORD *)MEMORY[0x1E0D4CAD0];
      if (v16)
      {
        objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D4CAD0]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D4CB58]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 != 0;

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

      objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D4CAA0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
      if (v20)
      {
        objc_msgSend(v14, "objectForKey:", *v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        objc_msgSend(v14, "objectForKey:", v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend(v25, "intValue");

        objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D4CB58]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "intValue") == v24;
        v28 = (_DWORD)v23 == 1;
        v29 = (_DWORD)v23 == 1 && v24 == 0;
        v30 = v28 && v27;

      }
      else
      {
        v29 = 0;
        v30 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("isFirstTrack"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v32, CFSTR("isLastTrack"));

      if (v22)
        objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("mediaType"));

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend((id)SBApp, "setNowPlayingInfo:forProcessWithPID:", v21, ProcessIdentifier);
    objc_msgSend(*(id *)(a1 + 32), "setNowPlayingProcessPID:", ProcessIdentifier);

  }
  else
  {
    objc_msgSend((id)SBApp, "setNowPlayingInfo:forProcessWithPID:", 0, 0);
  }
  v33 = *(const void **)(a1 + 40);
  if (v33)
    CFRelease(v33);
}

- (void)_mediaRemoteNowPlayingApplicationDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C930]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithPid:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBMediaController _setNowPlayingApplication:](self, "_setNowPlayingApplication:", v7);
}

- (void)_setNowPlayingApplication:(id)a3
{
  SBApplication *v5;
  SBApplication **p_lastNowPlayingApplication;
  void *v7;
  NSObject *v8;
  SBApplication *v9;
  int v10;
  SBApplication *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (SBApplication *)a3;
  p_lastNowPlayingApplication = &self->_lastNowPlayingApplication;
  if (self->_lastNowPlayingApplication != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBApplicationDidExitNotification"), self->_lastNowPlayingApplication);
    -[SBApplication setPlayingAudio:](self->_lastNowPlayingApplication, "setPlayingAudio:", 0);
    objc_storeStrong((id *)&self->_lastNowPlayingApplication, a3);
    -[SBApplication setPlayingAudio:](self->_lastNowPlayingApplication, "setPlayingAudio:", self->_lastNowPlayingAppIsPlaying);
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *p_lastNowPlayingApplication;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "now playing app is tracked as %@.", (uint8_t *)&v10, 0xCu);
    }

    if (*p_lastNowPlayingApplication)
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__nowPlayingAppDidExit_, CFSTR("SBApplicationDidExitNotification"));
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBMediaNowPlayingAppChangedNotification"), self);

  }
}

- (void)_mediaRemoteNowPlayingApplicationIsPlayingDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C928]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[SBMediaController _updateLastRecentActivityDate](self, "_updateLastRecentActivityDate");
  if (self->_lastNowPlayingAppIsPlaying != (_DWORD)v5)
  {
    self->_lastNowPlayingAppIsPlaying = v5;
    -[SBApplication setPlayingAudio:](self->_lastNowPlayingApplication, "setPlayingAudio:", v5);
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetIdleTimerForReason:", CFSTR("MediaRemoteNowPlayingDidChange"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBMediaNowPlayingChangedNotification"), self);

  }
}

- (void)_applicationActivityStatusDidChange:(id)a3
{
  int v4;
  void *v5;
  const __CFString *v6;
  id v7;

  if (!objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D4C6A8]))
  {
    self->_lastMediaRemoteAppActivityStatus = 0;
    return;
  }
  v4 = MEMORY[0x1D17E32C4]();
  self->_lastMediaRemoteAppActivityStatus = v4;
  if ((v4 - 1) > 1)
  {
    if ((v4 - 3) > 1)
      return;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = CFSTR("SBMediaApplicationActivityDidEndNotification");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = CFSTR("SBMediaApplicationActivityDidBeginNotification");
  }
  objc_msgSend(v5, "postNotificationName:object:", v6, self);

}

- (void)_nowPlayingAppDidExit:(id)a3
{
  SBApplication *lastNowPlayingApplication;
  SBApplication *v5;

  lastNowPlayingApplication = self->_lastNowPlayingApplication;
  objc_msgSend(a3, "object");
  v5 = (SBApplication *)objc_claimAutoreleasedReturnValue();

  if (lastNowPlayingApplication == v5)
  {
    -[SBApplication setPlayingAudio:](self->_lastNowPlayingApplication, "setPlayingAudio:", 0);
    -[SBMediaController _setNowPlayingApplication:](self, "_setNowPlayingApplication:", 0);
  }
}

- (void)_updateLastRecentActivityDate
{
  NSDate *v3;
  NSDate *lastActivityDate;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  lastActivityDate = self->_lastActivityDate;
  self->_lastActivityDate = v3;

}

- (int)nowPlayingProcessPID
{
  return self->_nowPlayingProcessPID;
}

- (void)setNowPlayingProcessPID:(int)a3
{
  self->_nowPlayingProcessPID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivityDate, 0);
  objc_storeStrong((id *)&self->_audioCategoryMusicVolume, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_lastNowPlayingApplication, 0);
  objc_storeStrong((id *)&self->_volumeCommitTimer, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

- (void)_sendMediaCommand:(os_log_t)log options:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "MRMediaRemoteSendCommand failed for command:%d options:%{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Could not retrieve playback queue from Media Remote. Failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_51_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Could not retrieve now playing client. Failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
