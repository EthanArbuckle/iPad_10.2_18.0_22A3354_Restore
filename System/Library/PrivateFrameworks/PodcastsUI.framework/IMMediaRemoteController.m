@implementation IMMediaRemoteController

- (IMMediaRemoteController)initWithPlayer:(id)a3
{
  id v5;
  IMMediaRemoteController *v6;
  IMMediaRemoteController *v7;
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
  uint64_t v20;
  NSArray *supportedPlaybackRates;
  void *v22;
  void *v23;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[IMMediaRemoteController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 1);
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 0);
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v11;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 4);
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v13;
    v14 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 2);
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v15;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 5);
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v17;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", 3);
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
    v20 = objc_claimAutoreleasedReturnValue();
    supportedPlaybackRates = v7->_supportedPlaybackRates;
    v7->_supportedPlaybackRates = (NSArray *)v20;

    objc_msgSend(v5, "commandCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMediaRemoteController setRemoteCommandCenter:](v7, "setRemoteCommandCenter:", v22);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v7, sel__updatePlaybackSpeed, CFSTR("IMAVPlayerNotification_PlaybackSpeedChanged"), 0);

    -[IMMediaRemoteController _updatePlaybackSpeed](v7, "_updatePlaybackSpeed");
  }

  return v7;
}

- (void)setRemoteCommandCenter:(id)a3
{
  MPRemoteCommandCenter *v5;
  MPRemoteCommandCenter *v6;
  MPRemoteCommandCenter *remoteCommandCenter;
  MPRemoteCommandCenter *v8;

  v5 = (MPRemoteCommandCenter *)a3;
  v6 = v5;
  remoteCommandCenter = self->_remoteCommandCenter;
  if (remoteCommandCenter != v5)
  {
    v8 = v5;
    if (remoteCommandCenter)
      -[IMMediaRemoteController tearDownRemoteCommandCenter:](self, "tearDownRemoteCommandCenter:");
    objc_storeStrong((id *)&self->_remoteCommandCenter, a3);
    v6 = v8;
    if (v8)
    {
      -[IMMediaRemoteController setupRemoteCommandCenter:](self, "setupRemoteCommandCenter:", v8);
      v6 = v8;
    }
  }

}

- (void)setupRemoteCommandCenter:(id)a3
{
  id v4;
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
  id v17;

  v4 = a3;
  objc_msgSend(v4, "pauseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:", self, sel_remotePause_);

  objc_msgSend(v4, "stopCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:", self, sel_remoteStop_);

  objc_msgSend(v4, "togglePlayPauseCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:", self, sel_remoteTogglePlayPauseCommand_completionHandler_);

  objc_msgSend(v4, "nextTrackCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:", self, sel_remoteNextTrack_);

  objc_msgSend(v4, "previousTrackCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:", self, sel_remotePreviousTrack_);

  objc_msgSend(v4, "seekForwardCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:", self, sel_remoteSeekForward_);

  objc_msgSend(v4, "seekBackwardCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:", self, sel_remoteSeekBackward_);

  objc_msgSend(v4, "changePlaybackRateCommand");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMediaRemoteController supportedPlaybackRates](self, "supportedPlaybackRates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSupportedPlaybackRates:", v12);

  objc_msgSend(v17, "addTarget:action:", self, sel_remoteChangePlaybackRate_);
  objc_msgSend(v4, "skipBackwardCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredIntervals:", &unk_1EA0F64F0);
  objc_msgSend(v13, "addTarget:action:", self, sel_remoteSkipBackward_);
  objc_msgSend(v4, "skipForwardCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPreferredIntervals:", &unk_1EA0F6508);
  objc_msgSend(v14, "addTarget:action:", self, sel_remoteSkipForward_);
  objc_msgSend(v4, "changePlaybackPositionCommand");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:", self, sel_remoteSetPlayhead_);

  objc_msgSend(v4, "changePlaybackPositionCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setCanBeControlledByScrubbing:", 1);
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (void)_updatePlaybackSpeed
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[IMMediaRemoteController player](self, "player");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[IMAVPlayer rateForPlaybackSpeed:](IMAVPlayer, "rateForPlaybackSpeed:", objc_msgSend(v8, "playbackSpeed"));
  v4 = v3;
  -[IMMediaRemoteController remoteCommandCenter](self, "remoteCommandCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changePlaybackRateCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v4;
  objc_msgSend(v6, "setPreferredRate:", v7);

}

- (IMAVPlayer)player
{
  return self->_player;
}

- (MPRemoteCommandCenter)remoteCommandCenter
{
  return self->_remoteCommandCenter;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[IMMediaRemoteController remoteCommandCenter](self, "remoteCommandCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMediaRemoteController tearDownRemoteCommandCenter:](self, "tearDownRemoteCommandCenter:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)IMMediaRemoteController;
  -[IMMediaRemoteController dealloc](&v5, sel_dealloc);
}

- (void)setSupportedPlaybackRates:(id)a3
{
  NSArray *v4;
  NSArray *supportedPlaybackRates;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;

  v4 = (NSArray *)a3;
  supportedPlaybackRates = self->_supportedPlaybackRates;
  if (supportedPlaybackRates != v4)
  {
    v12 = v4;
    v6 = -[NSArray isEqualToArray:](supportedPlaybackRates, "isEqualToArray:", v4);
    v4 = v12;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v12, "copy");
      v8 = self->_supportedPlaybackRates;
      self->_supportedPlaybackRates = v7;

      -[IMMediaRemoteController remoteCommandCenter](self, "remoteCommandCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changePlaybackRateCommand");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMMediaRemoteController supportedPlaybackRates](self, "supportedPlaybackRates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSupportedPlaybackRates:", v11);

      v4 = v12;
    }
  }

}

- (void)tearDownRemoteCommandCenter:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  objc_msgSend(v4, "pauseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:", self);

  objc_msgSend(v4, "stopCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:", self);

  objc_msgSend(v4, "togglePlayPauseCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:", self);

  objc_msgSend(v4, "nextTrackCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:", self);

  objc_msgSend(v4, "previousTrackCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeTarget:", self);

  objc_msgSend(v4, "seekForwardCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeTarget:", self);

  objc_msgSend(v4, "seekBackwardCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeTarget:", self);

  objc_msgSend(v4, "changePlaybackRateCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeTarget:", self);

  objc_msgSend(v4, "skipBackwardCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeTarget:", self);

  objc_msgSend(v4, "skipForwardCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeTarget:", self);

  objc_msgSend(v4, "changePlaybackPositionCommand");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "removeTarget:", self);
}

- (__CFArray)copySupportedCommands
{
  void *v2;
  const __CFArray *v3;
  const __CFAllocator *v4;
  __CFArray *MutableCopy;

  -[IMMediaRemoteController remoteCommandCenter](self, "remoteCommandCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFArray *)objc_msgSend(v2, "_copySupportedCommands");

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!v3)
    return CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
  MutableCopy = CFArrayCreateMutableCopy(v4, 0, v3);
  CFRelease(v3);
  return MutableCopy;
}

- (int64_t)remotePause:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t v12[16];

  v4 = (void *)MEMORY[0x1E0D7F1C0];
  v5 = a3;
  objc_msgSend(v4, "player");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "Remote pause", v12, 2u);
  }

  objc_msgSend(v5, "mediaRemoteOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D4CC10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[IMMediaRemoteController player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "pauseWithInitiator:interruptionEvent:", 1, v9);

  if ((_DWORD)v8)
    return 0;
  else
    return 200;
}

- (int64_t)remoteStop:(id)a3
{
  void *v3;
  int v4;

  -[IMMediaRemoteController player](self, "player", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pauseWithInitiator:", 1);

  if (v4)
    return 0;
  else
    return 200;
}

- (void)remoteTogglePlayPauseCommand:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[IMMediaRemoteController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaybackRequested");

  if (v8)
  {
    v9 = -[IMMediaRemoteController remotePause:](self, "remotePause:", v13);
    if (v6)
    {
      v10 = v9;
LABEL_8:
      v6[2](v6, v10);
    }
  }
  else
  {
    -[IMMediaRemoteController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "play");

    if (v6)
    {
      if (v12)
        v10 = 0;
      else
        v10 = 200;
      goto LABEL_8;
    }
  }

}

- (int64_t)remoteNextTrack:(id)a3
{
  void *v3;
  int v4;

  -[IMMediaRemoteController player](self, "player", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nextRemote");

  if (v4)
    return 0;
  else
    return 100;
}

- (int64_t)remotePreviousTrack:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isRequestingDefermentToPlaybackQueuePosition");
    -[IMMediaRemoteController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "previousRemote:", v5);

    if ((_DWORD)v5)
      v7 = 0;
    else
      v7 = 100;
  }
  else
  {
    v7 = 200;
  }

  return v7;
}

- (int64_t)remoteSeekForward:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 1)
  {
    -[IMMediaRemoteController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endSeek");
    goto LABEL_5;
  }
  if (!v4)
  {
    -[IMMediaRemoteController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startSeek:", 1);
LABEL_5:

  }
  return 0;
}

- (int64_t)remoteSeekBackward:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 1)
  {
    -[IMMediaRemoteController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endSeek");
    goto LABEL_5;
  }
  if (!v4)
  {
    -[IMMediaRemoteController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startSeek:", 0);
LABEL_5:

  }
  return 0;
}

- (int64_t)remoteChangePlaybackRate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  float v13;
  float v14;
  NSObject *v15;
  double v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  int v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaRemoteOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4CC88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_11:
    objc_msgSend(v4, "playbackRate");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134217984;
      v22 = v14;
      _os_log_impl(&dword_1DA478000, v15, OS_LOG_TYPE_DEFAULT, "MPChangePlaybackRateCommandEvent playbackRate: %f", (uint8_t *)&v21, 0xCu);
    }

    if (v14 == -1.0)
      goto LABEL_14;
    if (v14 != -2.0)
    {
      *(float *)&v16 = v14;
      v19 = +[IMAVPlayer playbackSpeedForRate:](IMAVPlayer, "playbackSpeedForRate:", v16);
      -[IMMediaRemoteController player](self, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = v19;
      goto LABEL_19;
    }
LABEL_16:
    v17 = -[IMMediaRemoteController _decreasePlayerPlaybackSpeed](self, "_decreasePlayerPlaybackSpeed");
    goto LABEL_17;
  }
  v7 = objc_msgSend(v6, "intValue");
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134217984;
    *(_QWORD *)&v22 = v7;
    _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "predefinedPlaybackSpeed: %lld", (uint8_t *)&v21, 0xCu);
  }

  if (v7 == 2)
    goto LABEL_16;
  if (v7 != 1)
  {
    if (!v7)
    {
      -[IMMediaRemoteController player](self, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 0;
LABEL_19:
      objc_msgSend(v9, "setPlaybackSpeed:", v11);

      v18 = 0;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_DEFAULT, "received unknown MRPlaybackSpeed. Falling back to using playbackRate.", (uint8_t *)&v21, 2u);
    }

    goto LABEL_11;
  }
LABEL_14:
  v17 = -[IMMediaRemoteController _increasePlayerPlaybackSpeed](self, "_increasePlayerPlaybackSpeed");
LABEL_17:
  v18 = v17;
LABEL_20:

  return v18;
}

- (int64_t)remoteSkipBackward:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(a3, "interval");
  v5 = v4;
  -[IMMediaRemoteController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMediaRemoteController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTime");
  objc_msgSend(v6, "setCurrentTimeRemote:", v8 - v5);

  return 0;
}

- (int64_t)remoteSkipForward:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[IMMediaRemoteController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMediaRemoteController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTime");
  v8 = v7;
  objc_msgSend(v4, "interval");
  v10 = v9;

  objc_msgSend(v5, "setCurrentTimeRemote:", v8 + v10);
  return 0;
}

- (int64_t)remoteSetPlayhead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[IMMediaRemoteController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "positionTime");
  v8 = v7;

  objc_msgSend(v6, "duration");
  if (v9 >= v8)
    v9 = v8;
  -[IMAVPlayer setCurrentTimeRemote:](self->_player, "setCurrentTimeRemote:", fmax(v9, 0.0));

  return 0;
}

- (int64_t)_increasePlayerPlaybackSpeed
{
  void *v3;
  BOOL v4;
  void *v6;
  unint64_t v7;
  void *v8;

  -[IMMediaRemoteController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IMAVPlayer isMaxSpeed:](IMAVPlayer, "isMaxSpeed:", objc_msgSend(v3, "playbackSpeed"));

  if (v4)
    return 1007;
  -[IMMediaRemoteController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[IMAVPlayer incrementPlaybackSpeed:](IMAVPlayer, "incrementPlaybackSpeed:", objc_msgSend(v6, "playbackSpeed"));

  -[IMMediaRemoteController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaybackSpeed:", v7);

  return 0;
}

- (int64_t)_decreasePlayerPlaybackSpeed
{
  void *v3;
  BOOL v4;
  void *v6;
  unint64_t v7;
  void *v8;

  -[IMMediaRemoteController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IMAVPlayer isMinSpeed:](IMAVPlayer, "isMinSpeed:", objc_msgSend(v3, "playbackSpeed"));

  if (v4)
    return 1007;
  -[IMMediaRemoteController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[IMAVPlayer decrementPlaybackSpeed:](IMAVPlayer, "decrementPlaybackSpeed:", objc_msgSend(v6, "playbackSpeed"));

  -[IMMediaRemoteController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaybackSpeed:", v7);

  return 0;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCommandCenter, 0);
  objc_storeStrong((id *)&self->_supportedPlaybackRates, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
